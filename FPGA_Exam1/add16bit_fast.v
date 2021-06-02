// 程序功能：16位全加器
// 输入变量 A、B：参与加法运算的两个数，Cin：进位
// 输出变量 Y：AB的和，Cout：输出进位
module add16bit_fast(A, B, Cin, Y, Cout);
  input [15:0] A, B;
  input Cin;
  output [15:0] Y;
  output Cout;
  wire [3:0] G, P;
  wire Cout0, Cout1, Cout2;
  add4bit_fast U1(A[3:0], B[3:0], Cin, Y[3:0], G[0], P[0]);
  add4bit_fast U2(A[7:4], B[7:4], Cout0, Y[7:4], G[1], P[1]);
  add4bit_fast U3(A[11:8], B[11:8], Cout1, Y[11:8], G[2], P[2]);
  add4bit_fast U4(A[15:12], B[15:12], Cout2, Y[15:12], G[3], P[3]);
  assign Cout0 = G[0] | P[0] & Cin;
  assign Cout1 = G[1] | G[0] & P[1]| P[0] & P[1] & Cin;
  assign Cout2 = G[2] | G[1] & P[2] | G[0] & P[1] & P[2]| P[0] & P[1] & P[2] & Cin;
  assign Cout = G[3] | G[2] & P[3] | G[1] & P[2] & P[3] | G[0] & P[1] & P[2] & P[3] | P[0] & P[1] & P[2] & P[3] & Cin;
endmodule
