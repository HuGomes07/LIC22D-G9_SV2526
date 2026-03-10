library ieee;
use ieee.std_logic_1164.all;

entity KeyControl is
	port(
		Kack, Kpress, rst, clk: in std_logic;
		Kval, Kscan: out std_logic
	);
end KeyControl;

architecture behavioral of KeyControl is

type STATES is (SCANNING, SENDING, ACKNOWLEDGED);
signal CurrentState, NextState: STATES;

begin
	CurrentState <= SCANNING when rst = '1' else NextState when rising_edge(Clk);
	Kscan <= '1' when (CurrentState = SCANNING) else '0';
	Kval <= '1' when (CurrentState = SENDING) else '0';

	GenerateNextState:
	process(CurrentState, Kack, Kpress)
	 begin
	  case CurrentState is
	   when SCANNING	=> if(Kpress = '1') then NextState <= SENDING;
		else NextState <= SCANNING;
		end if;

	   when SENDING => if(Kack = '1') then NextState <= ACKNOWLEDGED;
		else NextState <= SENDING;
		end if;

	   when ACKNOWLEDGED => if(Kpress = '0' and Kack = '0') then NextState <= SCANNING;
		elsif(Kpress = '1' and Kack = '0') then NextState <= SENDING;
		else NextState <= ACKNOWLEDGED;
		end if;
	  end case;
	 end process;
end behavioral;
