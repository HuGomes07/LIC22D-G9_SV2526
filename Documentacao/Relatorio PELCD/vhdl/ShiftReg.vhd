library ieee;
use ieee.std_logic_1164.all;

entity ShiftReg is
	port(
		SerialIn    : in std_logic;
		SCLK        : in std_logic;
		enableShift : in std_logic;
		rst         : in std_logic;
		Q           : out std_logic_vector(9 downto 0)
	);
end ShiftReg;

architecture structural of ShiftReg is

component FFD is
	port(
		CLK, RESET, SET, D, EN  : in std_logic;
		Q                       : out std_logic
	);
end component FFD;

signal nextFFD: std_logic_vector(9 downto 0);

begin
	FF9: FFD port map(CLK => SCLK, RESET => rst, SET => '0', EN => enableShift, D => SerialIn  , 
		Q => nextFFD(9));
	FF8: FFD port map(CLK => SCLK, RESET => rst, SET => '0', EN => enableShift, D => nextFFD(9), 
		Q => nextFFD(8));
	FF7: FFD port map(CLK => SCLK, RESET => rst, SET => '0', EN => enableShift, D => nextFFD(8), 
		Q => nextFFD(7));
	FF6: FFD port map(CLK => SCLK, RESET => rst, SET => '0', EN => enableShift, D => nextFFD(7), 
		Q => nextFFD(6));
	FF5: FFD port map(CLK => SCLK, RESET => rst, SET => '0', EN => enableShift, D => nextFFD(6), 
		Q => nextFFD(5));
	FF4: FFD port map(CLK => SCLK, RESET => rst, SET => '0', EN => enableShift, D => nextFFD(5),
		Q => nextFFD(4));
	FF3: FFD port map(CLK => SCLK, RESET => rst, SET => '0', EN => enableShift, D => nextFFD(4), 
		Q => nextFFD(3));
	FF2: FFD port map(CLK => SCLK, RESET => rst, SET => '0', EN => enableShift, D => nextFFD(3), 
		Q => nextFFD(2));
	FF1: FFD port map(CLK => SCLK, RESET => rst, SET => '0', EN => enableShift, D => nextFFD(2), 
		Q => nextFFD(1));
	FF0: FFD port map(CLK => SCLK, RESET => rst, SET => '0', EN => enableShift, D => nextFFD(1), 
		Q => nextFFD(0));
	Q <= nextFFD;
end structural;
