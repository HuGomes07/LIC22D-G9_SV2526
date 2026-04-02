library ieee;
use ieee.std_logic_1164.all;

entity Decoder_tb is
end entity;

architecture Decoder_tb_arch of Decoder_tb is

component Decoder
	port(
		S:	in std_logic_vector(1 downto 0);
		E:	in std_logic;
		O: 	out std_logic_vector(3 downto 0)
	);
end component;

-- Entradas e saídas
signal E_TB: std_logic := '1';
signal S_TB: std_logic_vector(1 downto 0);
signal O_TB: std_logic_vector(3 downto 0);

signal 	 Clk_TB: std_logic := '1';
constant Clk_period: time := 10000 ps;
constant Clk_half_period: time := Clk_period / 2;

begin
	Clk_TB <= not(Clk_TB) after Clk_half_period;
	UUT: Decoder port map(S => S_TB,
		E => E_TB,
		O => O_TB
	);
stimulus: process
begin
	E_TB <= '1';
	S_TB <= "00";
	wait for Clk_period;
	S_TB <= "01";
	wait for Clk_period;
	S_TB <= "10";
	wait for Clk_period;
	S_TB <= "11";
	wait for Clk_period;

end process;
end architecture;