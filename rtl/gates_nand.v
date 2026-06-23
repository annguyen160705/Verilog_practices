module gates_nand (	input a, b,c,d,
				output y);
	nand (y, a, b); 	// y is the output, a and b are inputs
endmodule