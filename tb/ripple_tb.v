module ripple_tb;

reg clk,rstn;
wire [3:0] out;

ripple u0 (clk,rstn,out);
always #5 clk = ~clk;

initial begin
    rstn <= 0;
    clk <= 0;
    $monitor("[%0t] clk=%0h rstn=%0h qn3=%0b qn2=%0b qn1=%0b qn0=%0b out=%0h",       
            $time,
            clk,
            rstn,
            u0.qn3,
            u0.qn2,
            u0.qn1,
            u0.qn0,
            out);
        
    repeat (4) @ (posedge clk);
    rstn <= 1;
    repeat (25) @ (posedge clk);
    $finish;
end
endmodule