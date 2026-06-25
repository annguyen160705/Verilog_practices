module half_adder (input a, b, output reg sum, cout);

    always @(a or b) begin
        sum = a ^ b;
        cout = a & b;
    end

endmodule

module half_adder_tb;
    reg a, b;
    wire sum, cout;

    half_adder ha (.a(a), .b(b), .sum(sum), .cout(cout));

    initial begin
        {a, b} = 0;

        $monitor ("T=%0t a=%0b b=%0b sum=%0b cout=%0b", $time, a, b, sum, cout);
        #10 a = 0 ; b = 0;
        #10 a= 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
    end 

endmodule