`timescale 1ns/1ns
module test_m();
  reg CLK, CLR;
  wire OUT;
  m M0(CLK, CLR, OUT);
  initial
  begin
    CLR = 1'b1;
    CLR = #3 1'b0;
  end
  always
  begin
    CLK = 1'b0;
    CLK = #1 1'b1;
    #1;
  end
endmodule
