module clock_gen_tb;
  wire clk1;
  wire clk2;
  wire clk3;
  wire clk4;
  reg  enable;
  reg [7:0] dly;

  

  clock_gen u0(enable, clk1);
  clock_gen #(.FREQ(200000)) u1(enable, clk2);
  clock_gen #(.FREQ(300000),.PHASE(30)) u2(enable, clk3);
  clock_gen #(.FREQ(400000),.PHASE(30),.DUTY(70)) u3(enable, clk4);

  


  initial begin
    enable = 0;
    #100;
    enable = 1;

  end
endmodule