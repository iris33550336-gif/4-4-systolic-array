module block(inp_north,inp_west,clk,rst,otp_south,otp_east,result);
    input  [31:0] inp_north,inp_west;
    output reg [31:0] otp_south,otp_east;
    input clk,rst;
    output reg [63:0] result;

    wire [63:0] multi;

    always @(posedge clk or posedge rst )begin
        if (rst) begin
          result <= 0;
          otp_east <= 0;
          otp_south <= 0;
        end

        else begin
          result <= result + multi;
          otp_south <= inp_north;
          otp_east <= inp_west;
        end
    end

    assign multi = inp_north * inp_west;

    endmodule     