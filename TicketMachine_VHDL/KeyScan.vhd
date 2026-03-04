library ieee;
use ieee.std_logic_1164.all;

entity KeyScan is
	port(
		MClk: in std_logic;
		rst: in std_logic;
		Kscan: in std_logic;
		K:	out std_logic_vector(3 downto 0);
		Kpress: out std_logic
	);
end KeyScan;

architecture structural of KeyScan is

component MUX4_1KeyScan is
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
end component MUX4_1KeyScan;

component Decoder is
	port(
			S:	in std_logic_vector(1 downto 0);
		E:	in std_logic;
		
		O: out std_logic_vector(3 downto 0)
	);
end component Decoder;

component CLKDIV is
	port(
		clk_in: in std_logic;
		clk_out: out std_logic
	);
end component CLKDIV;

component Counter is
	port(
		CE,Reset		: in std_logic;
		MClk  		: in std_logic; 
		Q 				: out std_logic_vector(3 downto 0)
	);
end component Counter;

signal clk: std_logic;
signal Q: std_logic_vector(3 downto 0);
signal KbdIn: std_logic_vector(3 downto 0);
signal KbdOut: std_logic_vector(3 downto 0);

	begin
		--Osc: CLKDIV port map(clk_in => MClk, clk_out => clk);
		Cont:	Counter port map(CE => Kscan, Reset => rst, MClk => MClk, Q => Q);
		DEC: Decoder port map(S(0) => Q(2), S(1) => Q(3), E => '1', O => KbdIn);
		MUX: MUX4_1KeyScan port map(I0 => KbdOut(0), I1 => KbdOut(1), I2 => KbdOut(2), I3 => KbdOut(3), S0 => Q(0), S1 => Q(1), Y => Kpress);
		K <= Q;

end structural;