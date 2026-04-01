library ieee;
use ieee.std_logic_1164.all;

entity PEnc42_tb is
end entity;

architecture Penc42_tb_arch of PEnc42_tb is

component PEnc42
	port(
		I	: in std_logic_vector(3 downto 0);
		Gs	: out std_logic;
		A	: out std_logic_vector(1 downto 0)
	);
end component;

-- Entradas e saídas
signal MClk_TB: std_logic := '1';
signal Gs_TB: std_logic;
signal I_TB : std_logic_vector(3 downto 0);
signal A_TB : std_logic_vector(1 downto 0);

constant MClk_period: time := 10000 ps;
constant MClk_half_period: time := MClk_period / 2;

begin
	MClk_TB <= not(MClk_TB) after MClk_half_period;
	UUT: PEnc42 port map( Gs => Gs_TB,
			I => I_TB,
			A => A_TB
	);
stimulus: process
begin
	I_TB <= "0001";
	wait for MClk_period;	

	I_TB <= "0010";
	wait for MClk_period;	

	I_TB <= "0100";
	wait for MClk_period;	

	I_TB <= "1000";
	wait for MClk_period;	

end process;
end architecture;