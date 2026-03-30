library ieee;
use ieee.std_logic_1164.all;

entity PEnc42 is port(
	I	: in std_logic_vector(3 downto 0);
	Gs	: out std_logic;
	A	: out std_logic_vector(1 downto 0)
);
end PEnc42;

architecture structural of PEnc42 is 
	signal As,Gss:std_logic_vector(1 downto 0);
	signal S,MuxS:std_logic;
begin
	PEnc1: entity work.PEnc port 
		map (I(0) => I(0),I(1) => I(1),A=> As(0),Gs=>Gss(0));
	PEnc2: entity work.PEnc port 
		map (I(0) => I(2),I(1) => I(3),A=> As(1),Gs=>Gss(1));
	Mux: entity work.Mux2_1 port 
		map (A=>As(0) ,B=>As(1) , S=>S ,Y=>MuxS);	
	PEnc3: entity work.PEnc port 
		map (I => Gss,A=>S,Gs=>Gs);
	A<= S & MuxS;
end structural;