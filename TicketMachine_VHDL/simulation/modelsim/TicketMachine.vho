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

-- DATE "03/17/2026 11:06:28"

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
	KbdCol : OUT std_logic_vector(3 DOWNTO 0);
	Kval : OUT std_logic;
	Kcode : OUT std_logic_vector(3 DOWNTO 0);
	Cols : OUT std_logic_vector(3 DOWNTO 0)
	);
END KeyDecode;

-- Design Ports Information
-- Tdelay[0]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tdelay[1]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdCol[0]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdCol[1]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdCol[2]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdCol[3]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kval	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kcode[0]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kcode[1]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kcode[2]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kcode[3]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cols[0]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cols[1]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cols[2]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cols[3]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Kack	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdLin[0]	=>  Location: PIN_W5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdLin[1]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdLin[2]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KbdLin[3]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_Cols : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Ctrl|CurrentState.SCANNING~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Div|tmp~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Tdelay[0]~input_o\ : std_logic;
SIGNAL \Tdelay[1]~input_o\ : std_logic;
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
SIGNAL \Cols[0]~output_o\ : std_logic;
SIGNAL \Cols[1]~output_o\ : std_logic;
SIGNAL \Cols[2]~output_o\ : std_logic;
SIGNAL \Cols[3]~output_o\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \Clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Div|Add0~0_combout\ : std_logic;
SIGNAL \Div|count[0]~8_combout\ : std_logic;
SIGNAL \Div|Add0~1\ : std_logic;
SIGNAL \Div|Add0~2_combout\ : std_logic;
SIGNAL \Div|Add0~3\ : std_logic;
SIGNAL \Div|Add0~4_combout\ : std_logic;
SIGNAL \Div|Add0~5\ : std_logic;
SIGNAL \Div|Add0~6_combout\ : std_logic;
SIGNAL \Div|Add0~7\ : std_logic;
SIGNAL \Div|Add0~8_combout\ : std_logic;
SIGNAL \Div|Add0~9\ : std_logic;
SIGNAL \Div|Add0~10_combout\ : std_logic;
SIGNAL \Div|count~0_combout\ : std_logic;
SIGNAL \Div|Add0~11\ : std_logic;
SIGNAL \Div|Add0~12_combout\ : std_logic;
SIGNAL \Div|Add0~13\ : std_logic;
SIGNAL \Div|Add0~14_combout\ : std_logic;
SIGNAL \Div|count~1_combout\ : std_logic;
SIGNAL \Div|Add0~15\ : std_logic;
SIGNAL \Div|Add0~16_combout\ : std_logic;
SIGNAL \Div|count~2_combout\ : std_logic;
SIGNAL \Div|Add0~17\ : std_logic;
SIGNAL \Div|Add0~18_combout\ : std_logic;
SIGNAL \Div|Add0~19\ : std_logic;
SIGNAL \Div|Add0~20_combout\ : std_logic;
SIGNAL \Div|count~3_combout\ : std_logic;
SIGNAL \Div|Add0~21\ : std_logic;
SIGNAL \Div|Add0~22_combout\ : std_logic;
SIGNAL \Div|Add0~23\ : std_logic;
SIGNAL \Div|Add0~24_combout\ : std_logic;
SIGNAL \Div|Add0~25\ : std_logic;
SIGNAL \Div|Add0~26_combout\ : std_logic;
SIGNAL \Div|count~4_combout\ : std_logic;
SIGNAL \Div|Add0~27\ : std_logic;
SIGNAL \Div|Add0~28_combout\ : std_logic;
SIGNAL \Div|Add0~29\ : std_logic;
SIGNAL \Div|Add0~30_combout\ : std_logic;
SIGNAL \Div|Equal0~3_combout\ : std_logic;
SIGNAL \Div|Equal0~2_combout\ : std_logic;
SIGNAL \Div|Equal0~1_combout\ : std_logic;
SIGNAL \Div|Equal0~0_combout\ : std_logic;
SIGNAL \Div|Equal0~4_combout\ : std_logic;
SIGNAL \Div|Add0~31\ : std_logic;
SIGNAL \Div|Add0~32_combout\ : std_logic;
SIGNAL \Div|Add0~33\ : std_logic;
SIGNAL \Div|Add0~34_combout\ : std_logic;
SIGNAL \Div|count~5_combout\ : std_logic;
SIGNAL \Div|Add0~35\ : std_logic;
SIGNAL \Div|Add0~36_combout\ : std_logic;
SIGNAL \Div|count~6_combout\ : std_logic;
SIGNAL \Div|Add0~37\ : std_logic;
SIGNAL \Div|Add0~38_combout\ : std_logic;
SIGNAL \Div|Add0~39\ : std_logic;
SIGNAL \Div|Add0~40_combout\ : std_logic;
SIGNAL \Div|Add0~41\ : std_logic;
SIGNAL \Div|Add0~42_combout\ : std_logic;
SIGNAL \Div|count~7_combout\ : std_logic;
SIGNAL \Div|Add0~43\ : std_logic;
SIGNAL \Div|Add0~44_combout\ : std_logic;
SIGNAL \Div|Add0~45\ : std_logic;
SIGNAL \Div|Add0~46_combout\ : std_logic;
SIGNAL \Div|Equal0~6_combout\ : std_logic;
SIGNAL \Div|Equal0~5_combout\ : std_logic;
SIGNAL \Div|Add0~47\ : std_logic;
SIGNAL \Div|Add0~48_combout\ : std_logic;
SIGNAL \Div|Add0~49\ : std_logic;
SIGNAL \Div|Add0~50_combout\ : std_logic;
SIGNAL \Div|Add0~51\ : std_logic;
SIGNAL \Div|Add0~52_combout\ : std_logic;
SIGNAL \Div|Add0~53\ : std_logic;
SIGNAL \Div|Add0~54_combout\ : std_logic;
SIGNAL \Div|Equal0~7_combout\ : std_logic;
SIGNAL \Div|Add0~55\ : std_logic;
SIGNAL \Div|Add0~56_combout\ : std_logic;
SIGNAL \Div|Add0~57\ : std_logic;
SIGNAL \Div|Add0~58_combout\ : std_logic;
SIGNAL \Div|Add0~59\ : std_logic;
SIGNAL \Div|Add0~60_combout\ : std_logic;
SIGNAL \Div|Add0~61\ : std_logic;
SIGNAL \Div|Add0~62_combout\ : std_logic;
SIGNAL \Div|Equal0~8_combout\ : std_logic;
SIGNAL \Div|Equal0~9_combout\ : std_logic;
SIGNAL \Div|tmp~0_combout\ : std_logic;
SIGNAL \Div|tmp~feeder_combout\ : std_logic;
SIGNAL \Div|tmp~q\ : std_logic;
SIGNAL \Div|tmp~clkctrl_outclk\ : std_logic;
SIGNAL \Kack~input_o\ : std_logic;
SIGNAL \KbdLin[2]~input_o\ : std_logic;
SIGNAL \KbdLin[0]~input_o\ : std_logic;
SIGNAL \KbdLin[3]~input_o\ : std_logic;
SIGNAL \KbdLin[1]~input_o\ : std_logic;
SIGNAL \Ctrl|Selector0~9_combout\ : std_logic;
SIGNAL \Ctrl|Selector2~0_combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Ctrl|CurrentState.ACKNOWLEDGED~q\ : std_logic;
SIGNAL \Ctrl|Selector0~8_combout\ : std_logic;
SIGNAL \Ctrl|CurrentState.SCANNING~feeder_combout\ : std_logic;
SIGNAL \Ctrl|CurrentState.SCANNING~q\ : std_logic;
SIGNAL \Scann|Cont|Reg|FDD0|Q~0_combout\ : std_logic;
SIGNAL \Scann|Cont|Reg|FDD0|Q~q\ : std_logic;
SIGNAL \Scann|Cont|Reg|FDD1|Q~0_combout\ : std_logic;
SIGNAL \Scann|Cont|Reg|FDD1|Q~q\ : std_logic;
SIGNAL \Ctrl|Selector1~9_combout\ : std_logic;
SIGNAL \Ctrl|Selector1~8_combout\ : std_logic;
SIGNAL \Ctrl|CurrentState.SENDING~feeder_combout\ : std_logic;
SIGNAL \Ctrl|CurrentState.SENDING~q\ : std_logic;
SIGNAL \Ctrl|CurrentState.SCANNING~clkctrl_outclk\ : std_logic;
SIGNAL \Scann|PEnc|PEnc1|Gs~combout\ : std_logic;
SIGNAL \Scann|RG|FDD0|Q~q\ : std_logic;
SIGNAL \Scann|PEnc|Mux|Y~0_combout\ : std_logic;
SIGNAL \Scann|RG|FDD1|Q~q\ : std_logic;
SIGNAL \Scann|DEC|DeMUX2|O\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Scann|DEC|DeMUX3|O\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Div|count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \Div|ALT_INV_tmp~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_Reset~input_o\ : std_logic;
SIGNAL \Scann|RG|FDD1|ALT_INV_Q~q\ : std_logic;
SIGNAL \Scann|RG|FDD0|ALT_INV_Q~q\ : std_logic;
SIGNAL \Scann|DEC|DeMUX3|ALT_INV_O\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Scann|DEC|DeMUX2|ALT_INV_O\ : std_logic_vector(1 DOWNTO 1);
SIGNAL \Scann|Cont|Reg|FDD1|ALT_INV_Q~q\ : std_logic;
SIGNAL \Scann|Cont|Reg|FDD0|ALT_INV_Q~q\ : std_logic;

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
Cols <= ww_Cols;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\Ctrl|CurrentState.SCANNING~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Ctrl|CurrentState.SCANNING~q\);

