module mux_2x1 (input a,b,sel, output reg c);

always @(*) begin

c = sel ? a : b;

end

endmodule