library ieee;
use ieee.std_logic_1164.all;

entity Adder is
	port(
		A, B : in  std_logic_vector(3 downto 0);
		Cin   : in  std_logic;
		R    : out std_logic_vector(3 downto 0);
		Cout   : out std_logic
	);
end Adder;

architecture structural of Adder is

signal carry : std_logic_vector(3 downto 1);

begin
	U1 : entity work.FA port
		map(A => A(0), B => B(0), Ci => Cin, S => R(0), Co => carry(1));
	U2 : entity work.FA port
		map(A => A(1), B => B(1), Ci => carry(1), S => R(1), Co => carry(2));
	U3 : entity work.FA port
		map(A => A(2), B => B(2), Ci => carry(2), S => R(2), Co => carry(3));
	U4 : entity work.FA port
		map(A => A(3), B => B(3), Ci => carry(3), S => R(3), Co => Cout);
end structural;