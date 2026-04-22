library ieee;
use ieee.std_logic_1164.all;

entity KeyTransmitter_DataPath is
	port(
		D	   : in std_logic_vector(3 downto 0);
		Load  : in std_logic;
		TXclk : in std_logic;
		TXD	: in std_logic_vector(5 downto 0)
	);

end KeyTransmitter_DataPath;

architecture structural of KeyTransmitter_DataPath is

component REG4 is
	port(
		D					: in  std_logic_vector(3 downto 0);
		Q 					: out STD_LOGIC_vector(3 downto 0);
		CLK,EN,Reset 	: in STD_LOGIC
	);
end component REG4;