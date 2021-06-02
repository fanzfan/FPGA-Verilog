/*
 * 程序功能：Testbench for 74LS138--3线-8线译码器
 */
`timescale 1ns/100ps
module test_Decoder38_74LS138();
  reg S1, S2, S3;
  reg [2:0] A;
  wire [7:0] Y;
  Decoder38_74LS138 decoder(S1, S2, S3, A, Y);
  initial begin
        S1 = 0; S2 = 0; S3 = 0; A = 3'o7;
    # 1 S1 = 1; S2 = 1; S3 = 1; A = 3'o0;
    # 1 S1 = 1; S2 = 1; S3 = 1; A = 3'o1;
    # 1 S1 = 1; S2 = 1; S3 = 1; A = 3'o2;
    # 1 S1 = 1; S2 = 1; S3 = 1; A = 3'o3;
    # 1 S1 = 1; S2 = 1; S3 = 1; A = 3'o4;
    # 1 S1 = 1; S2 = 1; S3 = 1; A = 3'o5;
    # 1 S1 = 1; S2 = 1; S3 = 1; A = 3'o6;
    # 1 S1 = 1; S2 = 1; S3 = 1; A = 3'o7;
  end
endmodule
