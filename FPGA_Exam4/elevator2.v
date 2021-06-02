// 电梯
// 输入：CLK：时钟，buttons：每个楼层的请求，如button[0]=1代表0楼有请求
// 输出：Layer 当前层数
`define TopLayer 10
`define BottomLayer 1
module elevator2(
    input CLK, Reset,
    input[`TopLayer - `BottomLayer :0] buttons,
    output reg[3:0] Layer
  );

  // 状态定义
  parameter UP = 001, DOWN = 010, IDLE = 100;

  // 状态寄存器
  reg[2:0] CurrentState, NextState;

  // 加减计数器控制
  reg positive, negative, freeze;
  wire[3:0] Q;

  // 加减计数器模块
  Ad_Counter add(~CLK, Reset, positive, negative, freeze, Q);

  // 根据当前状态调制加减计数器的工作方式
  always @(CurrentState)
  begin
    positive <= CurrentState[0];
    negative <= CurrentState[1];
    freeze <= CurrentState[2];
  end

  // 将加减计数器的输出赋予Layer
  always @(Q)
    Layer <= Q;

  // 时序逻辑
  always @(posedge CLK)
  begin
    if(buttons[Layer] || buttons == 0)
      CurrentState <= IDLE;
    else
      CurrentState <= NextState;
  end

  // 状态转移
  always @(CurrentState, buttons)
  begin
    case (CurrentState)
      // 电梯空闲时，优先方向：下降
      IDLE :
        if(buttons[0])
          NextState <= DOWN;
        else if(buttons[1])
          NextState <= Layer < 1 ? UP : DOWN;
        else if(buttons[2])
          NextState <= Layer < 2 ? UP : DOWN;
        else if(buttons[3])
          NextState <= Layer < 3 ? UP : DOWN;
        else if(buttons[4])
          NextState <= Layer < 4 ? UP : DOWN;
        else if(buttons[5])
          NextState <= Layer < 5 ? UP : DOWN;
        else if(buttons[6])
          NextState <= Layer < 6 ? UP : DOWN;
        else if(buttons[7])
          NextState <= Layer < 7 ? UP : DOWN;
        else if(buttons[8])
          NextState <= Layer < 8 ? UP : DOWN;
        else if(buttons[9])
          NextState <= UP;
      // 电梯上升时，优先方向：上升
      UP :
        if(buttons[9])
          NextState <= UP;
        else if(buttons[8])
          NextState <= Layer <= 8 ? UP : DOWN;
        else if(buttons[7])
          NextState <= Layer <= 7 ? UP : DOWN;
        else if(buttons[6])
          NextState <= Layer <= 6 ? UP : DOWN;
        else if(buttons[5])
          NextState <= Layer <= 5 ? UP : DOWN;
        else if(buttons[4])
          NextState <= Layer <= 4 ? UP : DOWN;
        else if(buttons[3])
          NextState <= Layer <= 3 ? UP : DOWN;
        else if(buttons[2])
          NextState <= Layer <= 2 ? UP : DOWN;
        else if(buttons[1])
          NextState <= Layer <= 1 ? UP : DOWN;
        else if(buttons[0])
          NextState <= DOWN;
      // 电梯下降时，优先方向：下降
      DOWN :
        if(buttons[0])
          NextState <= DOWN;
        else if(buttons[1])
          NextState <= Layer < 1 ? UP : DOWN;
        else if(buttons[2])
          NextState <= Layer < 2 ? UP : DOWN;
        else if(buttons[3])
          NextState <= Layer < 3 ? UP : DOWN;
        else if(buttons[4])
          NextState <= Layer < 4 ? UP : DOWN;
        else if(buttons[5])
          NextState <= Layer < 5 ? UP : DOWN;
        else if(buttons[6])
          NextState <= Layer < 6 ? UP : DOWN;
        else if(buttons[7])
          NextState <= Layer < 7 ? UP : DOWN;
        else if(buttons[8])
          NextState <= Layer < 8 ? UP : DOWN;
        else if(buttons[9])
          NextState <= UP;
      // 电梯启动时，优先方向：下降
      default:
      begin
        if(buttons[0])
          NextState <= DOWN;
        else if(buttons[1])
          NextState <= Layer < 1 ? UP : DOWN;
        else if(buttons[2])
          NextState <= Layer < 2 ? UP : DOWN;
        else if(buttons[3])
          NextState <= Layer < 3 ? UP : DOWN;
        else if(buttons[4])
          NextState <= Layer < 4 ? UP : DOWN;
        else if(buttons[5])
          NextState <= Layer < 5 ? UP : DOWN;
        else if(buttons[6])
          NextState <= Layer < 6 ? UP : DOWN;
        else if(buttons[7])
          NextState <= Layer < 7 ? UP : DOWN;
        else if(buttons[8])
          NextState <= Layer < 8 ? UP : DOWN;
        else if(buttons[9])
          NextState <= UP;
      end
    endcase
  end
endmodule

