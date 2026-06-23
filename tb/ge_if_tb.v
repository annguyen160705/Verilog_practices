module ge_if_tb;
reg a,b,sel;
wire out0,out1;
integer i;

        my_design #(.USE_CASE(0)) u0 (.a(a), .b(b), .sel(sel), .out(out0));
        my_design #(.USE_CASE(1)) u1 (.a(a), .b(b), .sel(sel), .out(out1));

initial begin
    a = 0;
    b = 0;
    sel = 0;

    for (i=0; i<5 ; i=i+1) begin
        #10 a <= $random;
        b <= $random;
        sel <= $random;
        $display ("time=[%0t] i=%0d a=0x%0h b=0x%0h sel=0x%0h out0=0x%0h out1=0x%0h",$time, i, a, b, sel, out0, out1);
    end
end

endmodule