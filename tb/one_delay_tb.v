module one_delay_tb;
  reg a, b;
  wire out1 ;

  one_delay d0 (.out1(out1), .a(a), .b(b));

  initial begin
    {a, b} = 0;

    $monitor ("T=%0t a=%0b b=%0b and=%0b", $time, a, b, out1);

    #10 a = 1;
    #10 b = 1;
    #10 a = 0;
    #10 b = 0;
  end
endmodule