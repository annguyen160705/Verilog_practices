module dec_4x16 ( 	input 			en,
					input 	[3:0] 	in,
					output reg [15:0] 	out);

 // Sensitivity list: enable and 4-bit input
 always @ (en or in) begin
 	// When en=1: shift 1 left by 'in' positions (one-hot encoding)
 	// When en=0: all outputs are 0
 	// Example: in=4'b0101 (5) -> out=16'b0000_0000_0010_0000 (bit 5 set)
 out = en ? 1 << in: 0;
 end

endmodule