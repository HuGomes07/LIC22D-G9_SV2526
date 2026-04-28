library ieee;
use ieee.std_logic_1164.all;

entity KTControl is
	port(
		Load, rst, clk: in std_logic;
		ParallelLoad: out std_logic
	);
end KTControl;

architecture behavioral of KTControl is

type STATES is (WAITVAL, SHIFTVAL);
signal CurrentState, NextState: STATES;

begin
	CurrentState <= WAITVAL when rst = '1' else NextState when rising_edge(Clk);
	ParallelLoad <= '1' when (CurrentState = WAITVAL) else '0';

	GenerateNextState:
	process(CurrentState, Load)
	begin
	 case CurrentState is
		when WAITVAL => if(Load = '1') then NextState <= SHIFTVAL;
			else NextState <= WAITVAL;
			end if;

		when SHIFTVAL => if(Load = '0') then NextState <= WAITVAL;
			else NextState <= SHIFTVAL;
			end if;
	 end case;
	end process;
end behavioral;
