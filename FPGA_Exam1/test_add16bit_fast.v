`timescale 1ns/1ns
module test_add16bit_fast();
    parameter LENGTH = 16;
    reg [LENGTH - 1:0] A, B;
    reg Cin;
    wire Cout;
    wire [LENGTH - 1:0] Y;
    add16bit_fast add(A, B, Cin, Y, Cout);
    initial begin
         A = 16'h0000; B = 16'h0000; Cin = 0;
    # 1  A = 16'h0000; B = 16'h0000; Cin = 1;
    # 1  A = 16'hffff; B = 16'hffff; Cin = 0;
    # 1  A = 16'hffff; B = 16'hffff; Cin = 1;
    # 1  A = 16'hffff; B = 16'h0000; Cin = 0;
    # 1  A = 16'hffff; B = 16'h0000; Cin = 1;
    # 1  A = 16'h0001; B = 16'h000E; Cin = 0;
    # 1  A = 16'h0001; B = 16'h000E; Cin = 1;
    # 1  $stop;
    end
endmodule