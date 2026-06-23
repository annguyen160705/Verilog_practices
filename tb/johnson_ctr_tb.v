module johnson_ctr_tb;
    parameter WIDTH = 4;
    reg clk,rstn;
    wire [WIDTH-1:0] out;

    johnson_ctr #(WIDTH) u0 (clk,rstn,out);

    always #10 clk = ~clk;

    initial begin
        {clk,rstn} = 0;

        $monitor ("[%0t] rstn = %0h out=%0h",$time,rstn,out);
        repeat(2) @(posedge clk);
        rstn = 1;
        repeat(15) @(posedge clk);
        $finish;
    end
endmodule