// 交通灯控制
module traffic (
    input CLK, Rd_,    // 时钟信号CLK与置零信号Rd_，低电平有效
    output reg[2:0] Lengthway, Crosswise,   // 横向与纵向红绿灯
    output reg [5:0] Timer    // 计时器输出
  );

  // 状态，采用格雷编码
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b11, S3 = 2'b10;
  // 定时器溢出
  wire Tl, Ts, Ty;
  // 定时器自动重置信号
  reg St;
  reg [1:0] CurrentState, NextState;

  // 定时器
  always @(posedge CLK, negedge Rd_)
  begin
    if(~Rd_)
      Timer = 0;
    else if(St)
      Timer = 0;
    else if(Timer==59)
      Timer = Timer;
    else
      Timer = Timer + 1;
  end
  assign Ty = Timer == 4;
  assign Ts = Timer == 29;
  assign Tl = Timer == 59;

  // 时序逻辑
  always @(posedge CLK, negedge Rd_)
  begin
    if(~Rd_)
      CurrentState <= S0;
    else
      CurrentState <= NextState;
  end

  // 状态转换逻辑
  always @(CurrentState, Tl, Ts, Ty)
  begin
    case(CurrentState)
      S0 :
      begin
        NextState <= Tl ? S1: S0;
        St <= Tl;
      end
      S1 :
      begin
        NextState <= Ty? S2: S1;
        St <= Ty;
      end
      S2 :
      begin
        NextState <= Ts ? S3: S2;
        St <= Ts;
      end
      S3 :
      begin
        NextState <= Ty ? S0: S3;
        St <= Ty;
      end
    endcase
  end

  // 将当前状态转换为路灯控制信号
  always @(CurrentState)
  begin
    case(CurrentState)
      S0 :
      begin
        Lengthway <= 3'b100;
        Crosswise <= 3'b001;
      end
      S1 :
      begin
        Lengthway <= 3'b010;
        Crosswise <= 3'b001;
      end
      S2 :
      begin
        Lengthway <= 3'b001;
        Crosswise <= 3'b100;
      end
      S3 :
      begin
        Lengthway <= 3'b001;
        Crosswise <= 3'b010;
      end
    endcase
  end
endmodule
