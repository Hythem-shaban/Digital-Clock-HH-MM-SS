`timescale 1ns/1ns
module clock_tb;

  parameter PERIOD = 20;

  reg        clk;
  reg        rst;
  reg        en;
  wire       pm;
  wire [7:0] hh;
  wire [7:0] mm;
  wire [7:0] ss;

  always #(PERIOD/2.0) clk = ~clk;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
  end

  initial begin
    init();
    print();
    #($urandom_range(PERIOD*3600*24, 0));
    print();
    #($urandom_range(PERIOD*3600*24, 0));
    print();
    #($urandom_range(PERIOD*3600*24, 0));
    print();
    #($urandom_range(PERIOD*3600*24, 0));
    print();
    #($urandom_range(PERIOD*3600*24, 0));
    print();
    #($urandom_range(PERIOD*3600*24, 0));
    print();
    $stop;
  end

  task print; 
    begin
      $display("[%7t] %2h:%2h:%2h %s", $time, hh, mm, ss, pm?"PM":"AM");
    end
  endtask

  task init;
    begin
      clk = 1'b0;
      rst = 1'b0;
      en  = 1'b0;
      #(PERIOD);
      rst = 1'b1;
      en  = 1'b1;
    end
  endtask

  clock dut (
    .i_clk(clk),
    .i_rst(rst),
    .i_en(en),
    .o_pm(pm),
    .o_hh(hh),
    .o_mm(mm),
    .o_ss(ss)
  );
endmodule