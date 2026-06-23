module bit_counter_tb;
reg clk;
reg rstn;
wire [3:0]out;

    bit_counter u0 (clk,rstn,out);
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rstn = 0;
        $monitor("[%0t] clk=%0h rstn=%0h out=%0h",$time,clk,rstn,out);
        
        #10 rstn = 1;
        #50 rstn = 0;
        #20 rstn = 0;
    end
endmodule