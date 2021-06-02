// 同步十进制八位计数器（可自启动）
// 输入：CLK:时钟，Rd:置0输入
// 输出：Q:计数输出， Cout:进位输出
module SyncCounter_108(
    input CLK,
    input Rd,
    output reg [26:0] Q,
    output Cout
  );
  parameter Max = 1000;
  assign Cout = Q == Max - 1;
  always @(posedge CLK , posedge Rd)
  begin
    // 考虑到自启动，这里应该是大于等于号
    if(Rd)
      Q <= 0;
    else if(Q >= Max - 1)
      Q <= 0;
    else
      Q <= Q + 1;
  end

endmodule
