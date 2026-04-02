library ieee;
use ieee.std_logic_1164.all;

entity KeyScan_tb is
end entity;

architecture KeyScan_tb_arch of KeyScan_tb is

component KeyScan
	port(
		Clk, rst, Kscan : in  std_logic;
		KbdLin          : in  std_logic_vector(3 downto 0);
		KbdCol          : out std_logic_vector(3 downto 0);
		K               : out std_logic_vector(3 downto 0);
		Kpress          : out std_logic
	);
end component;

signal Clk_TB                        : std_logic := '1';
signal Reset_TB, Kscan_TB, Kpress_TB : std_logic;
signal KbdLin_TB, KbdCol_TB, K_TB	 : std_logic_vector(3 downto 0);
constant Clk_period                  : time := 10000 ps;
constant Clk_half_period             : time := Clk_period / 2;

begin
	Clk_TB <= not(Clk_TB) after Clk_half_period;
	UUT: KeyScan port map(
		Clk    => Clk_TB,
		rst    => Reset_TB,
		Kscan  => Kscan_TB,
		KbdLin => KbdLin_TB,
		KbdCol => KbdCol_TB,
		K      => K_TB,
		Kpress => Kpress_TB
	);
stimulus: process
begin
	Kscan_TB   <= '1';
	KbdLin_TB  <= "1111";
	Reset_TB   <= '1';
	wait for Clk_period;
	Reset_TB   <= '0';
	wait for Clk_period * 4;
	KbdLin_TB  <= "1011";
	Kscan_TB   <= '0';
	wait for Clk_period;
	KbdLin_TB  <= "1111";
	Kscan_TB   <= '1';
	wait for Clk_period * 4;
end process;
end architecture;
