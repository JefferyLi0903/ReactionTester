module tester #(
    parameter FREQ = 50_000_000,
    parameter MAX_DELAY = 512, // unit: ms
    parameter MAX_SCALE = 8    // unit: s
) (
    input clk,
    input rstn,
    input start_button,
    input confirm_button,
    output reg hint,
    output reg [$clog2(MAX_DELAY) - 1 : 0] res,
    output wire irq,
    output reg [1:0] valid
);
    wire [9:0] rand_num_w;
    wire start;
    wire confirm;
    
    randomgen randomgen_u (
      .clk(clk),
      .rstn(rstn),
      .rand_num(rand_num_w)
    );
    
    reg [$clog2(MAX_SCALE) + 10 - 1:0] rand_num;
    always@(posedge clk or negedge rstn) begin
      if(!rstn) rand_num <= 0;
      else if(start) rand_num <= rand_num_w * 4 + 4096;
    end
    
    debouncer u1 (
      .clk(clk),
      .rstn(rstn),
      .button(start_button),
      .signal(start)
    );
    
    debouncer u2 (
      .clk(clk),
      .rstn(rstn),
      .button(confirm_button),
      .signal(confirm)
    );
    
    localparam IDLE = 2'b00, START = 2'b01, TEST = 2'b10, FINISH = 2'b11;
    reg [1:0] state, next_state;
    
    // Generate a counter & a timer 
    reg [$clog2(FREQ) - 1:0] counter;
    reg [$clog2(MAX_SCALE) + 10 - 1:0] timer;
    reg hint_q;
    always@(posedge clk or negedge rstn) begin
      if(!rstn || state == IDLE || state == FINISH || (!hint & hint_q)) begin
        counter <= 0;
        timer <= 0;
      end
      else if(state == START || state == TEST) begin
        counter <= counter + 1;
        if(counter == FREQ / 1000) begin
          counter <= 0;
          timer <= timer + 1;
        end
      end
    end
    
    localparam LEGAL = 2'b00, EARLY = 2'b01, LATE = 2'b10;
    // Generate Outputs
    always@(posedge clk or negedge rstn) begin
      if(!rstn) begin
        hint <= 1;
        hint_q <= 1;
        res <= 0;
        valid <= LEGAL;
      end
      else begin
        hint_q <= hint;
        if(state == START) begin
          if(timer == rand_num) hint <= 0;
          if(confirm) valid <= EARLY;
        end
        if(state == TEST) begin
          if(confirm) begin
            if (timer[$clog2(MAX_DELAY) - 1 : 0] >= 100) res <= timer[$clog2(MAX_DELAY) - 1 : 0];
            else valid <= EARLY;
          end
          else if(timer[$clog2(MAX_DELAY) - 1 : 0] == 511) valid <= LATE;
        end
      end
    end
    
    // State Machine
    
    always@(posedge clk or negedge rstn) begin
      if(!rstn) state <= IDLE;
      else state <= next_state;
    end
    
    always@(*) begin 
      case(state)
        IDLE: begin
          if(start) next_state = START;
          else next_state = IDLE;
        end
        START: begin
          if(timer == rand_num) next_state = TEST;
          else if(confirm) next_state = FINISH;
          else next_state = START;
        end
        TEST: begin
          if(confirm) next_state = FINISH;
          else next_state = TEST;
        end
        FINISH: begin
          if(start) next_state = START;
          else next_state = FINISH;
        end
        default: next_state = IDLE;
      endcase
    end
    
    // IRQ generation
    reg s_irq;
    always@(posedge clk) s_irq <= |res;
    assign irq = |res & !s_irq | valid[0];
    
endmodule
