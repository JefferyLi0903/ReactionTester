`timescale 1ns / 1ps
module randomgen_tb;

  // Parameters

  //Ports
  reg  clk;
  reg  rstn;
  wire [9:0] rand_num;

  randomgen  randomgen_inst (
               .clk(clk),
               .rstn(rstn),
               .rand_num(rand_num)
             );

  always #5  clk = ! clk ;
  initial begin
    clk = 1;
    rstn = 1;
    #10 rstn = 0;
    #10 rstn = 1;
    #15000 $finish;
  end
  
  always@(posedge clk) begin
    if(rand_num == 1) begin
      $display("Hit! Time: %0t", $time);
    end
  end
endmodule
