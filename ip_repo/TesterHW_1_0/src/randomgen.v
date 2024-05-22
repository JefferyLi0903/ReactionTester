module randomgen (
    input clk,
    input rstn,
    output reg [9:0] rand_num
  );
  always @(posedge clk or negedge rstn)
  begin
    if(!rstn)
    begin
      rand_num <= 1;
    end
    else
    begin
      rand_num[9] <= rand_num[8];
      rand_num[8] <= rand_num[7];
      rand_num[7] <= rand_num[6];
      rand_num[6] <= rand_num[5];
      rand_num[5] <= rand_num[4];
      rand_num[4] <= rand_num[3];
      rand_num[3] <= rand_num[2];
      rand_num[2] <= rand_num[1];
      rand_num[1] <= rand_num[0];
      rand_num[0] <= rand_num[2] ^ rand_num[9];
    end
  end
endmodule
