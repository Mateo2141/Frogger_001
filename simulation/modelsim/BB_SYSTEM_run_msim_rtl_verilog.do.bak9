transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC_STATEMACHINEBACKG.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC_RegBACKGTYPE.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC_STATEMACHINEPOINT.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC_RegPOINTTYPE.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/CC_BOTTOMSIDECOMPARATOR.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC_upCOUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/CC_SEVENSEG1.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/CC_BIN2BCD1.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC_upSPEEDCOUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/CC_SPEEDCOMPARATOR.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/shift_reg_start_done.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/max7219_ctrl.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC_DEBOUNCE1.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador {C:/Users/mateo/Desktop/Frogger_ganador/BB_SYSTEM.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/LosingComparator.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/Last_register_comparator.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC_LIVES_COUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC_COUNTER_LEVELS.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC.STATEMACHINEGENERAL.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/CC_COMPARATOR_LIVES.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/CC_COMPARATOR_LEVELS.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/CC_DISPLAYTIMER_COMPARATOR.v}
vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/rtl {C:/Users/mateo/Desktop/Frogger_ganador/rtl/SC_DISPLAYTIMER_COUNTER.v}

vlog -vlog01compat -work work +incdir+C:/Users/mateo/Desktop/Frogger_ganador/simulation/modelsim {C:/Users/mateo/Desktop/Frogger_ganador/simulation/modelsim/TB_SYSTEM.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TB_SYSTEM

add wave *
view structure
view signals
run -all
