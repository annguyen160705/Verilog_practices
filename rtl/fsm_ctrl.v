module fsm_ctrl 
# (parameter UNLOCK = 1'b1,
    parameter LOCK   = 1'b0)

(input clk,rst_n,coin,start, 
output wire lock_moore,
output wire lock_mealy);


wire out1,out2,state,state_pre;

mux_2x1 m1 (UNLOCK,state,coin,out1);
mux_2x1 m2 (LOCK,state,start,out2);
mux_2x1 m3 (out2,out1,state,state_pre);

dff_async dff1 (state_pre,rst_n,clk,state);

assign lock_moore = state;
assign lock_mealy = state_pre;

endmodule