// 31码长m序列生成器，反馈系数为75
module m(
    input CLK, CLR,
    output OUT
  );
  // 75, 111 101
  reg[4:0] Q;
  wire C0;
  assign C0 = ~^Q[4:1];
  assign OUT = Q[4];
  
  always @(posedge CLK, posedge CLR)
    Q <= CLR ? 0 : {Q[3:0], C0};
  
endmodule
