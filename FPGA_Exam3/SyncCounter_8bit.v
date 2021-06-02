// 同步八位计数器
// 输入：CLK:时钟，Rd:置0输入
// 输出：Q， Cout:进位输出
module SyncCounter_8bit(
  input CLK, Rd, 
  output[7:0] Q, 
  output Cout
  );
  T_FlipFlop TF0(CLK, Rd, 1'b1, Q[0]);
  T_FlipFlop TF1(CLK, Rd, Q[0], Q[1]);
  T_FlipFlop TF2(CLK, Rd, &Q[1:0], Q[2]);
  T_FlipFlop TF3(CLK, Rd, &Q[2:0], Q[3]);
  T_FlipFlop TF4(CLK, Rd, &Q[3:0], Q[4]);
  T_FlipFlop TF5(CLK, Rd, &Q[4:0], Q[5]);
  T_FlipFlop TF6(CLK, Rd, &Q[5:0], Q[6]);
  T_FlipFlop TF7(CLK, Rd, &Q[6:0], Q[7]);
  // Q = 1111111 时，输出进位信号
  assign Cout = &Q;
endmodule
