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
		Kcode	: out std_logic_vector(3 downto 0);	
		
		Cols: out std_logic_vector(3 downto 0)
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

component clkDIV is
	port(
		clk_in: in std_logic;
		clk_out: out std_logic
	);
end component clkDIV;

signal Press, Scan, mclock: std_logic;
signal ntClk: std_logic;
signal columns: std_logic_vector(3 downto 0);

begin
	Div	: clkDIV			port map(clk_in => Clk, clk_out => mclock);
	ntClk <= not(mclock);
	Scann	: KeyScan		port map(Clk => mclock, rst => Reset, Kscan => Scan, KbdLin => KbdLin, KbdCol => columns, K => Kcode, Kpress => Press);
	Ctrl	: KeyControl	port map(Kack => Kack, Kpress => Press, rst => Reset, clk => ntClk, Kval => Kval, Kscan => Scan);
	Cols <= columns;
	KbdCol <= columns;
	
end structural;