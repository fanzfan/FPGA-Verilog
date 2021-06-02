`timescale 1ns/1ns
module test_traffic();
  reg CLK, Rd;
  wire[2:0] Lengthway, Crosswise;
  wire[5:0] Timer;
  traffic T(CLK, Rd, Lengthway, Crosswise, Timer);
  initial
  begin
    CLK = 0;
    Rd = 0;
    Rd = #3 1;
  end
  always
  begin
    CLK = #1 ~CLK;
  end
endmodule