module jk_ff_tb;
    reg j;
    reg k;
    reg clk;
    wire q;
    

    jk_ff jk0 ( .j(j),.k(k),.clk(clk),.q(q));
    always #5 clk = ~clk;
    initial begin
    clk = 0;
      j = 0;
      k = 0;

      #5 j = 0;
         k = 1;
      #20 j = 1;
          k = 0;
      #20 j = 1;
          k = 1;
    end

   initial
      $monitor ("j=%0d k=%0d q=%0d", j, k, q);
endmodule