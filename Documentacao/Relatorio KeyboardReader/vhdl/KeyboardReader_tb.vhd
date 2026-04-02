library ieee;
use ieee.std_logic_1164.all;

entity KeyboardReader_tb is
end entity;

architecture KeyboardReader_tb_arch of KeyboardReader_tb is

component KeyboardReader
	port(
		Clk, Reset, Kack    : in  std_logic;
		KbdLin              : in  std_logic_vector(3 downto 0);
		Tdelay              : in  std_logic_vector(1 downto 0);
		KbdCol              : out std_logic_vector(3 downto 0);
		TXd                 : out std_logic;
		UPort               : out std_logic_vector(7 downto 0)
	);
end component;

signal MClk_TB                      : std_logic := '1';
signal Reset_TB, Kack_TB, TXd_TB    : std_logic;
signal KbdLin_TB, KbdCol_TB         : std_logic_vector(3 downto 0);
signal Tdelay_TB                    : std_logic_vector(1 downto 0);
signal UPort_TB                     : std_logic_vector(7 downto 0);
constant MClk_period                : time := 10000 ps;
constant MClk_half_period           : time := MClk_period / 2;

begin
	MClk_TB <= not(MClk_TB) after MClk_half_period;
	UUT: KeyboardReader port map(
		Clk    => MClk_TB,
		Reset  => Reset_TB,
		Kack   => Kack_TB,
		KbdLin => KbdLin_TB,
		Tdelay => Tdelay_TB,
		KbdCol => KbdCol_TB,
		TXd    => TXd_TB,
		UPort  => UPort_TB
	);
stimulus: process
begin
	Reset_TB  <= '1';
	Kack_TB   <= '0';
	KbdLin_TB <= "1111";
	wait for MClk_period;
	Reset_TB  <= '0';
	wait for MClk_period * 4;
	KbdLin_TB <= "1011";
	wait for MClk_period;
	Kack_TB   <= '1';
	wait for MClk_period;
	Kack_TB   <= '0';
	KbdLin_TB <= "1111";
	wait for MClk_period * 4;
end process;
end architecture;