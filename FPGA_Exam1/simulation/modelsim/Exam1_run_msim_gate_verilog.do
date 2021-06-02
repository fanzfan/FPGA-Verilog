transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Exam1.vo}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/Vela\ Projects/FPGA_Exam1/simulation/modelsim {C:/intelFPGA_lite/Vela Projects/FPGA_Exam1/simulation/modelsim/add1bit.vt}

vsim -t 1ps -L maxv_ver -L gate_work -L work -voptargs="+acc"  add1bit

add wave *
view structure
view signals
run -all
