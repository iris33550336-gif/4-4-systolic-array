`timescale 1ns/1ps

module block_tb;

reg [31:0]inp_north,inp_west;
reg rst,clk;

wire [31:0] otp_south, otp_east;
wire [63:0]result;

block uut(
   .inp_north(inp_north),
   .inp_west(inp_west),
   .clk(clk),
   .rst(rst),
   .otp_south(otp_south),
   .otp_east(otp_east),
   .result(result)
);

initial begin
    clk = 0;
    forever  #5 clk = ~clk;        
    
end

initial begin
    
    rst = 1;
    inp_north = 0;
    inp_west = 0;

    #10;
    rst = 0;

    inp_north = 2;
    inp_west = 3;
    #10;

    inp_north = 4;
    inp_west = 5;
    #10;

    inp_north = 0;
    inp_west = 0;
    #10;

    $finish;
end

initial begin
    $dumpfile("block.vcd");
    $dumpvars(0, block_tb);
end










endmodule