library ieee;
use ieee.std_logic_1164.all;

entity SerialReceiver_tb is
end entity;

architecture SerialReceiver_tb_arch of SerialReceiver_tb is

component SerialReceiver
	port(
		SS, SCLK, SDX, rst	: in std_logic;
		Q			: out std_logic_vector(9 downto 0)
	);
end component;

-- Entradas e saídas
signal SS_TB, SDX_TB, rst_TB: std_logic;
signal SClk_TB: std_logic := '1';
signal Q_TB: std_logic_vector(9 downto 0);

constant SClk_period: time := 10000 ps;
constant SClk_half_period: time := SClk_period / 2;

begin
	SClk_TB <= not(SClk_TB) after SClk_half_period;
	UUT: SerialReceiver port map( SS => SS_TB,
				SCLK => SCLK_TB,
				SDX => SDX_TB,
				rst => rst_TB,
				Q => Q_TB
	);
stimulus: process
begin
	SS_TB <= '1';
	SDX_TB <= '1';
	rst_TB <= '1';
	wait for SClk_period;
	rst_TB <= '0';
	SS_TB <= '0';
	wait for SClk_period * 11;
	SS_TB <= '1';
	wait for SClk_period;
end process;
end architecture;
