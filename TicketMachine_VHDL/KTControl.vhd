library ieee;
use ieee.std_logic_1164.all;

entity KTControl is
	port(
		Kval, rst, clk: in std_logic;
		Count: in std_logic_vector(2 downto 0);
		KBfree, CountEn, CountRst: out std_logic
	);
end KTControl;

architecture behavioral of KTControl is

type STATES is (WAITING, COUNTE, RSTCOUNTER);
signal CurrentState, NextState: STATES;

begin
	CurrentState <= WAITING when rst = '1' else NextState when rising_edge(Clk);
	KBfree <= '1' when (CurrentState = RSTCOUNTER) else '0';
	CountEn <= '1' when (CurrentState = COUNTE) else '0';
	CountRst <= '1' when (CurrentState = RSTCOUNTER) else '0';

	GenerateNextState:
	process(CurrentState, Kval, Count)
	begin
	 case CurrentState is
		when WAITING => if(Kval = '1') then NextState <= COUNTE;
			else NextState <= WAITING;
			end if;

		when COUNTE => if(Count = "111") then NextState <= RSTCOUNTER;
			else NextState <= COUNTE;
			end if;

		when RSTCOUNTER => if(Kval = '0') then NextState <= WAITING;
			else NextState <= RSTCOUNTER;
			end if;
	 end case;
	end process;
end behavioral;