\Div|tmp~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Div|tmp~q\);

\Clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clk~input_o\);
\Div|ALT_INV_tmp~clkctrl_outclk\ <= NOT \Div|tmp~clkctrl_outclk\;
\ALT_INV_Reset~input_o\ <= NOT \Reset~input_o\;
\Scann|RG|FDD1|ALT_INV_Q~q\ <= NOT \Scann|RG|FDD1|Q~q\;
\Scann|RG|FDD0|ALT_INV_Q~q\ <= NOT \Scann|RG|FDD0|Q~q\;
\Scann|DEC|DeMUX3|ALT_INV_O\(1) <= NOT \Scann|DEC|DeMUX3|O\(1);
\Scann|DEC|DeMUX3|ALT_INV_O\(0) <= NOT \Scann|DEC|DeMUX3|O\(0);
\Scann|DEC|DeMUX2|ALT_INV_O\(1) <= NOT \Scann|DEC|DeMUX2|O\(1);
\Scann|Cont|Reg|FDD1|ALT_INV_Q~q\ <= NOT \Scann|Cont|Reg|FDD1|Q~q\;
\Scann|Cont|Reg|FDD0|ALT_INV_Q~q\ <= NOT \Scann|Cont|Reg|FDD0|Q~q\;
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
	i => \Scann|DEC|DeMUX2|O\(0),
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
	i => \Scann|DEC|DeMUX2|ALT_INV_O\(1),
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
	i => \Scann|DEC|DeMUX3|ALT_INV_O\(0),
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
	i => \Scann|DEC|DeMUX3|ALT_INV_O\(1),
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
	i => \Scann|RG|FDD0|ALT_INV_Q~q\,
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
	i => \Scann|RG|FDD1|ALT_INV_Q~q\,
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
	i => \Scann|Cont|Reg|FDD0|ALT_INV_Q~q\,
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
	i => \Scann|Cont|Reg|FDD1|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \Kcode[3]~output_o\);

