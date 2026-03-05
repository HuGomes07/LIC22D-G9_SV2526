library ieee;
use ieee.std_logic_1164.all;

entity KeyScan is
	port(
		Clk: in std_logic;
		rst: in std_logic;
		Kscan: in std_logic;
		KbdLin: in std_logic_vector(4 downto 1);
		KbdCol: out std_logic_vector(4 downto 1);
		K:	out std_logic_vector(3 downto 0);
		Kpress: out std_logic
	);
end KeyScan;

architecture structural of KeyScan is

component MUX4_1KeyScan is
	port
	(
		I0,I1,I2,I3,S0,S1: in std_logic;
		Y: out std_logic
	);
end component MUX4_1KeyScan;

component Decoder is
	port(
		S:	in std_logic_vector(1 downto 0);
		E:	in std_logic;
		O: out std_logic_vector(3 downto 0)
	);
end component Decoder;



component Counter is
	port(
		CE,Reset		: in std_logic;
		MClk  		: in std_logic; 
		Q 				: out std_logic_vector(3 downto 0)
	);
end component Counter;

signal Q			: std_logic_vector(3 downto 0);

	begin
		Cont:	Counter 			port map(CE => Kscan, Reset => rst, MClk => Clk, Q => Q);
		DEC: 	Decoder 			port map(S(0) => Q(2), S(1) => Q(3), E => '1', O => KbdCol);
		MUX: 	MUX4_1KeyScan	port map(I0 => KbdLin(1), I1 => KbdLin(2), I2 => KbdLin(3), I3 => KbdLin(4), S0 => Q(0), S1 => Q(1), Y => Kpress);
		K <= Q;

end structural;