onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /keyscan/Clk
add wave -noupdate /keyscan/rst
add wave -noupdate /keyscan/Kscan
add wave -noupdate /keyscan/KbdLin
add wave -noupdate /keyscan/KbdCol
add wave -noupdate /keyscan/K
add wave -noupdate /keyscan/Kpress
add wave -noupdate /keyscan/Q
add wave -noupdate /keyscan/Ys
add wave -noupdate /keyscan/RgO
add wave -noupdate /keyscan/nKbdLin
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {210704 ps}