-- Location: IOOBUF_X58_Y54_N23
\Cols[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Scann|DEC|DeMUX2|O\(0),
	devoe => ww_devoe,
	o => \Cols[0]~output_o\);

-- Location: IOOBUF_X66_Y54_N23
\Cols[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Scann|DEC|DeMUX2|ALT_INV_O\(1),
	devoe => ww_devoe,
	o => \Cols[1]~output_o\);

-- Location: IOOBUF_X56_Y54_N9
\Cols[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Scann|DEC|DeMUX3|ALT_INV_O\(0),
	devoe => ww_devoe,
	o => \Cols[2]~output_o\);

-- Location: IOOBUF_X51_Y54_N9
\Cols[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Scann|DEC|DeMUX3|ALT_INV_O\(1),
	devoe => ww_devoe,
	o => \Cols[3]~output_o\);

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

-- Location: LCCOMB_X7_Y38_N0
\Div|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~0_combout\ = \Div|count\(0) $ (GND)
-- \Div|Add0~1\ = CARRY(!\Div|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(0),
	datad => VCC,
	combout => \Div|Add0~0_combout\,
	cout => \Div|Add0~1\);

-- Location: LCCOMB_X6_Y38_N16
\Div|count[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|count[0]~8_combout\ = !\Div|Add0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div|Add0~0_combout\,
	combout => \Div|count[0]~8_combout\);

-- Location: FF_X7_Y38_N21
\Div|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \Div|count[0]~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(0));

-- Location: LCCOMB_X7_Y38_N2
\Div|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~2_combout\ = (\Div|count\(1) & (!\Div|Add0~1\)) # (!\Div|count\(1) & ((\Div|Add0~1\) # (GND)))
-- \Div|Add0~3\ = CARRY((!\Div|Add0~1\) # (!\Div|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(1),
	datad => VCC,
	cin => \Div|Add0~1\,
	combout => \Div|Add0~2_combout\,
	cout => \Div|Add0~3\);

-- Location: FF_X7_Y38_N3
\Div|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(1));

-- Location: LCCOMB_X7_Y38_N4
\Div|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~4_combout\ = (\Div|count\(2) & (\Div|Add0~3\ $ (GND))) # (!\Div|count\(2) & (!\Div|Add0~3\ & VCC))
-- \Div|Add0~5\ = CARRY((\Div|count\(2) & !\Div|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(2),
	datad => VCC,
	cin => \Div|Add0~3\,
	combout => \Div|Add0~4_combout\,
	cout => \Div|Add0~5\);

-- Location: FF_X7_Y38_N5
\Div|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(2));

-- Location: LCCOMB_X7_Y38_N6
\Div|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~6_combout\ = (\Div|count\(3) & (!\Div|Add0~5\)) # (!\Div|count\(3) & ((\Div|Add0~5\) # (GND)))
-- \Div|Add0~7\ = CARRY((!\Div|Add0~5\) # (!\Div|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(3),
	datad => VCC,
	cin => \Div|Add0~5\,
	combout => \Div|Add0~6_combout\,
	cout => \Div|Add0~7\);

-- Location: FF_X7_Y38_N7
\Div|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(3));

-- Location: LCCOMB_X7_Y38_N8
\Div|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~8_combout\ = (\Div|count\(4) & (\Div|Add0~7\ $ (GND))) # (!\Div|count\(4) & (!\Div|Add0~7\ & VCC))
-- \Div|Add0~9\ = CARRY((\Div|count\(4) & !\Div|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(4),
	datad => VCC,
	cin => \Div|Add0~7\,
	combout => \Div|Add0~8_combout\,
	cout => \Div|Add0~9\);

-- Location: FF_X7_Y38_N9
\Div|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(4));

-- Location: LCCOMB_X7_Y38_N10
\Div|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~10_combout\ = (\Div|count\(5) & (!\Div|Add0~9\)) # (!\Div|count\(5) & ((\Div|Add0~9\) # (GND)))
-- \Div|Add0~11\ = CARRY((!\Div|Add0~9\) # (!\Div|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(5),
	datad => VCC,
	cin => \Div|Add0~9\,
	combout => \Div|Add0~10_combout\,
	cout => \Div|Add0~11\);

-- Location: LCCOMB_X8_Y38_N10
\Div|count~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|count~0_combout\ = (\Div|Add0~10_combout\ & ((!\Div|Equal0~9_combout\) # (!\Div|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div|Equal0~4_combout\,
	datac => \Div|Equal0~9_combout\,
	datad => \Div|Add0~10_combout\,
	combout => \Div|count~0_combout\);

-- Location: FF_X7_Y38_N17
\Div|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \Div|count~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(5));

-- Location: LCCOMB_X7_Y38_N12
\Div|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~12_combout\ = (\Div|count\(6) & (\Div|Add0~11\ $ (GND))) # (!\Div|count\(6) & (!\Div|Add0~11\ & VCC))
-- \Div|Add0~13\ = CARRY((\Div|count\(6) & !\Div|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(6),
	datad => VCC,
	cin => \Div|Add0~11\,
	combout => \Div|Add0~12_combout\,
	cout => \Div|Add0~13\);

-- Location: FF_X7_Y38_N13
\Div|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(6));

-- Location: LCCOMB_X7_Y38_N14
\Div|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~14_combout\ = (\Div|count\(7) & (!\Div|Add0~13\)) # (!\Div|count\(7) & ((\Div|Add0~13\) # (GND)))
-- \Div|Add0~15\ = CARRY((!\Div|Add0~13\) # (!\Div|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(7),
	datad => VCC,
	cin => \Div|Add0~13\,
	combout => \Div|Add0~14_combout\,
	cout => \Div|Add0~15\);

