`timescale 1ns/1ns
module test_elevator();
  reg CLK;
  reg [9:0] buttons;
  wire[3:0] Layer;
  elevator E(CLK, buttons, Layer);
  initial
  begin
    CLK = 0;
    buttons = 10'b0000000001;
    buttons = #10 10'b0000000010;
    buttons = #10 10'b0100000000;
    buttons = #10 10'b0010000000;
    buttons = #10 10'b0000000001;
    buttons = #10 10'b1000000000;
    buttons = #10 10'b0000001000;
    buttons = #10 10'b0100000000;
  end
  always
  begin
    CLK = #1 ~CLK;
  end
endmodule