module first_counter_tb();

reg clock, reset, enable;
wire [3:0] counter_cout;

initial begin
    $display ("time\t clock reset enable counter");
    $display ("%g\t %b %b %b %b", 
    $time, clock, reset, enable, counter_out);
    clock = 1;
    reset = 0;
    enable = 0;
    #5 reset = 1;
    #10 reset =0;
    #5 enable = 1;
    #100 enable =0;
    #10 $finish;
end

always begin
    #5 clock = ~clock;
end

first_counter U_counter (
    clock,
    reset,
    enable,
    counter_out
);
endmodule
