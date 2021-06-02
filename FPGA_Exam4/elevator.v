// 电梯
`define TopLayer 10
`define BottomLayer 1
module elevator(
    input CLK,
    input[9:0] buttons,
    output reg[3:0] Layer
  );
  parameter MAX = `TopLayer;
  parameter MIN = `BottomLayer;

  // 状态定义
  parameter UP = 001, DOWN = 010, IDLE = 100;

  // 到达楼层后，取消请求
  //parameter one = 0000000001, two = 0000000010, three = 0000000100, four = 0000001000, five = 0000010000;
  //parameter six = 0000100000, seven = 0001000000, eight = 0010000000, nine = 0100000000, ten = 1000000000;

  // 状态
  reg[2:0] CurrentState, NextState;

  // 加减计数器模块
  always @(posedge CLK)
  begin
    if(Layer > MAX || Layer < MIN)
    begin
      Layer <= MIN;
    end
    else
    begin
      case (CurrentState)
        IDLE:
          Layer <= Layer;
        DOWN :
          Layer <= Layer==MIN ? Layer : Layer - 1;
        UP :
          Layer <= Layer==MAX ? Layer : Layer + 1;
        default :
          Layer <= MIN;
      endcase
    end
  end


  // 时序逻辑
  always @(posedge CLK)
  begin
    if(buttons == 0 || buttons[Layer - 1])
      CurrentState <= IDLE;
    else
      CurrentState <= NextState;
  end

  integer requestNum;
  // 状态转换
  always @(CurrentState, buttons)
  begin : A1
    integer i;
    case (CurrentState)
      IDLE :
      begin
        requestNum = 0;
        for(i = 0;i < MAX;i = i + 1)
          if(buttons[i])
            requestNum = requestNum + 1;
        if(requestNum==1)
        begin
          if(i > Layer)
            NextState <= UP;
          else
            NextState <= DOWN;
        end
      end
      UP :
      begin
        if(buttons == 0 || buttons[Layer - 1])
          NextState <= IDLE;
      end
      DOWN :
      begin
        if(buttons == 0 || buttons[Layer - 1])
          NextState <= IDLE;
      end
      default :
        NextState <= IDLE;
    endcase
  end
endmodule

