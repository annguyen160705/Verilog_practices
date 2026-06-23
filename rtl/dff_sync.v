module dff_sync 	( input d,
              input rstn,
              input clk,
              output reg q);

	always @ (posedge clk)
       if (!rstn)
          q <= 0;
       else
          q <= d;
endmodule