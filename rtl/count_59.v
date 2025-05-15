module count_59 (
    input  wire       i_clk,
    input  wire       i_reset,
    input  wire       i_en,
    output wire [7:0] o_q
);
    reg [3:0] d1, d2;
    wire en2;
    
    always @(posedge i_clk, negedge i_reset) begin
        if (!i_reset)
            d1 <= 0;
        else if (i_en & (d1 != 9))
            d1 <= d1 + 1;
        else if (i_en & (d1 == 9))
            d1 <= 0;
        else
            d1 <= d1;
    end
    
    always @(posedge i_clk, negedge i_reset) begin
        if (!i_reset)
            d2 <= 0;
        else if (en2 & (d2 != 5))
            d2 <= d2 + 1;
        else if (en2 & (d2 == 5))
            d2 <= 0;
        else
            d2 <= d2;
    end
    
    assign en2 = i_en && (d1 == 4'd9);
    assign o_q = {d2, d1};
    
    
endmodule