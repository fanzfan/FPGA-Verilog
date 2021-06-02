// 汽车尾灯控制
// 输入：HAZ：刹车，LEFT：左转，RIGHT：右转
// 输出：lamp：尾灯控制信号
module taillamp(
    input CLK, HAZ, LEFT, RIGHT,
    output [5:0] lamp
  );

  reg[13:0] CurrentState, NextState;   // out是主电路输出，lamp为亮灯控制

  // 状态定义，采用独热码，在状态位里编码输出，避免了毛刺
  parameter L1 = 14'b00000001_001_000, L2 = 14'b00000010_011_000, L3 = 14'b00000100_111_000;
  parameter R1 = 14'b00001000_000_100, R2 = 14'b00010000_000_110, R3 = 14'b00100000_000_111;
  parameter IDLE = 14'b01000000_000_000, LR3 = 14'b10000000_111_111;

  // 时序逻辑
  always @(posedge CLK, posedge HAZ)
  begin
    if(HAZ)
      CurrentState <= CurrentState == LR3 ? IDLE : LR3;
    else if(LEFT || RIGHT)
      CurrentState <= NextState;
    else
      CurrentState = IDLE;
  end

  // 状态转换
  always @(CurrentState, LEFT, RIGHT)
  begin
    case (CurrentState)
      L1 :
        NextState <= HAZ ? LR3 : L2;
      L2 :
        NextState <= HAZ ? LR3 : L3;
      L3 :
        NextState <= HAZ ? LR3 : IDLE;
      R1 :
        NextState <= HAZ ? LR3 : R2;
      R2 :
        NextState <= HAZ ? LR3 : R3;
      R3 :
        NextState <= HAZ ? LR3 : IDLE;
      default:
      begin
        if(RIGHT || LEFT)
          NextState <= RIGHT ? R1 : L1;
        else
          NextState <= IDLE;
      end
    endcase
  end

  // 尾灯控制信号输出
  assign lamp = CurrentState[5:0];
endmodule
