module swap_demo;

reg clk;
reg swap_en;
reg [3:0] a, b;

// Tạo clock
always #5 clk = ~clk;

// Test
initial begin
    clk = 0;
    swap_en = 0;

    // ===== Trường hợp 1: Task =====
    a = 5;
    b = 10;
    $display("Before task : a=%0d, b=%0d", a, b);

    swap(a, b);

    $display("After task  : a=%0d, b=%0d", a, b);

    // ===== Trường hợp 2: Always =====
    #10;
    a = 3;
    b = 7;
    $display("\nBefore always: a=%0d, b=%0d", a, b);

    swap_en = 1;
    #10;          // Chờ 1 cạnh lên của clock
    swap_en = 0;

    $display("After always : a=%0d, b=%0d", a, b);

    #10 $finish;
end

// Swap bằng task (blocking)
task swap;
    inout [3:0] a;
    inout [3:0] b;
    reg [3:0] temp;
    begin
        temp = a;
        a    = b;
        b    = temp;
    end
endtask

// Swap bằng non-blocking trong always
always @(posedge clk) begin
    if (swap_en) begin
        a <= b;
        b <= a;
    end
end

endmodule