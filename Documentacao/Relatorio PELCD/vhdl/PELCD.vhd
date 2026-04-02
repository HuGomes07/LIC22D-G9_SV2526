library ieee;
use ieee.std_logic_1164.all;

entity PELCD is
	port(
		LCDsel  : in std_logic;
		SCLK	: in std_logic;
		SDX	    : in std_logic;
		rst	    : in std_logic;
		D       : out std_logic_vector(8 downto 0);
		D9      : out std_logic
	);
end PELCD;

architecture structural of PELCD is
component SerialReceiver is
	port(
		SS      : in std_logic;
		SCLK    : in std_logic;
		SDX     : in std_logic;
		rst     : in std_logic;
		Q       : out std_logic_vector(9 downto 0)
	);
end component SerialReceiver;

signal RcvOut: std_logic_vector(9 downto 0);
begin
	Rcv: SerialReceiver port map(SS => LCDsel, SCLK => SCLK, SDX => SDX, rst => rst, Q => RcvOut);
	D <= RcvOut(8) & RcvOut(7) & RcvOut(6) & RcvOut(5) & RcvOut(4) & RcvOut(3) & RcvOut(2) & RcvOut(1) & RcvOut(0);
	D9 <= RcvOut(9);
end structural;