-- Location: LCCOMB_X8_Y38_N2
\Div|count~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|count~1_combout\ = (\Div|Add0~14_combout\ & ((!\Div|Equal0~9_combout\) # (!\Div|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div|Equal0~4_combout\,
	datac => \Div|Equal0~9_combout\,
	datad => \Div|Add0~14_combout\,
	combout => \Div|count~1_combout\);

-- Location: FF_X8_Y38_N3
\Div|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(7));

-- Location: LCCOMB_X7_Y38_N16
\Div|Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~16_combout\ = (\Div|count\(8) & (\Div|Add0~15\ $ (GND))) # (!\Div|count\(8) & (!\Div|Add0~15\ & VCC))
-- \Div|Add0~17\ = CARRY((\Div|count\(8) & !\Div|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(8),
	datad => VCC,
	cin => \Div|Add0~15\,
	combout => \Div|Add0~16_combout\,
	cout => \Div|Add0~17\);

-- Location: LCCOMB_X8_Y38_N6
\Div|count~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|count~2_combout\ = (\Div|Add0~16_combout\ & ((!\Div|Equal0~9_combout\) # (!\Div|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div|Equal0~4_combout\,
	datac => \Div|Equal0~9_combout\,
	datad => \Div|Add0~16_combout\,
	combout => \Div|count~2_combout\);

-- Location: FF_X8_Y38_N7
\Div|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(8));

-- Location: LCCOMB_X7_Y38_N18
\Div|Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~18_combout\ = (\Div|count\(9) & (!\Div|Add0~17\)) # (!\Div|count\(9) & ((\Div|Add0~17\) # (GND)))
-- \Div|Add0~19\ = CARRY((!\Div|Add0~17\) # (!\Div|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(9),
	datad => VCC,
	cin => \Div|Add0~17\,
	combout => \Div|Add0~18_combout\,
	cout => \Div|Add0~19\);

-- Location: FF_X7_Y38_N19
\Div|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(9));

-- Location: LCCOMB_X7_Y38_N20
\Div|Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~20_combout\ = (\Div|count\(10) & (\Div|Add0~19\ $ (GND))) # (!\Div|count\(10) & (!\Div|Add0~19\ & VCC))
-- \Div|Add0~21\ = CARRY((\Div|count\(10) & !\Div|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(10),
	datad => VCC,
	cin => \Div|Add0~19\,
	combout => \Div|Add0~20_combout\,
	cout => \Div|Add0~21\);

-- Location: LCCOMB_X8_Y38_N8
\Div|count~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|count~3_combout\ = (\Div|Add0~20_combout\ & ((!\Div|Equal0~4_combout\) # (!\Div|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div|Equal0~9_combout\,
	datac => \Div|Add0~20_combout\,
	datad => \Div|Equal0~4_combout\,
	combout => \Div|count~3_combout\);

-- Location: FF_X8_Y38_N9
\Div|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(10));

-- Location: LCCOMB_X7_Y38_N22
\Div|Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~22_combout\ = (\Div|count\(11) & (!\Div|Add0~21\)) # (!\Div|count\(11) & ((\Div|Add0~21\) # (GND)))
-- \Div|Add0~23\ = CARRY((!\Div|Add0~21\) # (!\Div|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(11),
	datad => VCC,
	cin => \Div|Add0~21\,
	combout => \Div|Add0~22_combout\,
	cout => \Div|Add0~23\);

-- Location: FF_X7_Y38_N23
\Div|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(11));

-- Location: LCCOMB_X7_Y38_N24
\Div|Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~24_combout\ = (\Div|count\(12) & (\Div|Add0~23\ $ (GND))) # (!\Div|count\(12) & (!\Div|Add0~23\ & VCC))
-- \Div|Add0~25\ = CARRY((\Div|count\(12) & !\Div|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(12),
	datad => VCC,
	cin => \Div|Add0~23\,
	combout => \Div|Add0~24_combout\,
	cout => \Div|Add0~25\);

-- Location: FF_X7_Y38_N25
\Div|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(12));

-- Location: LCCOMB_X7_Y38_N26
\Div|Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~26_combout\ = (\Div|count\(13) & (!\Div|Add0~25\)) # (!\Div|count\(13) & ((\Div|Add0~25\) # (GND)))
-- \Div|Add0~27\ = CARRY((!\Div|Add0~25\) # (!\Div|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(13),
	datad => VCC,
	cin => \Div|Add0~25\,
	combout => \Div|Add0~26_combout\,
	cout => \Div|Add0~27\);

-- Location: LCCOMB_X8_Y38_N12
\Div|count~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|count~4_combout\ = (\Div|Add0~26_combout\ & ((!\Div|Equal0~4_combout\) # (!\Div|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div|Equal0~9_combout\,
	datac => \Div|Add0~26_combout\,
	datad => \Div|Equal0~4_combout\,
	combout => \Div|count~4_combout\);

-- Location: FF_X8_Y38_N13
\Div|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(13));

-- Location: LCCOMB_X7_Y38_N28
\Div|Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~28_combout\ = (\Div|count\(14) & (\Div|Add0~27\ $ (GND))) # (!\Div|count\(14) & (!\Div|Add0~27\ & VCC))
-- \Div|Add0~29\ = CARRY((\Div|count\(14) & !\Div|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(14),
	datad => VCC,
	cin => \Div|Add0~27\,
	combout => \Div|Add0~28_combout\,
	cout => \Div|Add0~29\);

-- Location: FF_X7_Y38_N29
\Div|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(14));

-- Location: LCCOMB_X7_Y38_N30
\Div|Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~30_combout\ = (\Div|count\(15) & (!\Div|Add0~29\)) # (!\Div|count\(15) & ((\Div|Add0~29\) # (GND)))
-- \Div|Add0~31\ = CARRY((!\Div|Add0~29\) # (!\Div|count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(15),
	datad => VCC,
	cin => \Div|Add0~29\,
	combout => \Div|Add0~30_combout\,
	cout => \Div|Add0~31\);

-- Location: FF_X7_Y38_N31
\Div|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(15));

