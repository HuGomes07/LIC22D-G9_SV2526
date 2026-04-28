library ieee;
use ieee.std_logic_1164.all;

entity ShtRegPL is
	port(
		PL, En, Clk, rst: in std_logic;
		Sin: in std_logic_vector(7 downto 0);
--			'1' & '0' & D & '1' & '0';
		Sout: out std_logic
	);
end ShtRegPL;

architecture structural of ShtRegPL is

signal Ds, Qs: std_logic_vector(7 downto 0);

begin
	MUX7: entity work.MUX2_1 port map(B => Sin(7), A => '1', S => PL, Y => Ds(7));
	FFD7: entity work.FFD port map(CLK => Clk, RESET => '0', SET => '0', D => Ds(7), EN => En, Q => Qs(7));
	MUX6: entity work.MUX2_1 port map(B => Sin(6), A => Qs(7), S => PL, Y => Ds(6));
	FFD6: entity work.FFD port map(CLK => Clk, RESET => '0', SET => '0', D => Ds(6), EN => En, Q => Qs(6));
	MUX5: entity work.MUX2_1 port map(B => Sin(5), A => Qs(6), S => PL, Y => Ds(5));
	FFD5: entity work.FFD port map(CLK => Clk, RESET => '0', SET => '0', D => Ds(5), EN => En, Q => Qs(5));
	MUX4: entity work.MUX2_1 port map(B => Sin(4), A => Qs(5), S => PL, Y => Ds(4));
	FFD4: entity work.FFD port map(CLK => Clk, RESET => '0', SET => '0', D => Ds(4), EN => En, Q => Qs(4));
	MUX3: entity work.MUX2_1 port map(B => Sin(3), A => Qs(4), S => PL, Y => Ds(3));
	FFD3: entity work.FFD port map(CLK => Clk, RESET => '0', SET => '0', D => Ds(3), EN => En, Q => Qs(3));
	MUX2: entity work.MUX2_1 port map(B => Sin(2), A => Qs(3), S => PL, Y => Ds(2));
	FFD2: entity work.FFD port map(CLK => Clk, RESET => '0', SET => '0', D => Ds(2), EN => En, Q => Qs(2));
	MUX1: entity work.MUX2_1 port map(B => Sin(1), A => Qs(2), S => PL, Y => Ds(1));
	FFD1: entity work.FFD port map(CLK => Clk, RESET => '0', SET => '0', D => Ds(1), EN => En, Q => Qs(1));
	MUX0: entity work.MUX2_1 port map(B => Sin(0), A => Qs(1), S => PL, Y => Ds(0));
	FFD0: entity work.FFD port map(CLK => Clk, RESET => '0', SET => '0', D => Ds(0), EN => En, Q => Qs(0));
	
	MUXF: entity work.MUX2_1 port map(A => Qs(0), B => '1', S => rst, Y => Sout);
	
end structural;
