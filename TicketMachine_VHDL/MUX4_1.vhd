library ieee;
use ieee.std_logic_1164.all;

entity MUX4_1 is
	port
	(
		I0: in std_logic;
		I1: in std_logic;
		I2: in std_logic;
		I3: in std_logic;
		S0: in std_logic;
		S1: in std_logic;
		Y: out std_logic
	);
end MUX4_1;

architecture structural of MUX4_1 is

	component MUX2_1
	port
	(
		A: in std_logic;
		B: in std_logic;
		S: in std_logic;
		Y: out std_logic
	);
	end component;
	
	signal MUX1_out: std_logic;
	signal MUX2_out: std_logic;
	
	begin
	
	MUX1: MUX2_1 port map(
			A => I0,
			B => I1,
			S => S0,
			Y => MUX1_out
		);
			
	MUX2: MUX2_1 port map(
			A => I2,
			B => I3,
			S => S0,
			Y => MUX2_out
		);
			
	MUX3: MUX2_1 port map(
			A => MUX1_out,
			B => MUX2_out,
			S => S1,
			Y => Y
		);
		
	end structural;