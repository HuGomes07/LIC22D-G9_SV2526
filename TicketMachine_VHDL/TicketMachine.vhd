library ieee;
use ieee.std_logic_1164.all;

entity TicketMachine is
	port(
		MClk: in std_logic;
		rst: in std_logic;
		KbdLin: in std_logic_vector(3 downto 0);
		KbdCol: out std_logic_vector(3 downto 0);
		Tdelay: in std_logic_vector(1 downto 0);
		LCD: out std_logic_vector(7 downto 0);
		SW: in std_logic_vector(7 downto 0)
	);
end TicketMachine;

architecture structural of TicketMachine is

component CLKDIV is
	port(
		clk_in: in std_logic;
		clk_out: out std_logic
	);
end component CLKDIV;

component KeyboardReader is
	port(
		Clk: in std_logic;
		Reset: in std_logic;
		KbdLin: in std_logic_vector(3 downto 0);
		Tdelay: in std_logic_vector(1 downto 0);
		KbdCol: out std_logic_vector(3 downto 0);
		TXd: out std_logic
	);
end component KeyboardReader;

component UsbPort is
	port(
		inputPort:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		outputPort :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component UsbPort;

signal clk		: std_logic;
signal Xd		: std_logic;

	begin
		USBPrt:	UsbPort			port map(inputPort => SW, outputPort => LCD);
		Osc:		CLKDIV 			port map(clk_in => MClk, clk_out => clk);
		Readr: 	KeyboardReader	port map(Clk => clk, Reset => rst, KbdLin => KbdLin, Tdelay => Tdelay, KbdCol => KbdCol, TXd => Xd);
end structural;