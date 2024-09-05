onerror {quit -f}
vlib work
vlog -work work REG4BIT.vo
vlog -work work REG4BIT.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.REG4BIT_vlg_vec_tst
vcd file -direction REG4BIT.msim.vcd
vcd add -internal REG4BIT_vlg_vec_tst/*
vcd add -internal REG4BIT_vlg_vec_tst/i1/*
add wave /*
run -all
