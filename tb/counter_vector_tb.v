module counter_vector_tb;

reg clk, rst_n,count_en,count_clr;
wire [7:0]cnt;
wire overflow;

counter_vector c0 (clk,rst_n,count_en,count_clr,cnt,overflow);

always #5 clk = ~clk;

initial begin
    count_en  = 0;
    count_clr = 0;
    clk       = 0;
    rst_n     = 0;

    #12 rst_n = 1;

    #20 count_en = 1;

    #50 count_clr = 1;
    #10 count_clr = 0;

    #40 count_en = 0;

    #30 count_en = 1;
end

initial begin
    $monitor("t=%0t cnt=%d overflow=%b",
             $time, cnt, overflow);
end

endmodule


module counter_vector (input clk,rst_n,count_en,count_clr, output reg [7:0] cnt,output overflow);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 8'h00;
    else if(count_clr)
        cnt <= 8'h00;
    else if(count_en)
        cnt <= cnt + 1;
end

assign overflow = (cnt == 8'hff);



endmodule

