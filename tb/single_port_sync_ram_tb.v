module single_port_sync_ram_tb;
  parameter ADDR_WIDTH = 3;
  parameter DATA_WIDTH = 8;
  reg clk;
  reg [ADDR_WIDTH-1:0] address;
  reg [DATA_WIDTH-1:0] data_in;
  reg write_enable;
  wire [DATA_WIDTH-1:0] data_out;

  single_port_sync_ram #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)) u0 (
      .address(address),
      .clk(clk),
      .write_enable(write_enable),
      .data_in(data_in),
      .data_out(data_out)
    );

  integer i;
  always #10 clk = ~clk;
  initial begin
    $monitor("time=%0t clk=%0b we=%0b addr=%0d din=%0h dout=%0h",
              $time, clk, write_enable, address, data_in, data_out);
  end
  initial begin
    clk = 0;
    data_in = 0;
    write_enable = 0;
    repeat(3) @(posedge clk);

    for(i=0;i<(2**ADDR_WIDTH);i=i+1)begin
      address = i;
      write_enable = 1;
      data_in=1<<i;
      repeat (4) @(posedge clk);
    end
    for(i=0;i<(2**ADDR_WIDTH);i=i+1)begin
      address = i;
      write_enable = 0;
      repeat (4) @(posedge clk);
    end
    for(i=0;i<(2**ADDR_WIDTH);i=i+1)begin
      address = i;
      write_enable = 1;
      data_in=8'b11111111<<i;
      repeat (4) @(posedge clk);
    end
    for(i=0;i<(2**ADDR_WIDTH);i=i+1)begin
      address = i;
      write_enable = 0;
      repeat (4) @(posedge clk);
    end
    
  end
  
endmodule