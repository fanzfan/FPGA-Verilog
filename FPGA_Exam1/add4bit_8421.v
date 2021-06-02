// 程序功能：8421码 4位全加器
// 输入变量 A、B：参与加法运算的两个数，Cin：进位
// 输出变量 Y：AB的和，Cout：输出进位
module add4bit_8421(A, B, Cin, Y, Cout);
  input [3:0] A, B;
  input Cin;
  output [3:0] Y;
  output Cout;
  assign {Cout, Y} = A + B + Cin > 9 ? A + B + Cin + 6 : A + B + Cin;
endmodule
