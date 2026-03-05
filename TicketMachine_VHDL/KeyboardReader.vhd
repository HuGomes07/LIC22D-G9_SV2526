library ieee;
use ieee.std_logic_1164.all;

entity KeyboardReader is
	port(
		Clk: in std_logic;
		Reset: in std_logic;
		RxClk: in std_logic;
		KbdLin: in std_logic_vector(3 downto 0);
		Tdelay: in std_logic_vector(1 downto 0);
		KbdCol: out std_logic_vector(3 downto 0);
		TXd: out std_logic
	);
end KeyboardReader;

architecture structural of KeyboardReader is

component KeyDecode is
	port(
		Clk, Reset, Kack: in std_logic;
		Tdelay: in std_logic_vector(1 downto 0);
		KbdLin: in std_logic_vector(4 downto 1);
		Kval	: out std_logic;
		Kcode	: out std_logic_vector(3 downto 0);
		KbdCol: out std_logic_vector(4 downto 1)
	);
end component KeyDecode;

signal Kack:	std_logic;
signal Kval:	std_logic;
signal K:		std_logic_vector(3 downto 0);

begin
	Decode:	KeyDecode 		port map(Clk => Clk, Reset => Reset, Kack => Kack, Tdelay => Tdelay, KbdLin => KbdLin, Kval => Kval, Kcode => K, KbdCol => KbdCol);
--	Buff	:	RingBuffer 		port map();
--	Transm:	KeyTransmitter port map();
end structural;