transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/rafae/OneDrive/Documents/ISEL/2526S2/LIC/repo/TicketMachine_VHDL/TicketMachine.vhd}

