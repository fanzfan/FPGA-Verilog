// 加减计数器
// 输入：positive：递增计数，negative：递减计数，freeze：冻结，使不工作
// 输出：Top：Q最大，Bottom：Q最小，
module Ad_Counter(
    input CLK, Reset,
    input positive, negative, freeze,
    output reg[3:0] Q
  );

  parameter MAX = 9;
  parameter MIN = 0;


  always @(posedge CLK, posedge Reset)
  begin
    if(Reset)
      Q <= 0;
    else if(Q > MAX)
      Q<= 0;
    else if(freeze)
      ;
    else if(positive)
      Q <= Q==MAX ? Q :Q + 1'b1;
    else if(negative)
      Q <= Q==MIN ? Q :Q - 1'b1;
    else
      ;
  end

endmodule
