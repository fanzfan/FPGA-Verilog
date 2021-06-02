`timescale 1ns/1ns
module test_AsyncCounter_8bit();
  reg CLK, Rd;
  wire[7:0] Q;
  AsyncCounter_8bit A(CLK, Rd, Q, Cout);
  initial
  begin
    Rd = 1'b1;
    Rd = #9 1'b0;
    #800 $stop;
  end
  always
  begin
    CLK = 1'b0;
    CLK = #1 1'b1;
    #1;
  end
endmodule
