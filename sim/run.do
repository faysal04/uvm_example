vlib work
vlog +define+UVM_NO_DPI +incdir+C:/intelFPGA/20.1/modelsim_ase/verilog_src/uvm-1.2/src/ C:/intelFPGA/20.1/modelsim_ase/verilog_src/uvm-1.2/src/uvm.sv +incdir+. -f file_list.f ../design/mux.v
vsim -voptargs=+acc+top. +UVM_TESTNAME=mux_test top
do wave.do
