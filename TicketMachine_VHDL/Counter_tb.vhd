library ieee;
use ieee.std_logic_1164.all;

entity Counter_tb is
end entity;

architecture Counter_tb_arch of Counter_tb is

component Counter
	port(
		CE,Reset, MClk	: in std_logic;
		Q		: out std_logic_vector(1 downto 0)
	);
end component;

-- Entradas e saidas
signal CE_TB, Reset_TB: std_logic;
signal MClk_TB: std_logic := '1';
signal Q_TB: std_logic_vector(1 downto 0);

constant MClk_period: time := 10000 ps;
constant MClk_half_period: time := MClk_period / 2;

begin
	MClk_TB <= not(MClk_TB) after MClk_half_period;
	UUT: Counter port map( CE => CE_TB,
			Reset => Reset_TB,
			MClk => MClk_TB,
			Q => Q_TB
	);
stimulus: process
begin
	CE_TB <= '0';
	Reset_TB <= '1';
	wait for MClk_period;
	Reset_TB <= '0';
	CE_TB <= '1';
	wait for MClk_period * 4;
end process;
end architecture;
