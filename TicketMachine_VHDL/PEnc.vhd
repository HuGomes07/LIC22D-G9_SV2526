library ieee;
use ieee.std_logic_1164.all;

entity PEnc is port(
	I		: in std_logic_vector(1 downto 0);
	A,Gs	: out std_logic
);
end PEnc;

architecture structural of PEnc is 
	
begin
	Gs<=I(0) or I(1);
	A<=not I(0);	
	
end structural;