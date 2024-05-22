`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 09:33:30 PM
// Design Name: 
// Module Name: tester_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module tester_tb;

//Ports
reg  clk;
reg  rstn;
reg  start_button;
reg  confirm_button;
wire  hint;
wire [8 : 0] res;

tester #(
  .FREQ(1000)
) tester_inst (
  .clk(clk),
  .rstn(rstn),
  .start_button(start_button),
  .confirm_button(confirm_button),
  .hint(hint),
  .res(res)
);

always #5  clk = ! clk ;
initial begin
  clk = 1;
  rstn = 1;
  start_button = 1;
  confirm_button = 1;
  #10 rstn = 0;
  #10 rstn = 1;
  start_button = 0;
  #2010 start_button = 1;
  #19010 confirm_button = 0;
  #2010 confirm_button = 1;
  #10 start_button = 0;
  #2010 start_button = 1;
end

endmodule
