// 程序功能：16位全加器
// 输入变量 A、B：参与加法运算的两个数，Cin：进位
// 输出变量 Y：AB的和，Cout：输出进位
module add16bit(A, B, Cin, Y, Cout);
  parameter LENGTH = 16;
  input [LENGTH - 1:0] A, B;
  input Cin;
  output [LENGTH - 1:0] Y;
  output Cout;
  assign {Cout, Y} = A + B + Cin;

endmodule
