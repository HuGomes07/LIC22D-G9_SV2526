library ieee;
use ieee.std_logic_1164.all;


entity DeMUX is
	port(
		Y: in  std_logic;
		E: in  std_logic;
		S: in  std_logic;
		O: out std_logic_vector(1 downto 0)
	);
end DeMUX;

architecture structural of DeMUX is
	begin
		O(0) <= E and not(S) and Y;
		O(1) <= E and S and Y;
end structural;