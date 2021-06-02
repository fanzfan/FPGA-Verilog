// 异步八位计数器
// 输入：CLK:时钟，Rd:置0输入
// 输出：Q， Cout:进位输出
module AsyncCounter_8bit(
  input CLK, Rd, 
  output[7:0] Q, 
  output Cout
  );
  T_FlipFlop TF0(CLK, Rd, 1'b1, Q[0]);
  T_FlipFlop TF1(~Q[0], Rd, 1'b1, Q[1]);
  T_FlipFlop TF2(~Q[1], Rd, 1'b1, Q[2]);
  T_FlipFlop TF3(~Q[2], Rd, 1'b1, Q[3]);
  T_FlipFlop TF4(~Q[3], Rd, 1'b1, Q[4]);
  T_FlipFlop TF5(~Q[4], Rd, 1'b1, Q[5]);
  T_FlipFlop TF6(~Q[5], Rd, 1'b1, Q[6]);
  T_FlipFlop TF7(~Q[6], Rd, 1'b1, Q[7]);
  // Q = 1111111 时，输出进位信号
  assign Cout = &Q;
endmodule
