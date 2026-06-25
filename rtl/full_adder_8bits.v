
module full_adder_8bits (input [7:0] a, input[7:0] b,input cin, output [7:0] sum, output carry);


assign {carry,sum} = a + b + cin;


endmodule