module counter_8bits_tb;

reg clk, rst_n;
wire [7:0]cnt;
wire overflow;



counter c0 (clk,rst_n,cnt,overflow);

always #5 clk = ~clk;

initial begin
    
    clk = 0;
    rst_n = 0;

    #10 rst_n = 1;

    #100 rst_n = 0;

    #10 rst_n = 1;
end

initial begin
    $monitor("t=%0t cnt=%d overflow=%b",
             $time, cnt, overflow);
end

endmodule