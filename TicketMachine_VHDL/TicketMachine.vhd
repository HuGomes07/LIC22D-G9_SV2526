library ieee;
use ieee.std_logic_1164.all;

entity TicketMachine is
	port(
		MClk: in std_logic;
		rst: in std_logic;
		KbdLin: in std_logic_vector(3 downto 0);
		SW: in std_logic_vector(9 downto 0);		-- SW(0) -> CollectTicket
		Tdelay: in std_logic_vector(1 downto 0);
		KbdCol: out std_logic_vector(3 downto 0);
		LCD_Data: out std_logic_vector(7 downto 0);
		LCD_En	: out std_logic;
		LCD_RS	: out std_logic;
		LED: out std_logic_vector(9 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(7 downto 0)
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
		UPort: out std_logic_vector(4 downto 0);
		
		Kack: in std_logic
	);
end component KeyboardReader;

component UsbPort is
	port(
		inputPort:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		outputPort :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component UsbPort;

component PELCD is
	port(
		LCDsel: in std_logic;
		SCLK	: in std_logic;
		SDX	: in std_logic;
		rst	: in std_logic;
		D		: out std_logic_vector(8 downto 0);
		D9		: out std_logic
	);
end component PELCD;

component PETD is
	port(
		TDsel : in std_logic;
		SCLK	: in std_logic;
		SDX	: in std_logic;
		rst	: in std_logic;
		D		: out std_logic_vector(8 downto 0);
		D9		: out std_logic
	);
end component PETD;

component TICKET_DISPENSER
	port(
		RT, Prt, CollectTicket: in STD_LOGIC;
		O, D: in STD_LOGIC_VECTOR(3 downto 0);
		Fn: out STD_LOGIC;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component TICKET_DISPENSER;

signal clk		: std_logic;
signal Xd		: std_logic;
signal UPort	: std_logic_vector(4 downto 0);
signal UsbIn, UsbOut	: std_logic_vector(7 downto 0);
signal DLcd, DTd		: std_logic_vector(8 downto 0);
signal D9Lcd, D9Td, Finish		: std_logic;
signal Origem, Destino	: std_logic_vector(3 downto 0);
	begin
--					Input: Vazio[2], Finish, Kval, K[4] 	  	Output: Vazio[4], TDsel, SDX, SCLK, LCDsel
		UsbIn <= "00" & Finish & UPort;
		USBPrt:	UsbPort		port map(inputPort => UsbIn, outputPort => UsbOut);
		Osc:		CLKDIV 		port map(clk_in => MClk, clk_out => clk);
		Readr: 	KeyboardReader	port map(Clk => clk, Reset => rst, KbdLin => KbdLin, Tdelay => Tdelay, KbdCol => KbdCol, TXd => Xd, UPort => UPort, Kack => UsbOut(7));
		ExpLCD:	PELCD		port map(LCDsel => UsbOut(0), SCLK => UsbOut(1), SDX => UsbOut(2), rst => rst, D => DLcd, D9 => D9Lcd);
		LCD_Data <= DLcd(8) & DLcd(7) & DLcd(6) & DLcd(5) & DLcd(4) & DLcd(3) & DLcd(2) & DLcd(1);
		LCD_Rs 	<= DLcd(0);
		LCD_En 	<= D9Lcd;
		ExpTic: PETD port map(TDsel => UsbOut(3), SCLK => UsbOut(1), SDX => UsbOut(2), rst => rst, D => DTd, D9 => D9Td);
		Destino 	<= DLcd(3) & DLcd(2) & DLcd(1) & DLcd(0);
		Origem 	<= DLcd(7) & DLcd(6) & DLcd(5) & DLcd(4);
		TickDisp:	TICKET_DISPENSER port map(RT => DLcd(8), Prt => D9Td, CollectTicket => SW(0), O => Origem, D => Destino, Fn => Finish, 
						HEX0 => HEX0, HEX1 => HEX1, HEX2 => HEX2, HEX3 => HEX3, HEX4 => HEX4, HEX5 => HEX5);
end structural;