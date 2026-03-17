-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "03/17/2026 09:51:29"

-- 
-- Device: Altera 10M50DAF484C6GES Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	KeyDecode IS
    PORT (
	Clk : IN std_logic;
	Reset : IN std_logic;
	KbdLin : IN std_logic_vector(3 DOWNTO 0);
	Tdelay : IN std_logic_vector(1 DOWNTO 0);
	Kack : IN std_logic;
	KbdCol : BUFFER std_logic_vector(3 DOWNTO 0);
	Kval : BUFFER std_logic;
	Kcode : BUFFER std_logic_vector(3 DOWNTO 0);
	Kpress : BUFFER std_logic;
	Kscan : IN std_logic
	);
END KeyDecode;

-- Design Ports Information
-- Tdelay[0]	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tdelay[1]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdCol[0]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdCol[1]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdCol[2]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdCol[3]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kval	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kcode[0]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kcode[1]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kcode[2]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kcode[3]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kpress	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kscan	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kack	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdLin[0]	=>  Location: PIN_W5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdLin[1]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdLin[2]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdLin[3]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF KeyDecode IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_KbdLin : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Tdelay : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_Kack : std_logic;
SIGNAL ww_KbdCol : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Kval : std_logic;
SIGNAL ww_Kcode : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Kpress : std_logic;
SIGNAL ww_Kscan : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Ctrl|CurrentState.SCANNING~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Tdelay[0]~input_o\ : std_logic;
SIGNAL \Tdelay[1]~input_o\ : std_logic;
SIGNAL \Kscan~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \KbdCol[0]~output_o\ : std_logic;
SIGNAL \KbdCol[1]~output_o\ : std_logic;
SIGNAL \KbdCol[2]~output_o\ : std_logic;
SIGNAL \KbdCol[3]~output_o\ : std_logic;
SIGNAL \Kval~output_o\ : std_logic;
SIGNAL \Kcode[0]~output_o\ : std_logic;
SIGNAL \Kcode[1]~output_o\ : std_logic;
SIGNAL \Kcode[2]~output_o\ : std_logic;
SIGNAL \Kcode[3]~output_o\ : std_logic;
SIGNAL \Kpress~output_o\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \Clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \KbdLin[0]~input_o\ : std_logic;
SIGNAL \KbdLin[2]~input_o\ : std_logic;
SIGNAL \KbdLin[1]~input_o\ : std_logic;
SIGNAL \KbdLin[3]~input_o\ : std_logic;
SIGNAL \Kack~input_o\ : std_logic;
SIGNAL \Ctrl|Selector2~0_combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Ctrl|CurrentState.ACKNOWLEDGED~q\ : std_logic;
SIGNAL \Ctrl|Selector0~7_combout\ : std_logic;
SIGNAL \Ctrl|Selector0~19_combout\ : std_logic;
SIGNAL \Ctrl|CurrentState.SCANNING~q\ : std_logic;
SIGNAL \degnouerdsbvgd|Cont|Reg|FDD0|Q~0_combout\ : std_logic;
SIGNAL \degnouerdsbvgd|Cont|Reg|FDD0|Q~q\ : std_logic;
SIGNAL \degnouerdsbvgd|Cont|Reg|FDD1|Q~0_combout\ : std_logic;
SIGNAL \degnouerdsbvgd|Cont|Reg|FDD1|Q~q\ : std_logic;
SIGNAL \Ctrl|Selector1~9_combout\ : std_logic;
SIGNAL \Ctrl|Selector1~8_combout\ : std_logic;
SIGNAL \Ctrl|CurrentState.SENDING~feeder_combout\ : std_logic;
SIGNAL \Ctrl|CurrentState.SENDING~q\ : std_logic;
SIGNAL \Ctrl|CurrentState.SCANNING~clkctrl_outclk\ : std_logic;
SIGNAL \degnouerdsbvgd|PEnc|PEnc1|Gs~combout\ : std_logic;
SIGNAL \degnouerdsbvgd|RG|FDD0|Q~q\ : std_logic;
SIGNAL \degnouerdsbvgd|PEnc|Mux|Y~0_combout\ : std_logic;
SIGNAL \degnouerdsbvgd|RG|FDD1|Q~q\ : std_logic;
SIGNAL \degnouerdsbvgd|DEC|DeMUX2|O\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \degnouerdsbvgd|DEC|DeMUX3|O\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_Reset~input_o\ : std_logic;
SIGNAL \degnouerdsbvgd|RG|FDD1|ALT_INV_Q~q\ : std_logic;
SIGNAL \degnouerdsbvgd|RG|FDD0|ALT_INV_Q~q\ : std_logic;
SIGNAL \degnouerdsbvgd|DEC|DeMUX3|ALT_INV_O\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \degnouerdsbvgd|DEC|DeMUX2|ALT_INV_O\ : std_logic_vector(1 DOWNTO 1);
SIGNAL \degnouerdsbvgd|Cont|Reg|FDD1|ALT_INV_Q~q\ : std_logic;
SIGNAL \degnouerdsbvgd|Cont|Reg|FDD0|ALT_INV_Q~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_Clk <= Clk;
ww_Reset <= Reset;
ww_KbdLin <= KbdLin;
ww_Tdelay <= Tdelay;
ww_Kack <= Kack;
KbdCol <= ww_KbdCol;
Kval <= ww_Kval;
Kcode <= ww_Kcode;
Kpress <= ww_Kpress;
ww_Kscan <= Kscan;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\Ctrl|CurrentState.SCANNING~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Ctrl|CurrentState.SCANNING~q\);

\Clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clk~input_o\);
\ALT_INV_Reset~input_o\ <= NOT \Reset~input_o\;
\degnouerdsbvgd|RG|FDD1|ALT_INV_Q~q\ <= NOT \degnouerdsbvgd|RG|FDD1|Q~q\;
\degnouerdsbvgd|RG|FDD0|ALT_INV_Q~q\ <= NOT \degnouerdsbvgd|RG|FDD0|Q~q\;
\degnouerdsbvgd|DEC|DeMUX3|ALT_INV_O\(1) <= NOT \degnouerdsbvgd|DEC|DeMUX3|O\(1);
\degnouerdsbvgd|DEC|DeMUX3|ALT_INV_O\(0) <= NOT \degnouerdsbvgd|DEC|DeMUX3|O\(0);
\degnouerdsbvgd|DEC|DeMUX2|ALT_INV_O\(1) <= NOT \degnouerdsbvgd|DEC|DeMUX2|O\(1);
\degnouerdsbvgd|Cont|Reg|FDD1|ALT_INV_Q~q\ <= NOT \degnouerdsbvgd|Cont|Reg|FDD1|Q~q\;
\degnouerdsbvgd|Cont|Reg|FDD0|ALT_INV_Q~q\ <= NOT \degnouerdsbvgd|Cont|Reg|FDD0|Q~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y52_N4
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X38_Y0_N9
\KbdCol[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \degnouerdsbvgd|DEC|DeMUX2|O\(0),
	devoe => ww_devoe,
	o => \KbdCol[0]~output_o\);

-- Location: IOOBUF_X38_Y0_N16
\KbdCol[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \degnouerdsbvgd|DEC|DeMUX2|ALT_INV_O\(1),
	devoe => ww_devoe,
	o => \KbdCol[1]~output_o\);

-- Location: IOOBUF_X34_Y0_N23
\KbdCol[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \degnouerdsbvgd|DEC|DeMUX3|ALT_INV_O\(0),
	devoe => ww_devoe,
	o => \KbdCol[2]~output_o\);

-- Location: IOOBUF_X31_Y0_N16
\KbdCol[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \degnouerdsbvgd|DEC|DeMUX3|ALT_INV_O\(1),
	devoe => ww_devoe,
	o => \KbdCol[3]~output_o\);

-- Location: IOOBUF_X56_Y54_N30
\Kval~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Ctrl|CurrentState.SENDING~q\,
	devoe => ww_devoe,
	o => \Kval~output_o\);

