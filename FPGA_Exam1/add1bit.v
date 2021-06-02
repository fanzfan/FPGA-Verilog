// 程序功能：1位全加器
// 输入变量 A、B：参与加法运算的两个数，Cin：进位
// 输出变量 Y：AB的和，Cout：输出进位
module add1bit(A, B, Cin, Y, Cout);
  input A, B, Cin;
  output Y, Cout;
  wire Y, Cout;
  assign Y = A ^ B ^ Cin;
  assign Cout = A & B | Cin & (A ^ B);

endmodule
