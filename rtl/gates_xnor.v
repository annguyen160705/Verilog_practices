module gates_xnor (	input a, b,c,d,
				output y);
	xnor (y, a, b); 	// y is the output, a and b are inputs
endmodule