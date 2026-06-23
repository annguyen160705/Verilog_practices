`timescale 1ns/1ps

module test_tb;

reg clock;
reg reset;
reg enable;

wire [3:0] counter_out;

test uut (
    .clock(clock),
    .reset(reset),
    .enable(enable),
    .counter_out(counter_out)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    enable = 0;

    #10;
    reset = 0;
    enable = 1;

    #100;

    $finish;
end

endmodule