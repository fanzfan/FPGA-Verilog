`timescale 1ns/1ns
module test_SyncCounter_108();
  reg CLK, Rd;
  wire[26:0] Q;
  SyncCounter_108 A(CLK, Rd, Q, Cout);
  initial
  begin
    Rd <= 1'b1;
    Rd <= #9 1'b0;
  end
  always
  begin
    CLK = 1'b0;
    CLK = #1 1'b1;
    #1;
  end
endmodule
