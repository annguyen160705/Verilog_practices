module full_adder_nbits #(parameter N = 8) 
(
    input [N-1:0] A,
    input [N-1:0] B,
    input  cin,
    output [N-1:0] C,
    output [N-1:0] cout);


genvar i;

generate
   for (i = 0; i < N; i = i + 1) begin : GEN_FA
        fulladder fa(A[i],B[i],(i==0) ? cin : cout[i-1],C[i],cout[i]);
    end 
endgenerate

endmodule