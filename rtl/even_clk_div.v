module even_clk_div 
#(
  parameter RATIO = 50000000
)
(
  input   wire i_clk,
  input   wire i_rst,
  output  wire o_clk
);

localparam NUM = $clog2(RATIO);
localparam PULSE_CNT = ((RATIO >> 1) - 1);

reg  [NUM - 1 : 0] counter;
reg o_clk_reg;

always @(posedge i_clk or negedge i_rst)
  begin
    if (!i_rst) 
      begin
        o_clk_reg <= 0;
        counter <= 0;
      end
    else if (counter == PULSE_CNT)
      begin
        counter <= 0;
        o_clk_reg <= !o_clk_reg;
      end
    else
      begin
        counter <= counter + 1;
      end
  end

assign o_clk = o_clk_reg;

endmodule