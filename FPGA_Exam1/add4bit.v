// 程序功能：4位全加器
// 输入变量 A、B：参与加法运算的两个数，Cin：进位
// 输出变量 Y：AB的和，Cout：输出进位
module add4bit(A, B, Cin, Y, Cout);
  input [3:0] A, B;
  input Cin;
  output [3:0] Y;
  output Cout;
  wire Cin0, Cin1, Cin2;
  add1bit U1(A[0], B[0], Cin, Y[0], Cin0);
  add1bit U2(A[1], B[1], Cin0, Y[1], Cin1);
  add1bit U3(A[2], B[2], Cin1, Y[2], Cin2);
  add1bit U4(A[3], B[3], Cin2, Y[3], Cout);
endmodule
