module full_adder_nbits_tb;

    parameter N = 10;
    reg [N-1:0] A;
    reg [N-1:0] B;
    reg cin ;
    wire [N-1:0] C;
    wire [N-1:0] cout;

    full_adder_nbits #(N) uut (
        .A(A),
        .B(B),
        .cin(cin),
        .C(C),
        .cout(cout)
    );

    initial begin
        // Initialize inputs
        A = 10'b0000000000;
        B = 10'b0000000000;
        cin = 0;

        // Wait for global reset
        #10;

        // Test case 1
        A = 10'b0000000000;
        B = 10'b0000000001;

        #10;

        // Test case 2
        A = 10'b1111111111; // 1023
        B = 10'b0000000001; // 1

        #10;

        // Test case 3
        A = 10'b1010101010; // 682
        B = 10'b0101010101; // 341

        #10;

        // Test case 4
        A = 10'b1111000000;
        B = 10'b0000111111; 

        #10;
    end
endmodule