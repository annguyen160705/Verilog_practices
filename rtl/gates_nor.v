module gates_nor (	input a, b,c,d,
				output y);
	nor (y, a, b); 	// y is the output, a and b are inputs
endmodule