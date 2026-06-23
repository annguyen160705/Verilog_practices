module gates (	input a, b,
				output c, d, e);

	and (c, a, b); 	// c is the output, a and b are inputs
	or  (d, a, b);	// d is the output, a and b are inputs
	xor (e, a, b); 	// e is the output, a and b are inputs
endmodule