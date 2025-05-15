quit -sim
if [file exists "work"] {vdel -all}
vlog ../rtl/*.v
vlog clock_tb.v
vsim -voptargs=+acc work.clock_tb
add wave -position insertpoint  \
sim:/clock_tb/*
run -all;
