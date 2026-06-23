module johnson_ctr #( parameter WIDTH = 4

) (
    input clk,rstn, output reg [WIDTH-1:0] out
);
    reg [$clog2(WIDTH):0] i;
    always @(posedge clk) begin
        if (!rstn)
            out <= 1;
        else begin
            out[WIDTH-1] <= ~out[0];
            for(i=0;i<WIDTH-1;i=i+1) begin
                out[i] <= out[i+1];
            end
        end
    end
endmodule