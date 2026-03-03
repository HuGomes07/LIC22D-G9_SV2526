library ieee;
use ieee.std_logic_1164.all;

entity MUX2_1KeyScan is
	port
	(
		A: in std_logic;
		B: in std_logic;
		S: in std_logic;
		Y: out std_logic
	);
end MUX2_1KeyScan;

architecture structural of MUX2_1KeyScan is
	
	begin
		Y <= (A and (not S)) or (B and S);
	end structural;