// 程序功能：4位全加器（作为16位全加器的组成部分）
// 输入变量 A、B：参与加法运算的两个数，Cin：进位
// 输出变量 Y：AB的和，G、P：输出至上级计算进位
module add4bit_fast(A, B, Cin, Y, G, P);
  input [3:0] A, B;
  input Cin;
  output [3:0] Y;
  output G, P;
  wire [3:0] g, p;
  wire Cout0, Cout1, Cout2;
  assign g = A & B;
  assign p = A ^ B;
  assign Cout0 = g[0] | p[0] & Cin;
  assign Cout1 = g[1] | g[0] & p[1]| p[0] & p[1] & Cin;
  assign Cout2 = g[2] | g[1] & p[2] | g[0] & p[1] & p[2]| p[0] & p[1] & p[2] & Cin;
  assign Y[0] = p[0] ^ Cin;
  assign Y[1] = p[1] ^ Cout0;
  assign Y[2] = p[2] ^ Cout1;
  assign Y[3] = p[3] ^ Cout2;
  assign G = g[3] | g[2] & p[3] | g[1] & p[2] & p[3] | g[0] & p[1] & p[2] & p[3];
  assign P = p[3] & p[2] & p[1] & p[0];
endmodule