-- Location: IOOBUF_X46_Y54_N2
\Kcode[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \degnouerdsbvgd|RG|FDD0|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \Kcode[0]~output_o\);

-- Location: IOOBUF_X46_Y54_N23
\Kcode[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \degnouerdsbvgd|RG|FDD1|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \Kcode[1]~output_o\);

-- Location: IOOBUF_X51_Y54_N16
\Kcode[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \degnouerdsbvgd|Cont|Reg|FDD0|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \Kcode[2]~output_o\);

-- Location: IOOBUF_X46_Y54_N9
\Kcode[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \degnouerdsbvgd|Cont|Reg|FDD1|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \Kcode[3]~output_o\);

-- Location: IOOBUF_X69_Y54_N9
\Kpress~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Kpress~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\Clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk,
	o => \Clk~input_o\);

-- Location: CLKCTRL_G19
\Clk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X14_Y0_N1
\KbdLin[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KbdLin(0),
	o => \KbdLin[0]~input_o\);

-- Location: IOIBUF_X46_Y0_N8
\KbdLin[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KbdLin(2),
	o => \KbdLin[2]~input_o\);

-- Location: IOIBUF_X51_Y0_N22
\KbdLin[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KbdLin(1),
	o => \KbdLin[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N22
\KbdLin[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KbdLin(3),
	o => \KbdLin[3]~input_o\);

-- Location: IOIBUF_X51_Y54_N22
\Kack~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Kack,
	o => \Kack~input_o\);

-- Location: LCCOMB_X45_Y4_N16
\Ctrl|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|Selector2~0_combout\ = (\Ctrl|CurrentState.SCANNING~q\ & \Kack~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|CurrentState.SCANNING~q\,
	datac => \Kack~input_o\,
	combout => \Ctrl|Selector2~0_combout\);

-- Location: IOIBUF_X51_Y54_N29
\Reset~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: FF_X45_Y4_N23
\Ctrl|CurrentState.ACKNOWLEDGED\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \Ctrl|Selector2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|CurrentState.ACKNOWLEDGED~q\);

-- Location: LCCOMB_X45_Y4_N22
\Ctrl|Selector0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|Selector0~7_combout\ = (\KbdLin[3]~input_o\ & (((!\Kack~input_o\ & \Ctrl|CurrentState.ACKNOWLEDGED~q\)) # (!\Ctrl|CurrentState.SCANNING~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KbdLin[3]~input_o\,
	datab => \Kack~input_o\,
	datac => \Ctrl|CurrentState.ACKNOWLEDGED~q\,
	datad => \Ctrl|CurrentState.SCANNING~q\,
	combout => \Ctrl|Selector0~7_combout\);

-- Location: LCCOMB_X45_Y4_N28
\Ctrl|Selector0~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|Selector0~19_combout\ = (((!\Ctrl|Selector0~7_combout\) # (!\KbdLin[1]~input_o\)) # (!\KbdLin[2]~input_o\)) # (!\KbdLin[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KbdLin[0]~input_o\,
	datab => \KbdLin[2]~input_o\,
	datac => \KbdLin[1]~input_o\,
	datad => \Ctrl|Selector0~7_combout\,
	combout => \Ctrl|Selector0~19_combout\);

-- Location: FF_X45_Y4_N29
\Ctrl|CurrentState.SCANNING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Ctrl|Selector0~19_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|CurrentState.SCANNING~q\);

-- Location: LCCOMB_X45_Y4_N6
\degnouerdsbvgd|Cont|Reg|FDD0|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \degnouerdsbvgd|Cont|Reg|FDD0|Q~0_combout\ = \Ctrl|CurrentState.SCANNING~q\ $ (!\degnouerdsbvgd|Cont|Reg|FDD0|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Ctrl|CurrentState.SCANNING~q\,
	datad => \degnouerdsbvgd|Cont|Reg|FDD0|Q~q\,
	combout => \degnouerdsbvgd|Cont|Reg|FDD0|Q~0_combout\);

-- Location: FF_X45_Y4_N3
\degnouerdsbvgd|Cont|Reg|FDD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \degnouerdsbvgd|Cont|Reg|FDD0|Q~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \degnouerdsbvgd|Cont|Reg|FDD0|Q~q\);

