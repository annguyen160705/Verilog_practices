module not_gate_tb;

    reg dauvao1;
    wire daura1;
    integer i;

    not_gate u0(.a(dauvao1),.c(daura1));

    initial begin
    dauvao1 = 0;

    $monitor ("a = %0b not = %0b",dauvao1,daura1);

    for (i =0; i<2 ; i=i+1)begin
        {dauvao1} = i;
        #10;
    end

    end


endmodule