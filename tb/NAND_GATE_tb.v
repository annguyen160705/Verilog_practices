module NAND_GATE_tb;

    reg dauvao1,dauvao2;
    wire daura1;
    integer i;

    NAND_GATE u0 (dauvao1,dauvao2,daura1);

    initial begin
    dauvao1 = 0;
    dauvao2 = 0;

    $monitor ("a = %0b b = %0b and = %0b",dauvao1,dauvao2,daura1);

    for(i=0;i<4; i=i+1) begin
        {dauvao1,dauvao2} = i;
        #10;
    end
    end
endmodule