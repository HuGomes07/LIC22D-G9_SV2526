library ieee;
use ieee.std_logic_1164.all;

entity KeyDecode is
	port(
		Clk	: in std_logic;
		Reset	: in std_logic;
		KbdLin: in std_logic_vector(3 downto 0);
		Tdelay: in std_logic_vector(1 downto 0);
		Kack	: in std_logic;
		KbdCol: out std_logic_vector(3 downto 0);
		Kval	: out std_logic;
		Kcode	: out std_logic_vector(3 downto 0)
	);
end KeyDecode;

architecture structural of KeyDecode is

component KeyScan is
	port(
		Clk: in std_logic;
		rst: in std_logic;
		Kscan: in std_logic;
		KbdLin: in std_logic_vector(3 downto 0);
		KbdCol: out std_logic_vector(3 downto 0);
		K:	out std_logic_vector(3 downto 0);
		Kpress: out std_logic
	);
end component KeyScan;

component KeyControl is
	port(
		Kack, Kpress, rst, clk: in std_logic;
		Kval, Kscan: out std_logic
	);
end component KeyControl;

signal Press, Scan: std_logic;
signal ntClk: std_logic;

begin
	ntClk <= not(Clk);
	Ctrl	: KeyControl	port map(Kack => Kack, Kpress => Press, rst => Reset, clk => ntClk, Kval => Kval, Kscan => Scan);
	Scann	: KeyScan	port map(Clk => Clk, rst => Reset, Kscan => Scan, KbdLin => KbdLin, KbdCol => KbdCol, K => Kcode, Kpress => Press);
end structural;