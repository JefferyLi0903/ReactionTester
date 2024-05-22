`timescale 1ns / 1ps
`define DELAY_LENGTH 500// Macro for max allowed delay. Unit: us

module debouncer #(
    parameter FREQ = 100_000_000
  ) (
    input clk,
    input rstn,
    input button,
    output signal
  );

  reg signal_q;
  reg signal_t;
  reg [$clog2(`DELAY_LENGTH * FREQ / 1_000_000) - 1 : 0] counter;
  always @(posedge clk or negedge rstn)
  begin
    if(!rstn || button)
      counter <= 0;
    else if(counter < FREQ * `DELAY_LENGTH / 1_000_000)
      counter <= counter + 1;
  end

  always @(posedge clk or negedge rstn)
  begin
    if(!rstn || button) begin
      signal_t <= 0;
      signal_q <= 0;
    end
    else if(counter == FREQ * `DELAY_LENGTH / 1_000_000)
    begin
      signal_t <= 1'b1;
      signal_q <= signal_t;
    end
  end
  assign signal = signal_t & !signal_q;
endmodule
