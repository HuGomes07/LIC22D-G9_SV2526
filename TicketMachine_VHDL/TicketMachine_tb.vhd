library IEEE;
use IEEE.std_logic_1164.all;

entity TicketMachine_tb is
end entity;

architecture TicketMachine_tb_arch of TicketMachine_tb is

component TicketMachine_simul
	port(	
		MClk: in std_logic;
		rst: in std_logic;
		KbdLin: in std_logic_vector(3 downto 0);
		UsbOut: in std_logic_vector(7 downto 0);
		Tdelay: in std_logic_vector(1 downto 0);
		KbdCol: out std_logic_vector(3 downto 0);
		LCD_Data: out std_logic_vector(7 downto 0);
		LCD_En	: out std_logic;
		LCD_RS	: out std_logic
	);
end component;

--Entradas do componente
signal MClk_TB: std_logic := '1';
signal rst_TB: std_logic;
signal KbdLin_TB: std_logic_vector(3 downto 0);
signal UsbOut_TB: std_logic_vector(7 downto 0):= "00000000";
signal Tdelay_TB: std_logic_vector(1 downto 0) := "00";

--Saídas do componente
signal KbdCol_TB: std_logic_vector(3 downto 0);
signal LCD_Data_TB: std_logic_vector(7 downto 0);
signal LCD_En_TB, LCD_RS_TB: std_logic;

constant MClk_period: time := 10000 ps;
constant MClk_half_period: time := MClk_period / 2;

begin
	MClk_TB	<= not(MClk_TB) 	after MClk_half_period;
	UUT: TicketMachine_simul port map(MClk => MClk_TB,
				rst 		=> rst_TB,
				KbdLin 		=> KbdLin_TB,
				UsbOut 		=> UsbOut_TB,
				Tdelay 		=> Tdelay_TB,
				KbdCol 		=> KbdCol_TB,
				LCD_Data	=> LCD_Data_TB,
				LCD_En 		=> LCD_En_TB,
				LCD_RS 		=> LCD_RS_TB
		);
stimulus: process
begin
	KbdLin_TB <= "1111";
	UsbOut_TB <= "00000101";
	rst_TB <= '1';
	wait for MClk_period;
	UsbOut_TB <= "00000100";
	rst_TB <= '0';
	wait for MClk_period * 4;
	KbdLin_TB <= "0111";
	wait for MClk_period;
	UsbOut_TB <= "10000100";
	KbdLin_TB <= "1111";
	wait for MClk_period;
	UsbOut_TB <= "00000100";
	wait for MClk_period * 10;
	UsbOut_TB <= "00000001";
	wait for MClk_period * 2;
end process;
end architecture;
