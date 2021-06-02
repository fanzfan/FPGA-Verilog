// 程序功能：8421码 16位全加器
// 输入变量 A、B：参与加法运算的两个数，Cin：进位
// 输出变量 Y：AB的和，Cout：输出进位
module add16bit_8421(A, B, Cin, Y, Cout);
  input [15:0] A, B;
  input Cin;
  output [15:0] Y;
  output Cout;
  wire Cin0, Cin1, Cin2;
  add4bit_8421 U1(A[3:0], B[3:0], Cin, Y[3:0], Cin0);
  add4bit_8421 U2(A[7:4], B[7:4], Cin0, Y[7:4], Cin1);
  add4bit_8421 U3(A[11:8], B[11:8], Cin1, Y[11:8], Cin2);
  add4bit_8421 U4(A[15:12], B[15:12], Cin2, Y[15:12], Cout);
endmodule
