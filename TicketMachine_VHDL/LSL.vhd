library ieee;
use ieee.std_logic_1164.all;

entity LSL is
  port(
    A  : in  std_logic_vector(9 downto 0);                  
    R  : out std_logic_vector(9 downto 0);
    CY : out std_logic
  );
end entity;

architecture rtl of LSL is
 begin
	R(9) <= A(8);
	R(8) <= A(7);
	R(7) <= A(6);
	R(6) <= A(5);
	R(5) <= A(4);
	R(4) <= A(3);
	R(3) <= A(2);
	R(2) <= A(1);
	R(1) <= A(0);
	R(0) <= '0';
	CY   <= A(9);
 end architecture;