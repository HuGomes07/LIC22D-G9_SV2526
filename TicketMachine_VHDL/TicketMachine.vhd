library ieee;
use ieee.std_logic_1164.all;

entity TicketMachine is
	port(
		MClk		: in std_logic;
		rst		: in std_logic;
		M			: in std_logic;
		Coin		: in std_logic;
		CollectT	: in std_logic;
		Tdelay	: in std_logic_vector(1 downto 0);
		CoinId	: in std_logic_vector(2 downto 0);
		KbdLin	: in std_logic_vector(3 downto 0);
		
		Accept	: out std_logic;
		Eject		: out std_logic;
		Collect	: out std_logic;
		PRT		: out std_logic;
		LCD_En	: out std_logic;
		LCD_RS	: out std_logic;
		KbdCol	: out std_logic_vector(3 downto 0);
		LCD_Data	: out std_logic_vector(7 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(7 downto 0)
	);
end TicketMachine;

architecture structural of TicketMachine is

signal clk, Xd, D9Lcd, D9Td, Finish		: std_logic;
signal Origem, Destino	: std_logic_vector(3 downto 0);
signal UPort				: std_logic_vector(4 downto 0);
signal UsbIn, UsbOut		: std_logic_vector(7 downto 0);
signal DLcd, DTd			: std_logic_vector(8 downto 0);

begin
--					Input: Vazio[2], Finish, Kval, K[4] 	  	Output: Vazio[4], TDsel, SDX, SCLK, LCDsel
	UsbIn <= "00" & Finish & UPort;
	USBPrt:	entity work.UsbPort			port map(inputPort => UsbIn, outputPort => UsbOut);
	Osc:		entity work.CLKDIV 			port map(clk_in => MClk, clk_out => clk);
	Readr: 	entity work.KeyboardReader	port map(Clk => clk, Reset => rst, RXclk => UsbOut(4), KbdLin => KbdLin, Tdelay => Tdelay, KbdCol => KbdCol, TXd => Xd, UPort => UPort);
	ExpLCD:	entity work.PELCD				port map(LCDsel => UsbOut(0), SCLK => UsbOut(1), SDX => UsbOut(2), rst => rst, D => DLcd, D9 => D9Lcd);
	LCD_Data <= DLcd(8) & DLcd(7) & DLcd(6) & DLcd(5) & DLcd(4) & DLcd(3) & DLcd(2) & DLcd(1);
	LCD_Rs 	<= DLcd(0);
	LCD_En 	<= D9Lcd;
	ExpTic: entity work.PETD 				port map(TDsel => UsbOut(3), SCLK => UsbOut(1), SDX => UsbOut(2), rst => rst, D => DTd, D9 => D9Td);
	Origem 	<= DTd(5) & DTd(6) & DTd(7) & DTd(8);
	Destino 	<= DTd(1) & DTd(2) & DTd(3) & DTd(4);
	TickDisp:	entity work.TICKET_DISPENSER port map(RT => DTd(0), Prt => D9Td, CollectTicket => CollectT, O => Origem, D => Destino, Fn => Finish, 
					HEX0 => HEX0, HEX1 => HEX1, HEX2 => HEX2, HEX3 => HEX3, HEX4 => HEX4, HEX5 => HEX5);
end structural;