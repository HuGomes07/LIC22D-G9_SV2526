library ieee;
use ieee.std_logic_1164.all;

entity KeyTransmitter is
	port(
		Load, TXclk, Reset, MClk: in std_logic;
		D: in std_logic_vector(3 downto 0);
		
		KBfree, TXd: out std_logic
	);
end KeyTransmitter;

architecture structural of KeyTransmitter is

signal PL: std_logic;

begin
	Data: entity work.KTDataPath port map(MClk => MClk, TX_clk => TXclk, reset => Reset, PL => PL, D => D, TX_D => TXd);
	Ctrl: entity work.KTControl port map(Load => Load, rst => Reset, clk => MClk, ParallelLoad => PL);
	KBfree <= ;
end structural;
