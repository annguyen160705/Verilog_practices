module debouncer_tb;

    reg clk;
    reg rst_n;
    reg button_in;
    wire button_out;

    debouncer #(
        .CLK_FREQ(1025),
        .DEBOUNCE_TIME_MS(23)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .button_in(button_in),
        .button_out(button_out)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        button_in = 0;

        // Reset
        #17;
        rst_n = 1;

        // Nhấn nút lần 1
        press_button;

        #227;

        // Nhả nút
        release_button;

        #317;

        // Nhấn nút lần 2
        press_button;

    end

    // Mô phỏng bounce khi nhấn
    task press_button;
    begin
        $display("Press button");

        button_in = 1; #2;
        button_in = 0; #2;
        button_in = 1;     // ổn định mức 1

        #100;
    end
    endtask

    // Mô phỏng bounce khi nhả
    task release_button;
    begin
        $display("Release button");

        button_in = 0; #2;
        button_in = 1; #2;
        button_in = 0; #2;
        button_in = 1; #2;
        button_in = 0; #15   // ổn định mức 0
        button_in = 1; #27
        button_in = 0;

        #100;
    end
    endtask

    initial begin
        $monitor("Time=%0t  in=%b  out=%b",
                 $time, button_in, button_out);
    end

endmodule