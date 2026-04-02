library ieee;
use ieee.std_logic_1164.all;

entity Counter is port(
	CE,Reset    : in  std_logic;
	MClk        : in  std_logic; 
	Q           : out std_logic_vector(1 downto 0)
);
end Counter;

architecture structural of Counter is 
	signal CurrQ,RGtoAdd : std_logic_vector(1 downto 0);
	
begin
	Adder : entity work.Adder port map(A => RGtoAdd, B=>"00", Cin=>'1', R=>CurrQ);
	Reg   : entity work.RG2   port map(CLK =>MCLK, D=>CurrQ, Q=>RGtoAdd, En=>CE, Reset=>Reset);
	Q <= RGtoAdd;
end structural;