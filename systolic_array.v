`include "block.v"
module systolic_array(inp_west0, inp_west4, inp_west8, inp_west12,
		      inp_north0, inp_north1, inp_north2, inp_north3,
		      clk, rst, done);
	input [31:0] inp_west0, inp_west4, inp_west8, inp_west12,
		      inp_north0, inp_north1, inp_north2, inp_north3;
    output reg done;
    input clk,rst;
    reg [3:0] count;






    
	wire [31:0] outp_south0, outp_south1, outp_south2, outp_south3, outp_south4, outp_south5, outp_south6, outp_south7, outp_south8, outp_south9, outp_south10, outp_south11, outp_south12, outp_south13, outp_south14, outp_south15;
	wire [31:0] outp_east0, outp_east1, outp_east2, outp_east3, outp_east4, outp_east5, outp_east6, outp_east7, outp_east8, outp_east9, outp_east10, outp_east11, outp_east12, outp_east13, outp_east14, outp_east15;
	wire [63:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15;


    block u0  (.inp_north(inp_north0), .inp_west(inp_west0),  .clk(clk), .rst(rst), .otp_south(outp_south0),  .otp_east(outp_east0),  .result(result0)); 
    block u1  (.inp_north(inp_north1), .inp_west(outp_east0), .clk(clk), .rst(rst), .otp_south(outp_south1),  .otp_east(outp_east1),  .result(result1));
    block u2  (.inp_north(inp_north2), .inp_west(outp_east1), .clk(clk), .rst(rst), .otp_south(outp_south2),  .otp_east(outp_east2),  .result(result2));
    block u3  (.inp_north(inp_north3), .inp_west(outp_east2), .clk(clk), .rst(rst), .otp_south(outp_south3),  .otp_east(outp_east3),  .result(result3));


    block u4  (.inp_north(outp_south0), .inp_west(inp_west4),  .clk(clk), .rst(rst), .otp_south(outp_south4),  .otp_east(outp_east4),  .result(result4));
    block u5  (.inp_north(outp_south1), .inp_west(outp_east4), .clk(clk), .rst(rst), .otp_south(outp_south5),  .otp_east(outp_east5),  .result(result5));
    block u6  (.inp_north(outp_south2), .inp_west(outp_east5), .clk(clk), .rst(rst), .otp_south(outp_south6),  .otp_east(outp_east6),  .result(result6));
    block u7  (.inp_north(outp_south3), .inp_west(outp_east6), .clk(clk), .rst(rst), .otp_south(outp_south7),  .otp_east(outp_east7),  .result(result7));


    block u8  (.inp_north(outp_south4), .inp_west(inp_west8),  .clk(clk), .rst(rst), .otp_south(outp_south8),  .otp_east(outp_east8),  .result(result8));
    block u9  (.inp_north(outp_south5), .inp_west(outp_east8), .clk(clk), .rst(rst), .otp_south(outp_south9),  .otp_east(outp_east9),  .result(result9));
    block u10 (.inp_north(outp_south6), .inp_west(outp_east9), .clk(clk), .rst(rst), .otp_south(outp_south10), .otp_east(outp_east10), .result(result10));
    block u11 (.inp_north(outp_south7), .inp_west(outp_east10),.clk(clk), .rst(rst), .otp_south(outp_south11), .otp_east(outp_east11), .result(result11));


    block u12 (.inp_north(outp_south8),  .inp_west(inp_west12), .clk(clk), .rst(rst), .otp_south(outp_south12), .otp_east(outp_east12), .result(result12));
    block u13 (.inp_north(outp_south9),  .inp_west(outp_east12),.clk(clk), .rst(rst), .otp_south(outp_south13), .otp_east(outp_east13), .result(result13));
    block u14 (.inp_north(outp_south10), .inp_west(outp_east13),.clk(clk), .rst(rst), .otp_south(outp_south14), .otp_east(outp_east14), .result(result14));
    block u15 (.inp_north(outp_south11), .inp_west(outp_east14),.clk(clk), .rst(rst), .otp_south(outp_south15), .otp_east(outp_east15), .result(result15));
    
    always @(posedge clk or posedge rst)begin
        if (rst) begin
            count <= 0;
            done <= 0;
        end 
        else if (!done) begin
            if (count == 4'd9) begin
            done <= 1;

            end else begin
            count <= count + 1'b1;
            end
        end
    end

    endmodule





