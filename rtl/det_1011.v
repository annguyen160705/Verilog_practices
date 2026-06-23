module det_1011 (
    input clk,
    input rstn,
    input in,
    output out
);
    
    parameter 
    IDLE = 0,
    s1 = 1,
    s10 = 2,
    s101 = 3,
    s1011 = 4;

    reg [2:0] cur_state, next_state;
    assign out = cur_state == s1011 ? 1 : 0;
    always @ (posedge clk) begin
        if(!rstn)
            cur_state <= IDLE;
        else
            cur_state <= next_state;

    end
    always @ (cur_state or in) begin
        case (cur_state)
            IDLE : begin
                if(in) next_state = s1;
                else next_state = IDLE;
            end

            s1: begin
                if(!in) next_state = s10;
                else next_state = IDLE;
            end

            s10: begin
                if(in) next_state = s101;
                else next_state = IDLE;
            end

            s101: begin
                if(in) next_state = s1011;
                else next_state = IDLE;
            end

            s1011: begin
                next_state = IDLE;
            end
        endcase
    end
endmodule