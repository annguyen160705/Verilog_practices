module nor_gate_tb;

    reg dauvao1,dauvao2;
    wire daura1;
    integer i;

    nor_gate u0(.a(dauvao1),.b(dauvao2),.c(daura1));

    initial begin
    dauvao1 = 0;
    dauvao2 = 0;

    $monitor ("a = %0b b = %0b nor = %0b",dauvao1,dauvao2,daura1);

    for (i =0; i<4 ; i=i+1)begin
        {dauvao1,dauvao2} = i;
        #10;
    end

    end


endmodule