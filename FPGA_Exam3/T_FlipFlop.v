// T触发器，上升沿触发
// 输入：CLK:时钟，Rd:置0输入
module T_FlipFlop(
  input CLK, Rd, T, 
  output reg Q
  );
  always @(posedge CLK,posedge Rd)
    if(Rd)
      Q <= 1'b0;
    else
      Q <= T ? !Q : Q;
endmodule
