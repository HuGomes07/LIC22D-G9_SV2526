library ieee;
use ieee.std_logic_1164.all;

entity TicketMachine is
	port(
		MClk	: in std_logic;
		rst	: in std_logic;
		KbdLin: in std_logic_vector(3 downto 0);
		Tdelay: in std_logic_vector(1 downto 0);
		LCDdat: out std_logic_vector(7 downto 0);
		LCD_RS	: out std_logic;
		LCD_EN	: out std_logic;
		KbdCol: out std_logic_vector(3 downto 0)
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
		TXd: out std_logic;
		UPort: out std_logic_vector(7 downto 0)
	);
end component KeyboardReader;

component PELCD is
	port(
		LCDsel: in std_logic;
		SCLK	: in std_logic;
		SDX	: in std_logic;
		rst	: in std_logic;
		D		: out std_logic_vector(8 downto 0);
		D9		: out std_logic
	);
end component;

component UsbPort is
	port(
		inputPort:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		outputPort :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component UsbPort;

signal clk		: std_logic;
signal Xd		: std_logic;
signal USBin	: std_logic_vector(7 downto 0);
signal USBout	: std_logic_vector(7 downto 0);
signal nSel		: std_logic;
signal D			: std_logic_vector(8 downto 0);
signal D9		: std_logic;

	begin
		Osc:		CLKDIV 			port map(clk_in => MClk, clk_out => clk);
		Readr: 	KeyboardReader	port map(Clk => clk, Reset => rst, KbdLin => KbdLin, Tdelay => Tdelay, KbdCol => KbdCol, TXd => Xd, UPort => USBin);
		nSel <= not(USBout(0));
		PortLCD:	PELCD				port map(LCDsel => nSel, SCLK => USBout(1), SDX => USBout(2), rst => rst, D => D, D9 => D9);
--												Input: Outros[3], Kval[4], K		Output: Outros[4], Selec, CLK, SDX
		USBPrt:	UsbPort			port map(inputPort => USBin, outputPort => USBout);
		LCDdat <= D(7) & D(6) & D(5) & D(4) & D(3) & D(2) & D(1) & D(0);
		LCD_RS <= D(8);
		LCD_EN <= D9;
end structural;