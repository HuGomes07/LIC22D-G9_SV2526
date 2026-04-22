library ieee;
use ieee.std_logic_1164.all;

entity KTControl_tb is
end entity;

architecture KTControl_tb_arch of KTControl_tb is

component KTControl
	port(
		Kval, rst, clk	: in 	std_logic;
		Count		: in 	std_logic_vector(2 downto 0);
		KBfree, CountEn, CountRst		: out 	std_logic
	);
end component;

-- Entradas e saidas
signal Kval_TB, rst_TB	: std_logic;
signal Clk_TB		: std_logic := '1';
signal Count_TB		: std_logic_vector(2 downto 0);
signal CountEn_TB, CountRst_TB: std_logic;
signal KBfree_TB	: std_logic;

constant Clk_period	: time := 10000 ps;
constant Clk_half_period: time := Clk_period / 2;

begin
	Clk_TB <= not(Clk_TB) after Clk_half_period;
	UUT: KTControl port map(rst => rst_TB,
				clk => Clk_TB,
				Kval => Kval_TB,
				Count => Count_TB,
				KBfree => KBfree_TB,
				CountEn => CountEn_TB,
				CountRst => CountRst_TB
	);
stimulus: process
begin
	rst_TB <= '1';
	Kval_TB <= '0';
	Count_TB <= "000";
	wait for Clk_period;
	rst_TB <= '0';
	wait for Clk_period;
	Kval_TB <= '1';
	Count_TB <= "000";
	wait for Clk_period;
	Count_TB <= "001";
	wait for Clk_period;
	Count_TB <= "010";
	wait for Clk_period;
	Count_TB <= "011";
	wait for Clk_period;
	Count_TB <= "100";
	wait for Clk_period;
	Count_TB <= "101";
	wait for Clk_period;
	Count_TB <= "110";
	wait for Clk_period;
	Count_TB <= "111";
	wait for Clk_period;
	Kval_TB <= '1';
	wait for Clk_period;
	Kval_TB <= '0';
	wait for Clk_period * 2;
end process;
end architecture;