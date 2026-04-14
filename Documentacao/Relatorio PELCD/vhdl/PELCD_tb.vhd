library ieee;
use ieee.std_logic_1164.all;

entity PELCD_tb is
end entity;

architecture PELCD_tb_arch of PELCD_tb is

component PELCD
	port(
		LCDsel, SCLK, SDX, rst  : in std_logic;
		D                       : out std_logic_vector(8 downto 0);
		D9                      : out std_logic
	);
end component;

signal LCDsel_TB, SDX_TB, rst_TB, D9_TB : std_logic;
signal SClk_TB                          : std_logic := '1';
signal D_TB                             : std_logic_vector(8 downto 0);
constant SClk_period                    : time := 10000 ps;
constant SClk_half_period               : time := SClk_period / 2;

begin
	SClk_TB <= not(SClk_TB) after SClk_half_period;
	UUT: PELCD port map(
		LCDsel  => LCDsel_TB,
		SCLK    => SClk_TB,
		SDX     => SDX_TB,
		rst     => rst_TB,
		D       => D_TB,
		D9      => D9_TB
	);
stimulus: process
begin
	LCDsel_TB   <= '1';
	SDX_TB      <= '1';
	rst_TB      <= '1';
	wait for SClk_period;
	rst_TB      <= '0';
	LCDsel_TB   <= '0';
	wait for SClk_period * 11;
	LCDsel_TB   <= '1';
	wait for SClk_period * 2;
end process;
end architecture;