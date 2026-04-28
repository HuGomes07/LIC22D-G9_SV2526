library ieee;
use ieee.std_logic_1164.all;

entity PETD_tb is
end entity;

architecture PETD_tb_arch of PETD_tb is

component PETD
	port(
		TDsel	: in std_logic;
		SCLK	: in std_logic;
		SDX	: in std_logic;
		rst	: in std_logic;
		D	: out std_logic_vector(8 downto 0);
		D9	: out std_logic
	);
end component;

-- Entradas e saidas
signal SClk_TB: std_logic := '1';
signal TDsel_TB, SDX_TB, rst_tb: std_logic;
signal D_TB: std_logic_vector(8 downto 0);
signal D9_TB : std_logic;

constant SClk_period: time := 10000 ps;
constant SClk_half_period: time := SClk_period / 2;

begin
	SClk_TB <= not(SClk_TB) after SClk_half_period;
	UUT: PETD port map(
		TDsel 	=> TDsel_TB,
		SCLK 	=> SCLK_TB,
		SDX 	=> SDX_TB,
		rst 	=> rst_TB,
		D 	=> D_TB,
		D9 	=> D9_TB
	);
stimulus: process
begin
	rst_TB 		<= '1';
	TDsel_TB	<= '1';
	wait for 10 ns;
	rst_TB 		<= '0';
	TDsel_TB 	<= '0';

	SDX_TB		<= '0';
	wait for 10 ns;
	SDX_TB		<= '1';
	wait for 10 ns;
	SDX_TB		<= '0';
	wait for 10 ns;
	SDX_TB		<= '1';
	wait for 10 ns;

end process;
end architecture;