-- Location: LCCOMB_X45_Y4_N26
\degnouerdsbvgd|Cont|Reg|FDD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \degnouerdsbvgd|Cont|Reg|FDD1|Q~0_combout\ = \degnouerdsbvgd|Cont|Reg|FDD1|Q~q\ $ (((!\Ctrl|CurrentState.SCANNING~q\ & !\degnouerdsbvgd|Cont|Reg|FDD0|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \degnouerdsbvgd|Cont|Reg|FDD1|Q~q\,
	datab => \Ctrl|CurrentState.SCANNING~q\,
	datad => \degnouerdsbvgd|Cont|Reg|FDD0|Q~q\,
	combout => \degnouerdsbvgd|Cont|Reg|FDD1|Q~0_combout\);

-- Location: FF_X45_Y4_N11
\degnouerdsbvgd|Cont|Reg|FDD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \degnouerdsbvgd|Cont|Reg|FDD1|Q~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \degnouerdsbvgd|Cont|Reg|FDD1|Q~q\);

-- Location: LCCOMB_X45_Y4_N2
\degnouerdsbvgd|DEC|DeMUX2|O[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \degnouerdsbvgd|DEC|DeMUX2|O\(0) = (!\degnouerdsbvgd|Cont|Reg|FDD0|Q~q\) # (!\degnouerdsbvgd|Cont|Reg|FDD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \degnouerdsbvgd|Cont|Reg|FDD1|Q~q\,
	datac => \degnouerdsbvgd|Cont|Reg|FDD0|Q~q\,
	combout => \degnouerdsbvgd|DEC|DeMUX2|O\(0));

-- Location: LCCOMB_X45_Y4_N10
\degnouerdsbvgd|DEC|DeMUX2|O[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \degnouerdsbvgd|DEC|DeMUX2|O\(1) = (!\degnouerdsbvgd|Cont|Reg|FDD0|Q~q\ & \degnouerdsbvgd|Cont|Reg|FDD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \degnouerdsbvgd|Cont|Reg|FDD0|Q~q\,
	datac => \degnouerdsbvgd|Cont|Reg|FDD1|Q~q\,
	combout => \degnouerdsbvgd|DEC|DeMUX2|O\(1));

-- Location: LCCOMB_X45_Y4_N24
\degnouerdsbvgd|DEC|DeMUX3|O[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \degnouerdsbvgd|DEC|DeMUX3|O\(0) = (\degnouerdsbvgd|Cont|Reg|FDD0|Q~q\ & !\degnouerdsbvgd|Cont|Reg|FDD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \degnouerdsbvgd|Cont|Reg|FDD0|Q~q\,
	datac => \degnouerdsbvgd|Cont|Reg|FDD1|Q~q\,
	combout => \degnouerdsbvgd|DEC|DeMUX3|O\(0));

-- Location: LCCOMB_X45_Y4_N18
\degnouerdsbvgd|DEC|DeMUX3|O[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \degnouerdsbvgd|DEC|DeMUX3|O\(1) = (!\degnouerdsbvgd|Cont|Reg|FDD0|Q~q\ & !\degnouerdsbvgd|Cont|Reg|FDD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \degnouerdsbvgd|Cont|Reg|FDD0|Q~q\,
	datac => \degnouerdsbvgd|Cont|Reg|FDD1|Q~q\,
	combout => \degnouerdsbvgd|DEC|DeMUX3|O\(1));

-- Location: LCCOMB_X45_Y4_N12
\Ctrl|Selector1~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|Selector1~9_combout\ = (((!\KbdLin[3]~input_o\) # (!\KbdLin[1]~input_o\)) # (!\KbdLin[2]~input_o\)) # (!\KbdLin[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KbdLin[0]~input_o\,
	datab => \KbdLin[2]~input_o\,
	datac => \KbdLin[1]~input_o\,
	datad => \KbdLin[3]~input_o\,
	combout => \Ctrl|Selector1~9_combout\);

-- Location: LCCOMB_X45_Y4_N14
\Ctrl|Selector1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|Selector1~8_combout\ = (\Ctrl|CurrentState.SCANNING~q\ & (!\Kack~input_o\ & ((\Ctrl|Selector1~9_combout\) # (\Ctrl|CurrentState.SENDING~q\)))) # (!\Ctrl|CurrentState.SCANNING~q\ & (\Ctrl|Selector1~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector1~9_combout\,
	datab => \Kack~input_o\,
	datac => \Ctrl|CurrentState.SCANNING~q\,
	datad => \Ctrl|CurrentState.SENDING~q\,
	combout => \Ctrl|Selector1~8_combout\);

-- Location: LCCOMB_X45_Y4_N20
\Ctrl|CurrentState.SENDING~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|CurrentState.SENDING~feeder_combout\ = \Ctrl|Selector1~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Ctrl|Selector1~8_combout\,
	combout => \Ctrl|CurrentState.SENDING~feeder_combout\);

-- Location: FF_X45_Y4_N21
\Ctrl|CurrentState.SENDING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Ctrl|CurrentState.SENDING~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|CurrentState.SENDING~q\);

-- Location: CLKCTRL_G16
\Ctrl|CurrentState.SCANNING~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Ctrl|CurrentState.SCANNING~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Ctrl|CurrentState.SCANNING~clkctrl_outclk\);

-- Location: LCCOMB_X45_Y4_N30
\degnouerdsbvgd|PEnc|PEnc1|Gs\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \degnouerdsbvgd|PEnc|PEnc1|Gs~combout\ = (!\KbdLin[0]~input_o\) # (!\KbdLin[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \KbdLin[1]~input_o\,
	datad => \KbdLin[0]~input_o\,
	combout => \degnouerdsbvgd|PEnc|PEnc1|Gs~combout\);

-- Location: FF_X45_Y4_N31
\degnouerdsbvgd|RG|FDD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Ctrl|CurrentState.SCANNING~clkctrl_outclk\,
	d => \degnouerdsbvgd|PEnc|PEnc1|Gs~combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \degnouerdsbvgd|RG|FDD0|Q~q\);

-- Location: LCCOMB_X45_Y4_N8
\degnouerdsbvgd|PEnc|Mux|Y~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \degnouerdsbvgd|PEnc|Mux|Y~0_combout\ = ((\KbdLin[1]~input_o\ & !\KbdLin[2]~input_o\)) # (!\KbdLin[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KbdLin[0]~input_o\,
	datac => \KbdLin[1]~input_o\,
	datad => \KbdLin[2]~input_o\,
	combout => \degnouerdsbvgd|PEnc|Mux|Y~0_combout\);

-- Location: FF_X45_Y4_N9
\degnouerdsbvgd|RG|FDD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Ctrl|CurrentState.SCANNING~clkctrl_outclk\,
	d => \degnouerdsbvgd|PEnc|Mux|Y~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \degnouerdsbvgd|RG|FDD1|Q~q\);

-- Location: IOIBUF_X16_Y0_N22
\Tdelay[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tdelay(0),
	o => \Tdelay[0]~input_o\);

-- Location: IOIBUF_X0_Y25_N22
\Tdelay[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tdelay(1),
	o => \Tdelay[1]~input_o\);

-- Location: IOIBUF_X0_Y13_N1
\Kscan~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Kscan,
	o => \Kscan~input_o\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_KbdCol(0) <= \KbdCol[0]~output_o\;

ww_KbdCol(1) <= \KbdCol[1]~output_o\;

ww_KbdCol(2) <= \KbdCol[2]~output_o\;

ww_KbdCol(3) <= \KbdCol[3]~output_o\;

ww_Kval <= \Kval~output_o\;

ww_Kcode(0) <= \Kcode[0]~output_o\;

ww_Kcode(1) <= \Kcode[1]~output_o\;

ww_Kcode(2) <= \Kcode[2]~output_o\;

ww_Kcode(3) <= \Kcode[3]~output_o\;

ww_Kpress <= \Kpress~output_o\;
END structure;


