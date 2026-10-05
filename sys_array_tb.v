

module systolic_array_tb;

reg clk,rst;
reg [31:0] inp_west0, inp_west4, inp_west8, inp_west12;
reg [31:0] inp_north0, inp_north1, inp_north2, inp_north3;
wire done;

systolic_array dut(
    .inp_north0(inp_north0),
    .inp_north1(inp_north1),
    .inp_north2(inp_north2),
    .inp_north3(inp_north3),
    .inp_west0(inp_west0),
    .inp_west4(inp_west4),
    .inp_west8(inp_west8),
    .inp_west12(inp_west12),
    .clk(clk),
    .rst(rst),
    .done(done)
); 
always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
            
    end

    initial begin
        rst = 1;
        #3 rst = 0;
    end

    initial begin
        inp_west0 = 0;
        #3  inp_west0 <= 32'd3;
        #10 inp_west0 <= 32'd2;
        #10 inp_west0 <= 32'd1;
        #10 inp_west0 <= 32'd0;
    end

    initial begin
        inp_west4 = 0;
        #13 inp_west4 <= 32'd7;
        #10 inp_west4 <= 32'd6;
        #10 inp_west4 <= 32'd5;
        #10 inp_west4 <= 32'd4;
        #10 inp_west4 <= 32'd0;
    end

    initial begin
        inp_west8 = 0;
        #23 inp_west8 <= 32'd11;
        #10 inp_west8 <= 32'd10;
        #10 inp_west8 <= 32'd9;
        #10 inp_west8 <= 32'd8;
        #10 inp_west8 <= 32'd0;
    end

    initial begin
        inp_west12 = 0;
        #33 inp_west12 <= 32'd15;
        #10 inp_west12 <= 32'd14;
        #10 inp_west12 <= 32'd13;
        #10 inp_west12 <= 32'd12;
        #10 inp_west12 <= 32'd0;
    end

    initial begin
        inp_north0 = 0;
        #3  inp_north0 <= 32'd12;
        #10 inp_north0 <= 32'd8;
        #10 inp_north0 <= 32'd4;
        #10 inp_north0 <= 32'd0;
    end

    initial begin
        inp_north1 = 0;
        #13 inp_north1 <= 32'd13;
        #10 inp_north1 <= 32'd9;
        #10 inp_north1 <= 32'd5;
        #10 inp_north1 <= 32'd1;
        #10 inp_north1 <= 32'd0;
    end

    initial begin
        inp_north2 = 0;
        #23 inp_north2 <= 32'd14;
        #10 inp_north2 <= 32'd10;
        #10 inp_north2 <= 32'd6;
        #10 inp_north2 <= 32'd2;
        #10 inp_north2 <= 32'd0;
    end

    initial begin
        inp_north3 = 0;
        #33 inp_north3 <= 32'd15;
        #10 inp_north3 <= 32'd11;
        #10 inp_north3 <= 32'd7;
        #10 inp_north3 <= 32'd3;
        #10 inp_north3 <= 32'd0;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, dut);

        
        #100;

        $display("done = %b", done);
        $display("results: %0d %0d %0d %0d",
                 dut.result0, dut.result1, dut.result2, dut.result3);
        $display("         %0d %0d %0d %0d",
                 dut.result4, dut.result5, dut.result6, dut.result7);
        $display("         %0d %0d %0d %0d",
                 dut.result8, dut.result9, dut.result10, dut.result11);
        $display("         %0d %0d %0d %0d",
                 dut.result12, dut.result13, dut.result14, dut.result15);

        $finish;
    end

endmodule


