transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/Vela\ Projects/FPGA_Exam1 {C:/intelFPGA_lite/Vela Projects/FPGA_Exam1/add1bit.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/Vela\ Projects/FPGA_Exam1 {C:/intelFPGA_lite/Vela Projects/FPGA_Exam1/test_add1bit.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  test_add1bit

add wave *
view structure
view signals
run -all
