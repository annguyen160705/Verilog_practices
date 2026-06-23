module lifo_tb;

    parameter WIDTH = 16;
    parameter DEPTH = 4;

    reg                 clk;
    reg                 rst;
    reg                 push;
    reg                 pop;
    reg  [WIDTH-1:0]    data_in;
    wire [WIDTH-1:0]    data_out;
    wire                empty;
    wire                full;

    lifo #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) uut (
        .clk      (clk),
        .rst      (rst),
        .push     (push),
        .pop      (pop),
        .data_in  (data_in),
        .data_out (data_out),
        .empty    (empty),
        .full     (full)
    );

    //------------------------------------------
    // Clock
    //------------------------------------------
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    //------------------------------------------
    // Monitor
    //------------------------------------------
    initial begin
        $monitor(
            "[%0t] push=%0b pop=%0b din=%0h dout=%0h sp=%0d empty=%0b full=%0b",
            $time,
            push,
            pop,
            data_in,
            data_out,
            uut.stack_ptr,
            empty,
            full
        );
    end

    //------------------------------------------
    // Test
    //------------------------------------------
    initial begin

        rst     = 1;
        push    = 0;
        pop     = 0;
        data_in = 0;

        //--------------------------------------
        // Reset
        //--------------------------------------
        repeat(2) @(posedge clk);
        rst = 0;

        //--------------------------------------
        // Push 4 values
        //--------------------------------------
        @(posedge clk);
        push    = 1;
        data_in = 16'h0011;

        @(posedge clk);
        data_in = 16'h0022;

        @(posedge clk);
        data_in = 16'h0033;

        @(posedge clk);
        data_in = 16'h0044;

        //--------------------------------------
        // Stop push
        //--------------------------------------
        @(posedge clk);
        push = 0;

        //--------------------------------------
        // Check FULL
        //--------------------------------------
        if(full)
            $display("FULL FLAG PASS");
        else
            $display("FULL FLAG FAIL");

        //--------------------------------------
        // Push when full
        //--------------------------------------
        @(posedge clk);
        push    = 1;
        data_in = 16'hAAAA;

        @(posedge clk);
        push = 0;

        //--------------------------------------
        // Pop all values
        //--------------------------------------
        @(posedge clk);
        pop = 1;

        repeat(4)@(posedge clk);

        //--------------------------------------
        // Stop pop
        //--------------------------------------
        pop = 0;

        //--------------------------------------
        // Check EMPTY
        //--------------------------------------
        if(empty)
            $display("EMPTY FLAG PASS");
        else
            $display("EMPTY FLAG FAIL");

        //--------------------------------------
        // Pop when empty
        //--------------------------------------
        @(posedge clk);
        pop = 1;

        @(posedge clk);
        pop = 0;

        //--------------------------------------
        // Finish
        //--------------------------------------
        #20;

    end

endmodule