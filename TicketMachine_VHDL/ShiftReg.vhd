library ieee;
use ieee.std_logic_1164.all;

entity ShiftReg is
	port(
		SerialIn: in std_logic;
		CLK: in std_logic;
		enableShift: in std_logic;
		rst: in std_logic;
		Q: out std_logic_vector(9 downto 0)
	);
end ShiftReg;

architecture structural of ShiftReg is

component RG10 is
	port(
		D					: in  std_logic_vector(9 downto 0);
		Q 					: out STD_LOGIC_vector(9 downto 0);
		CLK,EN,Reset 	: in STD_LOGIC
	);
end component RG10;

signal serial10: std_logic_vector(9 downto 0);

begin
	serial10 <= "000000000" & SerialIn;
	REG:	RG10 port map(D => serial10, Q => Q, CLK => CLK, EN => enableShift, Reset => rst);
end structural;
