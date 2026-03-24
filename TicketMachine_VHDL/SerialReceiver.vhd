library ieee;
use ieee.std_logic_1164.all;

entity SerialReceiver is
	port(
		SS		: in std_logic;
		SCLK	: in std_logic;
		SDX	: in std_logic;
		rst	: in std_logic;
		Q		: out std_logic_vector(9 downto 0)
	);
end SerialReceiver;

architecture structural of SerialReceiver is

component ShiftReg is
	port(
		SerialIn: in std_logic;
		CLK: in std_logic;
		enableShift: in std_logic;
		rst: in std_logic;
		Q: out std_logic_vector(9 downto 0)
	);
end component ShiftReg;

component RG10 is
	PORT(	
		D					: in  std_logic_vector(9 downto 0);
		Q 					: out STD_LOGIC_vector(9 downto 0);
		CLK,EN,Reset 	: in STD_LOGIC
		);
end component RG10;

signal toReg: std_logic_vector(9 downto 0);
signal nSS: std_logic;

begin
	nSS <= not(SS);
	ShiReg:	ShiftReg	port map(SerialIn => SDX, CLK => SCLK, enableShift => nSS, rst => rst, Q => toReg);
	HldReg:	RG10		port map(D => toReg, Q => Q, CLK => SS, EN => '1', Reset => rst);
end structural;
