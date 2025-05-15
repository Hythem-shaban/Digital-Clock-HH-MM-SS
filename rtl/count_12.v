module count_12 (
    input  wire       i_clk,
    input  wire       i_rst,
    input  wire       i_en,
    output reg [7:0]  o_q
);
    reg overlap;
    always @(posedge i_clk, negedge i_rst) begin
        if (!i_rst) begin
            o_q <= 8'h12;
            overlap <= 0;
        end
        else if (i_en & (o_q == 8'h12))
            o_q <= 8'h01;
        else if (i_en & (o_q[3:0] != 4'h9) & !overlap)
            o_q[3:0] <= o_q[3:0] + 1;
        else if (i_en & (o_q[3:0] == 4'h9) & !overlap) begin
            o_q <= 8'h10;
            overlap <= 1;
        end
        else if (i_en & (o_q[3:0] != 4'h2) & overlap)
            o_q[3:0] <= o_q[3:0] + 1;
        else begin
            o_q <= o_q;
            overlap <= 0;
        end
    end
endmodule