-- Location: LCCOMB_X8_Y38_N26
\Div|Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Equal0~3_combout\ = (\Div|count\(13) & (!\Div|count\(15) & (!\Div|count\(12) & !\Div|count\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(13),
	datab => \Div|count\(15),
	datac => \Div|count\(12),
	datad => \Div|count\(14),
	combout => \Div|Equal0~3_combout\);

-- Location: LCCOMB_X8_Y38_N18
\Div|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Equal0~2_combout\ = (\Div|count\(8) & (!\Div|count\(11) & (\Div|count\(10) & !\Div|count\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(8),
	datab => \Div|count\(11),
	datac => \Div|count\(10),
	datad => \Div|count\(9),
	combout => \Div|Equal0~2_combout\);

-- Location: LCCOMB_X8_Y38_N4
\Div|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Equal0~1_combout\ = (!\Div|count\(6) & (\Div|count\(7) & (\Div|count\(5) & \Div|count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(6),
	datab => \Div|count\(7),
	datac => \Div|count\(5),
	datad => \Div|count\(0),
	combout => \Div|Equal0~1_combout\);

-- Location: LCCOMB_X8_Y38_N20
\Div|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Equal0~0_combout\ = (!\Div|count\(1) & (!\Div|count\(2) & (!\Div|count\(3) & !\Div|count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(1),
	datab => \Div|count\(2),
	datac => \Div|count\(3),
	datad => \Div|count\(4),
	combout => \Div|Equal0~0_combout\);

-- Location: LCCOMB_X8_Y38_N28
\Div|Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Equal0~4_combout\ = (\Div|Equal0~3_combout\ & (\Div|Equal0~2_combout\ & (\Div|Equal0~1_combout\ & \Div|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div|Equal0~3_combout\,
	datab => \Div|Equal0~2_combout\,
	datac => \Div|Equal0~1_combout\,
	datad => \Div|Equal0~0_combout\,
	combout => \Div|Equal0~4_combout\);

-- Location: LCCOMB_X7_Y37_N0
\Div|Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~32_combout\ = (\Div|count\(16) & (\Div|Add0~31\ $ (GND))) # (!\Div|count\(16) & (!\Div|Add0~31\ & VCC))
-- \Div|Add0~33\ = CARRY((\Div|count\(16) & !\Div|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(16),
	datad => VCC,
	cin => \Div|Add0~31\,
	combout => \Div|Add0~32_combout\,
	cout => \Div|Add0~33\);

-- Location: FF_X7_Y37_N1
\Div|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(16));

-- Location: LCCOMB_X7_Y37_N2
\Div|Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~34_combout\ = (\Div|count\(17) & (!\Div|Add0~33\)) # (!\Div|count\(17) & ((\Div|Add0~33\) # (GND)))
-- \Div|Add0~35\ = CARRY((!\Div|Add0~33\) # (!\Div|count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(17),
	datad => VCC,
	cin => \Div|Add0~33\,
	combout => \Div|Add0~34_combout\,
	cout => \Div|Add0~35\);

-- Location: LCCOMB_X8_Y37_N20
\Div|count~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|count~5_combout\ = (\Div|Add0~34_combout\ & ((!\Div|Equal0~9_combout\) # (!\Div|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div|Equal0~4_combout\,
	datac => \Div|Equal0~9_combout\,
	datad => \Div|Add0~34_combout\,
	combout => \Div|count~5_combout\);

-- Location: FF_X8_Y37_N21
\Div|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(17));

-- Location: LCCOMB_X7_Y37_N4
\Div|Add0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~36_combout\ = (\Div|count\(18) & (\Div|Add0~35\ $ (GND))) # (!\Div|count\(18) & (!\Div|Add0~35\ & VCC))
-- \Div|Add0~37\ = CARRY((\Div|count\(18) & !\Div|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(18),
	datad => VCC,
	cin => \Div|Add0~35\,
	combout => \Div|Add0~36_combout\,
	cout => \Div|Add0~37\);

-- Location: LCCOMB_X8_Y37_N10
\Div|count~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|count~6_combout\ = (\Div|Add0~36_combout\ & ((!\Div|Equal0~4_combout\) # (!\Div|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div|Equal0~9_combout\,
	datac => \Div|Add0~36_combout\,
	datad => \Div|Equal0~4_combout\,
	combout => \Div|count~6_combout\);

-- Location: FF_X8_Y37_N11
\Div|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|count~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(18));

-- Location: LCCOMB_X7_Y37_N6
\Div|Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~38_combout\ = (\Div|count\(19) & (!\Div|Add0~37\)) # (!\Div|count\(19) & ((\Div|Add0~37\) # (GND)))
-- \Div|Add0~39\ = CARRY((!\Div|Add0~37\) # (!\Div|count\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(19),
	datad => VCC,
	cin => \Div|Add0~37\,
	combout => \Div|Add0~38_combout\,
	cout => \Div|Add0~39\);

-- Location: FF_X7_Y37_N7
\Div|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(19));

-- Location: LCCOMB_X7_Y37_N8
\Div|Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~40_combout\ = (\Div|count\(20) & (\Div|Add0~39\ $ (GND))) # (!\Div|count\(20) & (!\Div|Add0~39\ & VCC))
-- \Div|Add0~41\ = CARRY((\Div|count\(20) & !\Div|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(20),
	datad => VCC,
	cin => \Div|Add0~39\,
	combout => \Div|Add0~40_combout\,
	cout => \Div|Add0~41\);

-- Location: FF_X7_Y37_N9
\Div|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(20));

-- Location: LCCOMB_X7_Y37_N10
\Div|Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~42_combout\ = (\Div|count\(21) & (!\Div|Add0~41\)) # (!\Div|count\(21) & ((\Div|Add0~41\) # (GND)))
-- \Div|Add0~43\ = CARRY((!\Div|Add0~41\) # (!\Div|count\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(21),
	datad => VCC,
	cin => \Div|Add0~41\,
	combout => \Div|Add0~42_combout\,
	cout => \Div|Add0~43\);

-- Location: LCCOMB_X8_Y37_N16
\Div|count~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|count~7_combout\ = (\Div|Add0~42_combout\ & ((!\Div|Equal0~9_combout\) # (!\Div|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div|Equal0~4_combout\,
	datac => \Div|Equal0~9_combout\,
	datad => \Div|Add0~42_combout\,
	combout => \Div|count~7_combout\);

-- Location: FF_X8_Y37_N17
\Div|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|count~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(21));

-- Location: LCCOMB_X7_Y37_N12
\Div|Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~44_combout\ = (\Div|count\(22) & (\Div|Add0~43\ $ (GND))) # (!\Div|count\(22) & (!\Div|Add0~43\ & VCC))
-- \Div|Add0~45\ = CARRY((\Div|count\(22) & !\Div|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(22),
	datad => VCC,
	cin => \Div|Add0~43\,
	combout => \Div|Add0~44_combout\,
	cout => \Div|Add0~45\);

-- Location: FF_X7_Y37_N13
\Div|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(22));

-- Location: LCCOMB_X7_Y37_N14
\Div|Add0~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~46_combout\ = (\Div|count\(23) & (!\Div|Add0~45\)) # (!\Div|count\(23) & ((\Div|Add0~45\) # (GND)))
-- \Div|Add0~47\ = CARRY((!\Div|Add0~45\) # (!\Div|count\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(23),
	datad => VCC,
	cin => \Div|Add0~45\,
	combout => \Div|Add0~46_combout\,
	cout => \Div|Add0~47\);

-- Location: FF_X7_Y37_N15
\Div|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(23));

-- Location: LCCOMB_X8_Y37_N12
\Div|Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Equal0~6_combout\ = (!\Div|count\(22) & (\Div|count\(21) & (!\Div|count\(20) & !\Div|count\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(22),
	datab => \Div|count\(21),
	datac => \Div|count\(20),
	datad => \Div|count\(23),
	combout => \Div|Equal0~6_combout\);

-- Location: LCCOMB_X8_Y37_N24
\Div|Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Equal0~5_combout\ = (!\Div|count\(16) & (\Div|count\(17) & (!\Div|count\(19) & \Div|count\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(16),
	datab => \Div|count\(17),
	datac => \Div|count\(19),
	datad => \Div|count\(18),
	combout => \Div|Equal0~5_combout\);

-- Location: LCCOMB_X7_Y37_N16
\Div|Add0~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~48_combout\ = (\Div|count\(24) & (\Div|Add0~47\ $ (GND))) # (!\Div|count\(24) & (!\Div|Add0~47\ & VCC))
-- \Div|Add0~49\ = CARRY((\Div|count\(24) & !\Div|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(24),
	datad => VCC,
	cin => \Div|Add0~47\,
	combout => \Div|Add0~48_combout\,
	cout => \Div|Add0~49\);

-- Location: FF_X7_Y37_N17
\Div|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(24));

-- Location: LCCOMB_X7_Y37_N18
\Div|Add0~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~50_combout\ = (\Div|count\(25) & (!\Div|Add0~49\)) # (!\Div|count\(25) & ((\Div|Add0~49\) # (GND)))
-- \Div|Add0~51\ = CARRY((!\Div|Add0~49\) # (!\Div|count\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(25),
	datad => VCC,
	cin => \Div|Add0~49\,
	combout => \Div|Add0~50_combout\,
	cout => \Div|Add0~51\);

-- Location: FF_X7_Y37_N19
\Div|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(25));

-- Location: LCCOMB_X7_Y37_N20
\Div|Add0~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~52_combout\ = (\Div|count\(26) & (\Div|Add0~51\ $ (GND))) # (!\Div|count\(26) & (!\Div|Add0~51\ & VCC))
-- \Div|Add0~53\ = CARRY((\Div|count\(26) & !\Div|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(26),
	datad => VCC,
	cin => \Div|Add0~51\,
	combout => \Div|Add0~52_combout\,
	cout => \Div|Add0~53\);

-- Location: FF_X7_Y37_N21
\Div|count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(26));

-- Location: LCCOMB_X7_Y37_N22
\Div|Add0~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~54_combout\ = (\Div|count\(27) & (!\Div|Add0~53\)) # (!\Div|count\(27) & ((\Div|Add0~53\) # (GND)))
-- \Div|Add0~55\ = CARRY((!\Div|Add0~53\) # (!\Div|count\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(27),
	datad => VCC,
	cin => \Div|Add0~53\,
	combout => \Div|Add0~54_combout\,
	cout => \Div|Add0~55\);

-- Location: FF_X7_Y37_N23
\Div|count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(27));

-- Location: LCCOMB_X8_Y37_N22
\Div|Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Equal0~7_combout\ = (!\Div|count\(24) & (!\Div|count\(25) & (!\Div|count\(26) & !\Div|count\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(24),
	datab => \Div|count\(25),
	datac => \Div|count\(26),
	datad => \Div|count\(27),
	combout => \Div|Equal0~7_combout\);

-- Location: LCCOMB_X7_Y37_N24
\Div|Add0~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~56_combout\ = (\Div|count\(28) & (\Div|Add0~55\ $ (GND))) # (!\Div|count\(28) & (!\Div|Add0~55\ & VCC))
-- \Div|Add0~57\ = CARRY((\Div|count\(28) & !\Div|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(28),
	datad => VCC,
	cin => \Div|Add0~55\,
	combout => \Div|Add0~56_combout\,
	cout => \Div|Add0~57\);

-- Location: FF_X7_Y37_N25
\Div|count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(28));

-- Location: LCCOMB_X7_Y37_N26
\Div|Add0~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~58_combout\ = (\Div|count\(29) & (!\Div|Add0~57\)) # (!\Div|count\(29) & ((\Div|Add0~57\) # (GND)))
-- \Div|Add0~59\ = CARRY((!\Div|Add0~57\) # (!\Div|count\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(29),
	datad => VCC,
	cin => \Div|Add0~57\,
	combout => \Div|Add0~58_combout\,
	cout => \Div|Add0~59\);

-- Location: FF_X7_Y37_N27
\Div|count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(29));

-- Location: LCCOMB_X7_Y37_N28
\Div|Add0~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~60_combout\ = (\Div|count\(30) & (\Div|Add0~59\ $ (GND))) # (!\Div|count\(30) & (!\Div|Add0~59\ & VCC))
-- \Div|Add0~61\ = CARRY((\Div|count\(30) & !\Div|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div|count\(30),
	datad => VCC,
	cin => \Div|Add0~59\,
	combout => \Div|Add0~60_combout\,
	cout => \Div|Add0~61\);

-- Location: FF_X7_Y37_N29
\Div|count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(30));

-- Location: LCCOMB_X7_Y37_N30
\Div|Add0~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Add0~62_combout\ = \Div|count\(31) $ (\Div|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(31),
	cin => \Div|Add0~61\,
	combout => \Div|Add0~62_combout\);

-- Location: FF_X7_Y37_N31
\Div|count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|Add0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|count\(31));

-- Location: LCCOMB_X8_Y37_N18
\Div|Equal0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Equal0~8_combout\ = (!\Div|count\(29) & (!\Div|count\(31) & (!\Div|count\(28) & !\Div|count\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div|count\(29),
	datab => \Div|count\(31),
	datac => \Div|count\(28),
	datad => \Div|count\(30),
	combout => \Div|Equal0~8_combout\);

-- Location: LCCOMB_X8_Y37_N14
\Div|Equal0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|Equal0~9_combout\ = (\Div|Equal0~6_combout\ & (\Div|Equal0~5_combout\ & (\Div|Equal0~7_combout\ & \Div|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div|Equal0~6_combout\,
	datab => \Div|Equal0~5_combout\,
	datac => \Div|Equal0~7_combout\,
	datad => \Div|Equal0~8_combout\,
	combout => \Div|Equal0~9_combout\);

-- Location: LCCOMB_X8_Y37_N26
\Div|tmp~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|tmp~0_combout\ = \Div|tmp~q\ $ (((\Div|Equal0~9_combout\ & \Div|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div|Equal0~9_combout\,
	datac => \Div|tmp~q\,
	datad => \Div|Equal0~4_combout\,
	combout => \Div|tmp~0_combout\);

-- Location: LCCOMB_X8_Y37_N0
\Div|tmp~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Div|tmp~feeder_combout\ = \Div|tmp~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div|tmp~0_combout\,
	combout => \Div|tmp~feeder_combout\);

-- Location: FF_X8_Y37_N1
\Div|tmp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Div|tmp~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Div|tmp~q\);

-- Location: CLKCTRL_G2
\Div|tmp~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Div|tmp~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Div|tmp~clkctrl_outclk\);

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

-- Location: LCCOMB_X45_Y53_N14
\Ctrl|Selector0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|Selector0~9_combout\ = (\KbdLin[2]~input_o\ & (\KbdLin[0]~input_o\ & (\KbdLin[3]~input_o\ & \KbdLin[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KbdLin[2]~input_o\,
	datab => \KbdLin[0]~input_o\,
	datac => \KbdLin[3]~input_o\,
	datad => \KbdLin[1]~input_o\,
	combout => \Ctrl|Selector0~9_combout\);

-- Location: LCCOMB_X45_Y53_N26
\Ctrl|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|Selector2~0_combout\ = (\Ctrl|CurrentState.SCANNING~q\ & \Kack~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|CurrentState.SCANNING~q\,
	datad => \Kack~input_o\,
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

-- Location: FF_X45_Y53_N1
\Ctrl|CurrentState.ACKNOWLEDGED\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Div|ALT_INV_tmp~clkctrl_outclk\,
	asdata => \Ctrl|Selector2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|CurrentState.ACKNOWLEDGED~q\);

-- Location: LCCOMB_X45_Y53_N0
\Ctrl|Selector0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|Selector0~8_combout\ = ((\Ctrl|CurrentState.SCANNING~q\ & ((\Kack~input_o\) # (!\Ctrl|CurrentState.ACKNOWLEDGED~q\)))) # (!\Ctrl|Selector0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Kack~input_o\,
	datab => \Ctrl|Selector0~9_combout\,
	datac => \Ctrl|CurrentState.ACKNOWLEDGED~q\,
	datad => \Ctrl|CurrentState.SCANNING~q\,
	combout => \Ctrl|Selector0~8_combout\);

-- Location: LCCOMB_X45_Y53_N28
\Ctrl|CurrentState.SCANNING~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|CurrentState.SCANNING~feeder_combout\ = \Ctrl|Selector0~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Ctrl|Selector0~8_combout\,
	combout => \Ctrl|CurrentState.SCANNING~feeder_combout\);

-- Location: FF_X45_Y53_N29
\Ctrl|CurrentState.SCANNING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Div|ALT_INV_tmp~clkctrl_outclk\,
	d => \Ctrl|CurrentState.SCANNING~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|CurrentState.SCANNING~q\);

-- Location: LCCOMB_X45_Y53_N16
\Scann|Cont|Reg|FDD0|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Scann|Cont|Reg|FDD0|Q~0_combout\ = \Ctrl|CurrentState.SCANNING~q\ $ (!\Scann|Cont|Reg|FDD0|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Ctrl|CurrentState.SCANNING~q\,
	datad => \Scann|Cont|Reg|FDD0|Q~q\,
	combout => \Scann|Cont|Reg|FDD0|Q~0_combout\);

-- Location: FF_X45_Y53_N11
\Scann|Cont|Reg|FDD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Div|tmp~clkctrl_outclk\,
	asdata => \Scann|Cont|Reg|FDD0|Q~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Scann|Cont|Reg|FDD0|Q~q\);

-- Location: LCCOMB_X45_Y53_N20
\Scann|Cont|Reg|FDD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Scann|Cont|Reg|FDD1|Q~0_combout\ = \Scann|Cont|Reg|FDD1|Q~q\ $ (((!\Scann|Cont|Reg|FDD0|Q~q\ & !\Ctrl|CurrentState.SCANNING~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Scann|Cont|Reg|FDD0|Q~q\,
	datac => \Ctrl|CurrentState.SCANNING~q\,
	datad => \Scann|Cont|Reg|FDD1|Q~q\,
	combout => \Scann|Cont|Reg|FDD1|Q~0_combout\);

-- Location: FF_X45_Y53_N25
\Scann|Cont|Reg|FDD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Div|tmp~clkctrl_outclk\,
	asdata => \Scann|Cont|Reg|FDD1|Q~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Scann|Cont|Reg|FDD1|Q~q\);

-- Location: LCCOMB_X45_Y53_N10
\Scann|DEC|DeMUX2|O[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Scann|DEC|DeMUX2|O\(0) = (!\Scann|Cont|Reg|FDD0|Q~q\) # (!\Scann|Cont|Reg|FDD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Scann|Cont|Reg|FDD1|Q~q\,
	datac => \Scann|Cont|Reg|FDD0|Q~q\,
	combout => \Scann|DEC|DeMUX2|O\(0));

-- Location: LCCOMB_X45_Y53_N24
\Scann|DEC|DeMUX2|O[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Scann|DEC|DeMUX2|O\(1) = (!\Scann|Cont|Reg|FDD0|Q~q\ & \Scann|Cont|Reg|FDD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Scann|Cont|Reg|FDD0|Q~q\,
	datac => \Scann|Cont|Reg|FDD1|Q~q\,
	combout => \Scann|DEC|DeMUX2|O\(1));

-- Location: LCCOMB_X45_Y53_N8
\Scann|DEC|DeMUX3|O[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Scann|DEC|DeMUX3|O\(0) = (\Scann|Cont|Reg|FDD0|Q~q\ & !\Scann|Cont|Reg|FDD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Scann|Cont|Reg|FDD0|Q~q\,
	datac => \Scann|Cont|Reg|FDD1|Q~q\,
	combout => \Scann|DEC|DeMUX3|O\(0));

-- Location: LCCOMB_X45_Y53_N30
\Scann|DEC|DeMUX3|O[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Scann|DEC|DeMUX3|O\(1) = (!\Scann|Cont|Reg|FDD0|Q~q\ & !\Scann|Cont|Reg|FDD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Scann|Cont|Reg|FDD0|Q~q\,
	datac => \Scann|Cont|Reg|FDD1|Q~q\,
	combout => \Scann|DEC|DeMUX3|O\(1));

-- Location: LCCOMB_X45_Y53_N22
\Ctrl|Selector1~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|Selector1~9_combout\ = (((!\KbdLin[1]~input_o\) # (!\KbdLin[3]~input_o\)) # (!\KbdLin[0]~input_o\)) # (!\KbdLin[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KbdLin[2]~input_o\,
	datab => \KbdLin[0]~input_o\,
	datac => \KbdLin[3]~input_o\,
	datad => \KbdLin[1]~input_o\,
	combout => \Ctrl|Selector1~9_combout\);

-- Location: LCCOMB_X45_Y53_N12
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

-- Location: LCCOMB_X45_Y53_N18
\Ctrl|CurrentState.SENDING~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ctrl|CurrentState.SENDING~feeder_combout\ = \Ctrl|Selector1~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Ctrl|Selector1~8_combout\,
	combout => \Ctrl|CurrentState.SENDING~feeder_combout\);

-- Location: FF_X45_Y53_N19
\Ctrl|CurrentState.SENDING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Div|ALT_INV_tmp~clkctrl_outclk\,
	d => \Ctrl|CurrentState.SENDING~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|CurrentState.SENDING~q\);

-- Location: CLKCTRL_G11
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

-- Location: LCCOMB_X46_Y53_N24
\Scann|PEnc|PEnc1|Gs\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Scann|PEnc|PEnc1|Gs~combout\ = (!\KbdLin[1]~input_o\) # (!\KbdLin[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \KbdLin[0]~input_o\,
	datad => \KbdLin[1]~input_o\,
	combout => \Scann|PEnc|PEnc1|Gs~combout\);

-- Location: FF_X46_Y53_N25
\Scann|RG|FDD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Ctrl|CurrentState.SCANNING~clkctrl_outclk\,
	d => \Scann|PEnc|PEnc1|Gs~combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Scann|RG|FDD0|Q~q\);

-- Location: LCCOMB_X46_Y53_N22
\Scann|PEnc|Mux|Y~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Scann|PEnc|Mux|Y~0_combout\ = ((!\KbdLin[2]~input_o\ & \KbdLin[1]~input_o\)) # (!\KbdLin[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KbdLin[0]~input_o\,
	datac => \KbdLin[2]~input_o\,
	datad => \KbdLin[1]~input_o\,
	combout => \Scann|PEnc|Mux|Y~0_combout\);

-- Location: FF_X46_Y53_N23
\Scann|RG|FDD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Ctrl|CurrentState.SCANNING~clkctrl_outclk\,
	d => \Scann|PEnc|Mux|Y~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Scann|RG|FDD1|Q~q\);

-- Location: IOIBUF_X56_Y54_N1
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

-- Location: IOIBUF_X0_Y9_N15
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

ww_Cols(0) <= \Cols[0]~output_o\;

ww_Cols(1) <= \Cols[1]~output_o\;

ww_Cols(2) <= \Cols[2]~output_o\;

ww_Cols(3) <= \Cols[3]~output_o\;
END structure;


