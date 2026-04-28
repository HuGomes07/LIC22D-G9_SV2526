library ieee;
use ieee.std_logic_1164.all;

entity KTControl_tb is
end entity;

architecture KTControl_tb_arch of KTControl_tb is

component KTControl
	port(
		Load, rst, clk: in std_logic;
		ParallelLoad: out std_logic
	);
end component;

-- Entradas e saidas
signal Load_TB, rst_TB	: std_logic;
signal Clk_TB		: std_logic := '1';
signal PL_TB		: std_logic;

constant Clk_period	: time := 10000 ps;
constant Clk_half_period: time := Clk_period / 2;

begin
	Clk_TB <= not(Clk_TB) after Clk_half_period;
	UUT: KTControl port map(rst => rst_TB,
				clk => Clk_TB,
				Load => Load_TB,
				ParallelLoad => PL_TB
	);
stimulus: process
begin
	rst_TB <= '1';
	Load_TB <= '0';
	wait for Clk_period;
	rst_TB <= '0';
	wait for Clk_period;
	Load_TB <= '1';
	wait for Clk_period * 2;
	Load_TB <= '0';
	wait for Clk_period * 2;
end process;
end architecture;