`timescale 1ns/1ns
module test_add1bit();
    reg A, B, Cin;
    wire Y, Cout;
    add1bit add(A, B, Cin, Y, Cout);
    initial begin
         A = 0; B = 0; Cin = 0;
    # 1  A = 0; B = 0; Cin = 1;
    # 1  A = 0; B = 1; Cin = 0;
    # 1  A = 0; B = 1; Cin = 1;
    # 1  A = 1; B = 0; Cin = 0;
    # 1  A = 1; B = 0; Cin = 1;
    # 1  A = 1; B = 1; Cin = 0;
    # 1  A = 1; B = 1; Cin = 1;
    # 1  $stop;
    end
endmodule