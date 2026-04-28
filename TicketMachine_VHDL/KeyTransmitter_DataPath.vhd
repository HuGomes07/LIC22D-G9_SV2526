library ieee;
use ieee.std_logic_1164.all;

entity KTDataPath is
	port(
		MClk	: in std_logic;
		TX_clk  : in std_logic;
		reset   : in std_logic;
		PL	: in std_logic;                           
        	D       : in std_logic_vector(3 downto 0);
        	TX_D    : out std_logic
    );
end KTDataPath;

architecture structural of KTDataPath is
 
signal Clk	: std_logic;
signal Frame	: std_logic_vector(7 downto 0);
begin
	Frame <= '1' & '0' & D & '1' & '0';
	MUX	: entity work.MUX2_1 port map(A => TX_clk, B => MClk, S => PL, Y => Clk);
	ShReg	: entity work.ShtRegPL port map(PL => PL, Sin => Frame, En => '1', rst => reset, clk => Clk, Sout =>TX_D);
end structural;