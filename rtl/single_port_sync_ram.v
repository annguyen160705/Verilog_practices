module single_port_sync_ram
#(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 8
)
(
    input wire [ADDR_WIDTH-1:0] address,
    input wire clk,
    input wire write_enable,
    input wire [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out
);

reg [DATA_WIDTH-1:0] memory [0:(2**ADDR_WIDTH - 1)];

always @(posedge clk) begin
    if (write_enable) begin
       memory[address] <= data_in;
    end else begin
      data_out <= memory[address];
    end
end

endmodule