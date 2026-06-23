module gates_and_or_xor_tb;
	reg a, b;
	wire c, d, e;
	integer i;

	gates u0 ( .a(a), .b(b), .c(c), .d(d), .e(e));

	initial begin
		{a, b} = 0;

      $monitor ("[T=%0t a=%0b b=%0b c(and)=%0b d(or)=%0b e(xor)=%0b", $time, a, b, c, d, e);

		for (i = 0; i < 10; i = i+1) begin
			#1 	a <= $random;
				b <= $random;
		end
	end
endmodule