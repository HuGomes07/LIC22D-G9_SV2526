library ieee;
use ieee.std_logic_1164.all;

entity ShiftReg_tb is
end entity;

architecture ShiftReg_tb_arch of ShiftReg_tb is

component ShiftReg
	port(
		SerialIn, SCLK, enableShift, rst: in std_logic;
		Q: out std_logic_vector(9 downto 0)
	);
end component;

-- Entradas e saídas
signal SerialIn_TB, enableShift_TB, rst_TB: std_logic;
signal SClk_TB: std_logic := '1';
signal Q_TB: std_logic_vector(9 downto 0);

constant SClk_period: time := 10000 ps;
constant SClk_half_period: time := SClk_period / 2;

begin
	SClk_TB <= not(SClk_TB) after SClk_half_period;
	UUT: ShiftReg port map(SerialIn => SerialIn_TB,
			SCLK => SCLK_TB,
			enableShift => enableShift_TB,
			rst => rst_TB,
			Q => Q_TB
	);
stimulus: process
begin
	SerialIn_TB <= '1';
	enableShift_TB <= '0';
	rst_TB <= '1';
	wait for SClk_period;
	rst_TB <= '0';
	enableShift_TB <= '1';
	wait for SClk_period * 11;
end process;
end architecture;