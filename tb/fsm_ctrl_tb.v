module fsm_ctrl_tb;

reg clk,rst_n,coin,start;
wire lock_moore,lock_mealy;
fsm_ctrl  #(
    .UNLOCK(1'b1),.LOCK(1'b0)
) fsm_ctrl1 (
    clk,rst_n,coin,start,lock_moore,lock_mealy
);

always #15 clk = ~clk;


initial begin
    clk = 0;
    rst_n = 0;
    coin = 0;
    start = 0;

    #10 rst_n = 1;

// Trường hợp 1: Hành vi sai - Bấm Start khi CHƯA bỏ Coin
        // ---------------------------------------------------------
        #30 start = 1;    // t = 40
        #20 start = 0;    // t = 60
        // Kỳ vọng: Trạng thái (Moore) vẫn là LOCK (0).

        // ---------------------------------------------------------
        // Trường hợp 2: Hành vi dư thừa - Bỏ 2 đồng xu liên tiếp
        // ---------------------------------------------------------
        #37 coin = 1;     // t = 100
        #20 coin = 0;     // t = 120
        #20 coin = 1;     // t = 140 (Cố tình bỏ thêm đồng nữa)
        #20 coin = 0;     // t = 160
        // Kỳ vọng: Trạng thái chuyển sang UNLOCK (1) ở t=100 và giữ nguyên.

        // ---------------------------------------------------------
        // Trường hợp 3: Hoạt động đúng - Bấm Start để sử dụng máy
        // ---------------------------------------------------------
        #17 start = 1;    // t = 180
        #20 start = 0;    // t = 200
        // Kỳ vọng: Trạng thái quay trở lại LOCK (0).

        // ---------------------------------------------------------
        // Trường hợp 4: Bấm cùng lúc cả Coin và Start (Trùng lặp tín hiệu)
        // ---------------------------------------------------------
        #40 coin = 1; start = 1; // t = 240
        #20 coin = 0; start = 0; // t = 260
end

endmodule