module clock(
    input  wire       i_clk,
    input  wire       i_rst,
    input  wire       i_en,
    output reg [1:0] o_dpnt,
    output reg        o_pm,
    output wire [7:0] o_hh,
    output wire [7:0] o_mm,
    output wire [7:0] o_ss
    ); 
    
    wire enm, enh;
    
    assign enm = i_en && (o_ss == 8'h59);
    assign enh = i_en && (o_ss == 8'h59) && (o_mm == 8'h59);
    
    count_59 secs (i_clk, i_rst, i_en, o_ss);
    count_59 mins (i_clk, i_rst, enm,  o_mm);
    count_12 hrs  (i_clk, i_rst, enh,  o_hh);
    
    always @(posedge i_clk, negedge i_rst) begin
        if (!i_rst)
            o_pm <= 0;
        else if ((o_hh == 8'h11) && (o_mm == 8'h59) && (o_ss == 8'h59))
            o_pm <= ~o_pm;
        else
            o_pm <= o_pm;
    end

    always @(posedge i_clk, negedge i_rst) begin
        if(!i_rst)
            o_dpnt <= 2'b11;
        else
            o_dpnt <= ~o_dpnt;
    end
    
endmodule
