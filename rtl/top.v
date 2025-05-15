module top (
  input  wire       i_clk, 
  input  wire       i_rst,
  input  wire       i_en,
  output wire [6:0] d1, d2, d3, d4, d5, d6,
  output wire [1:0] dpnt,
  output wire       o_pm_am
);

wire div_clk;
wire [3:0] s1, s2, m1, m2, h1, h2;

even_clk_div clkdiv2 (.i_clk(i_clk), .i_rst(i_rst), .o_clk(div_clk));

clock dut (.i_clk(div_clk), .i_rst(i_rst), .i_en(i_en), .o_pm(o_pm_am), .o_hh({h2, h1}), .o_mm({m2, m1}), .o_ss({s2, s1}), .o_dpnt(dpnt)); 

decoder_7seq sev_seg1_s (.A(s1[3]), .B(s1[2]), .C(s1[1]), .D(s1[0]), .led_a(d1[0]), .led_b(d1[1]), .led_c(d1[2]), .led_d(d1[3]), .led_e(d1[4]), .led_f(d1[5]), .led_g(d1[6]));
decoder_7seq sev_seg2_s (.A(s2[3]), .B(s2[2]), .C(s2[1]), .D(s2[0]), .led_a(d2[0]), .led_b(d2[1]), .led_c(d2[2]), .led_d(d2[3]), .led_e(d2[4]), .led_f(d2[5]), .led_g(d2[6]));
decoder_7seq sev_seg3_m (.A(m1[3]), .B(m1[2]), .C(m1[1]), .D(m1[0]), .led_a(d3[0]), .led_b(d3[1]), .led_c(d3[2]), .led_d(d3[3]), .led_e(d3[4]), .led_f(d3[5]), .led_g(d3[6]));
decoder_7seq sev_seg4_m (.A(m2[3]), .B(m2[2]), .C(m2[1]), .D(m2[0]), .led_a(d4[0]), .led_b(d4[1]), .led_c(d4[2]), .led_d(d4[3]), .led_e(d4[4]), .led_f(d4[5]), .led_g(d4[6]));
decoder_7seq sev_seg5_h (.A(h1[3]), .B(h1[2]), .C(h1[1]), .D(h1[0]), .led_a(d5[0]), .led_b(d5[1]), .led_c(d5[2]), .led_d(d5[3]), .led_e(d5[4]), .led_f(d5[5]), .led_g(d5[6]));
decoder_7seq sev_seg6_h (.A(h2[3]), .B(h2[2]), .C(h2[1]), .D(h2[0]), .led_a(d6[0]), .led_b(d6[1]), .led_c(d6[2]), .led_d(d6[3]), .led_e(d6[4]), .led_f(d6[5]), .led_g(d6[6]));


endmodule