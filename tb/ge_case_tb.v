module ge_case_tb;
  reg a, b, cin;
  wire sumha,sumfa, coutha, coutfa;
    integer i;
    my_adder #(.ADDER_TYPE(0)) u0 (.a(a), .b(b), .cin(cin), .sum(sumha), .cout(coutha));
    my_adder #(.ADDER_TYPE(1)) u1 (.a(a), .b(b), .cin(cin), .sum(sumfa), .cout(coutfa));
  initial begin
    a <= 0;
    b <= 0;
    cin <= 0;

    $monitor("a=0x%0h b=0x%0h cin=0x%0h coutha=0%0h sumha=0x%0h coutfa=0%0h  sumfa=0x%0h",a, b, cin, coutha,sumha, coutfa, sumfa);

    for (i = 0; i < 5; i = i + 1) begin
    #10 a <= $random;
        b <= $random;
        cin <= $random;
    end
  end
endmodule