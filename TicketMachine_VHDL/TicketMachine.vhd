library ieee;
use ieee.std_logic_1164.all;

entity TicketMachine is
port(
O: out std_logic
);
end TicketMachine;

architecture structural of TicketMachine is
begin
O <= '0';
end structural;