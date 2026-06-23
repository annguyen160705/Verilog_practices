module gates_tb;
reg a,b,c,d;
wire out1, out2, out3, out4, out5, out6, out7, out8;


gates_and and1 (	.a(a), .b(b), .c(c),.d(d), .y(out1));
gates_nand nand1 (	.a(a), .b(b), .c(c),.d(d), .y(out2));
gates_or or1 (	.a(a), .b(b), .c(c),.d(d), .y(out3));
gates_xor xor1 (	.a(a), .b(b), .c(c),.d(d), .y(out4));
gates_buf buf1 (	.a(a), .c(out5));
gates_nor nor1 (	.a(a), .b(b), .c(c),.d(d), .y(out6));
gates_nxor xor2 (	.a(a), .b(b), .c(c),.d(d), .y(out7));
gates_not not1 (	.a(a), .c(out8));



integer i;

initial begin
  for (i=0; i<16; i=i+1) begin
    {a,b,c,d} = i; // Assign the value of i to the inputs
    #10; // Wait for 10 time units
  end
end
    


endmodule