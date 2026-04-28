LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY RG3 IS
PORT(	D					: in  std_logic_vector(2 downto 0);
		Q 					: out STD_LOGIC_vector(2 downto 0);
		CLK,EN,Reset 	: in STD_LOGIC
		);
END RG3;

ARCHITECTURE logicFunction OF RG3 IS
BEGIN
	
	FDD0: entity work.FFD port
		map (CLK=>CLK, RESET =>Reset,D=>D(0), Q=>Q(0), SET =>'0', EN=>EN);
	FDD1: entity work.FFD port
		map (CLK=>CLK, RESET =>Reset,D=>D(1), Q=>Q(1), SET =>'0', EN=>EN);
	FDD2: entity work.FFD port
		map (CLK=>CLK, RESET =>Reset,D=>D(2), Q=>Q(2), SET =>'0', EN=>EN);


END LogicFunction;