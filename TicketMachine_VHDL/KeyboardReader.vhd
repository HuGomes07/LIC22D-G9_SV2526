library ieee;
use ieee.std_logic_1164.all;

entity KeyboardReader is
	port(
		Clk: in std_logic;
		Reset: in std_logic;
		RXclk: in std_logic;
		KbdLin: in std_logic_vector(3 downto 0);
		Tdelay: in std_logic_vector(1 downto 0);
		KbdCol: out std_logic_vector(3 downto 0);
		TXd: out std_logic;
		UPort: out std_logic_vector(4 downto 0)
	);
end KeyboardReader;

architecture structural of KeyboardReader is

signal Kval, Kack:	std_logic;
signal K:		std_logic_vector(3 downto 0);

begin
	Decode:	entity work.KeyDecode 		port map(Clk => Clk, Reset => Reset, Kack => Kack, Tdelay => Tdelay, KbdLin => KbdLin, Kval => Kval, Kcode => K, KbdCol => KbdCol);
--	Buff	:	RingBuffer 		port map();
	Transm:	entity work.KeyTransmitter port map(Load => Kval, TXclk => RXclk, Reset => Reset, MCLK => Clk, D => K, KBfree => Kack, TXd => TXd);
	UPort <= Kval & K;
end structural;