`timescale 1ns/1ns
module test_taillamp();
  reg CLK, HAZ, LEFT, RIGHT;
  wire [5:0] lamp;
  taillamp T(CLK, HAZ, LEFT, RIGHT, lamp);
  initial
  begin
    CLK = 0;
    LEFT = 0;
    RIGHT = 0;
    HAZ = 0;
    HAZ = #5 1;
    HAZ = #5 0;
    RIGHT = #8 1;
    RIGHT = #8 0;
    LEFT = #8 1;
    LEFT = #8 0;
    HAZ = 1;
  end
  always
  begin
    CLK = #1 ~CLK;
  end
endmodule