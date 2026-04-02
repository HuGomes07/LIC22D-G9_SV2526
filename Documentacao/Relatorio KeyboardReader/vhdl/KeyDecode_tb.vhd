library ieee;
use ieee.std_logic_1164.all;

entity KeyDecode_tb is
end entity;

architecture KeyDecode_tb_arch of KeyDecode_tb is

component KeyDecode
	port(
		Clk     : in  std_logic;
		Reset   : in  std_logic;
		Kack    : in  std_logic;
		Tdelay  : in  std_logic_vector(1 downto 0);
		KbdLin  : in  std_logic_vector(3 downto 0);
		Kval    : out std_logic;
		KbdCol  : out std_logic_vector(3 downto 0);
		Kcode   : out std_logic_vector(3 downto 0)
	);
end component;

signal Clk_TB                       : std_logic := '1';
signal Reset_TB, Kack_TB, Kval_TB   : std_logic;
signal Tdelay_TB                    : std_logic_vector(1 downto 0);
signal KbdLin_TB                    : std_logic_vector(3 downto 0) := "1111";
signal KbdCol_TB, Kcode_TB          : std_logic_vector(3 downto 0);
constant Clk_period                 : time := 10000 ps;
constant Clk_half_period            : time := Clk_period / 2;

begin
	Clk_TB <= not(Clk_TB) after Clk_half_period;
	UUT: KeyDecode port map(
		Clk    => Clk_TB,
		Reset  => Reset_TB,
		Kack   => Kack_TB,
		Tdelay => Tdelay_TB,
		KbdLin => KbdLin_TB,
		Kval   => Kval_TB,
		KbdCol => KbdCol_TB,
		Kcode  => Kcode_TB
	);
stimulus: process
begin
	Kack_TB    <= '0';
	Tdelay_TB  <= "00";
	Reset_TB   <= '1';
	wait for Clk_period;
	Reset_TB   <= '0';
	wait for Clk_period * 4;
	KbdLin_TB  <= "1101";
	wait for Clk_period * 2;
	Kack_TB    <= '1';
	KbdLin_TB  <= "1111";
	wait for Clk_period * 4;	
end process;
end architecture;