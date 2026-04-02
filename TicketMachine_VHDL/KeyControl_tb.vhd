library ieee;
use ieee.std_logic_1164.all;

entity KeyControl_tb is
end entity;

architecture KeyControl_tb_arch of KeyControl_tb is

component KeyControl
	port(
		Kack, Kpress, rst, clk: in std_logic;
		Kval, Kscan: out std_logic
	);
end component;

-- Entradas e saídas
signal Kack_TB, Kpress_TB, rst_TB: std_logic;
signal Clk_TB: std_logic := '1';
signal Kval_TB, Kscan_TB: std_logic;

constant Clk_period: time := 10000 ps;
constant Clk_half_period: time := Clk_period / 2;

begin
	Clk_TB <= not(Clk_TB) after Clk_half_period;
	UUT: KeyControl port map(Kack => Kack_TB,
				Kpress => Kpress_TB,
				rst => rst_TB,
				clk => Clk_TB,
				Kval => Kval_TB,
				Kscan => Kscan_TB
	);
stimulus: process
begin
	Kack_TB <= '0';
	Kpress_TB <= '0';	
	rst_TB <= '1';
	wait for Clk_period;
	rst_TB <= '0';
	wait for Clk_period * 2;
	Kack_TB <= '0';
	Kpress_TB <= '1';
	wait for Clk_period * 2;
	Kack_TB <= '1';
	Kpress_TB <= '1';
	wait for Clk_period * 2;
	Kack_TB <= '1';
	Kpress_TB <= '0';
	wait for Clk_period * 2;
	Kack_TB <= '0';
	Kpress_TB <= '1';
	wait for Clk_period * 2;
end process;
end architecture;
