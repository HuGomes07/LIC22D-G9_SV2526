library ieee;
use ieee.std_logic_1164.all;

entity FA is
	port(
		A, B, Ci  : in  std_logic;
		S, Co     : out std_logic
	);
end FA;

architecture structural of FA is

signal sum   : std_logic;
signal carry : std_logic_vector(1 downto 0);

begin
	U1 : entity work.HA port
		map(A => A, B => B, S => sum, Co => carry(0));
	U2 : entity work.HA port
		map(A => sum, B => Ci, S => S, Co => carry(1));
	Co <= carry(0) or carry(1);
end structural;