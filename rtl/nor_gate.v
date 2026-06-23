module nor_gate (input a,b, output c);

    assign c = ~(a|b);
    
endmodule