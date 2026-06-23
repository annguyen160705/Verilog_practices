module det_1011_tb;
    reg clk,in,rstn;
    wire out1,out2;
    reg [1:0] l_dly;
    reg tb_in;
    integer i, loop = 50;
    always #10 clk = ~clk;

    det_1011 u0 (clk,rstn,in,out1);
    det_1011 u1 (clk,rstn,tb_in,out2);

    initial begin
        clk <= 0;
        rstn <= 0;
        in <= 0;

        repeat (5) @ (posedge clk);
        rstn <= 1;

        @(posedge clk) in <= 1;
        @(posedge clk) in <= 0;
        @(posedge clk) in <= 1;
        @(posedge clk) in <= 1;
        @(posedge clk) in <= 1;
        @(posedge clk) in <= 0;
        @(posedge clk) in <= 0;
        @(posedge clk) in <= 1;
        @(posedge clk) in <= 1;


    for ( i = 0 ; i < loop; i = i +1) begin
      l_dly = $urandom_range(0,3);
      repeat (l_dly) @ (posedge clk);
      tb_in = $urandom_range(0,1);
      in <= tb_in;
      $display("delay=%0d in=%0b", l_dly, tb_in);
    end

    end
endmodule