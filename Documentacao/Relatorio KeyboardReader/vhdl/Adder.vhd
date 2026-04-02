library ieee;
use ieee.std_logic_1164.all;

entity Adder is
	port(
		A, B    : in  std_logic_vector(1 downto 0);
		Cin     : in  std_logic;
		R       : out std_logic_vector(1 downto 0);
		Cout    : out std_logic
	);
end Adder;

architecture structural of Adder is

signal carry: std_logic;

begin
	U1 : entity work.FA port map(A => A(0), B => B(0), Ci => Cin  , S => R(0), Co => carry);
	U2 : entity work.FA port map(A => A(1), B => B(1), Ci => carry, S => R(1), Co => Cout);
end structural;