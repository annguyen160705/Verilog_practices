`timescale 1ps/1ps

module dff_tb;

reg clk;
reg d,rstn;
wire q;

dff uut (d, rstn, clk, q
);

initial begin
    clk = 0;
    rstn = 1;
    forever #5 clk = ~clk;   // chu kỳ 10ns
end

initial begin
    d = 0;

    forever #3  d = ~d; 

    #20 $finish;
end

initial begin
    $monitor("t=%0t clk=%b d=%b q=%b",
              $time, clk, d, q);
end

endmodule