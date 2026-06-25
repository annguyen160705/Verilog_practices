
module counter (input clk,rst_n, output [7:0] cnt,output overflow);

wire [7:0] cnt_pre;

full_adder_8bits f0 (cnt, 8'd1, 1'b0, cnt_pre, overflow );

dff_async d0 (cnt_pre[0], rst_n, clk, cnt[0]);
dff_async d1 (cnt_pre[1], rst_n, clk, cnt[1]);
dff_async d2 (cnt_pre[2], rst_n, clk, cnt[2]);
dff_async d3 (cnt_pre[3], rst_n, clk, cnt[3]);
dff_async d4 (cnt_pre[4], rst_n, clk, cnt[4]);
dff_async d5 (cnt_pre[5], rst_n, clk, cnt[5]);
dff_async d6 (cnt_pre[6], rst_n, clk, cnt[6]);
dff_async d7 (cnt_pre[7], rst_n, clk, cnt[7]);

endmodule






