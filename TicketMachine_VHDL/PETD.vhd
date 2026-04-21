library ieee;
use ieee.std_logic_1164.all;

entity PETD is
	port(
		TDsel: in std_logic;
		SCLK	: in std_logic;
		SDX	: in std_logic;
		rst	: in std_logic;
		D		: out std_logic_vector(8 downto 0);
		D9		: out std_logic
	);
end PETD;

architecture structural of PETD is
component SerialReceiver is
	port(
		SS		: in std_logic;
		SCLK	: in std_logic;
		SDX	: in std_logic;
		rst	: in std_logic;
		Q		: out std_logic_vector(9 downto 0)
	);
end component SerialReceiver;

signal Ds: std_logic_vector(9 downto 0);
begin
	Rcv: SerialReceiver port map(SS => TDsel, SCLK => SCLK, SDX => SDX, rst => rst, Q => Ds);
	D9 <= Ds(0);
	D <= Ds(1) & Ds(2) & Ds(3) & Ds(4) & Ds(5) & Ds(6) & Ds(7) & Ds(8) & Ds(9);
end structural;
