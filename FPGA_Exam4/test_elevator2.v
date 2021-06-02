`timescale 1ns/1ns
module test_elevator2();
  reg CLK, Reset;
  reg [9:0] buttons;
  wire[3:0] Layer;
  elevator2 E(CLK, Reset, buttons, Layer);
  initial
  begin
    // 初始化
    CLK = 0;
    Reset = 1;
    buttons = #2 10'b0000000001;
    Reset = 0;
    // 1,2楼有请求
    buttons = #20 10'b0000000110;
    // 取消1楼请求，2楼有请求
    buttons = #20 10'b0000000100;
    // 7，8，9楼有请求
    buttons = #20 10'b1110000000;
    // 取消7楼请求，8，9楼有请求
    buttons = #20 10'b1100000000;
    // 取消8楼请求，9楼有请求
    buttons = #20 10'b1000000000;
    // 4，5楼有请求
    buttons = #20 10'b0000011000;
    // 取消5楼请求，4楼有请求
    buttons = #20 10'b0000001000;
    // 0、8楼有请求
    buttons = #20 10'b0100000001;
    // 此时应是方向优先原则，取消0楼请求，8楼有请求
    buttons = #20 10'b0100000000;
    buttons = #20 10'b0000001000;
    buttons = #20 10'b0100000000;
  end
  always
  begin
    CLK = #1 ~CLK;
  end
endmodule