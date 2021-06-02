/*
 * 程序功能：Testbench for 74LS148--8线-3线译码器
 */
`timescale 1ns/100ps
module test_Encoder83_74LS148();
  reg EI;
  reg [7:0] in;
  wire [2:0] out;
  wire GS, EO;
  Encoder83_74LS148 encoder(EI, ~in, out, GS, EO);
  initial begin
         EI = 1'b1; in = 8'h00;
    # 1  EI = 1'b0; in = 8'hff;
    # 1  EI = 1'b0; in = 8'h00;
    # 1  EI = 1'b0; in = 8'h80;
    # 1  EI = 1'b0; in = 8'hc0;
    # 1  EI = 1'b0; in = 8'he0;
    # 1  EI = 1'b0; in = 8'hf0;
    # 1  EI = 1'b0; in = 8'hf8;
    # 1  EI = 1'b0; in = 8'hfc;
    # 1  EI = 1'b0; in = 8'hfe;
    # 1 $stop;
  end
endmodule
