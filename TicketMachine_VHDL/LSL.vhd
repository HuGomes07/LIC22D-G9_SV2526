library ieee;
use ieee.std_logic_1164.all;

entity LSL is
  port(
    A  : in  std_logic_vector(3 downto 0);                  
    R  : out std_logic_vector(3 downto 0);
    CY : out std_logic
  );
end entity;

architecture rtl of LSL is
 begin

  R(3) <= A(2);
  R(2) <= A(1);
  R(1) <= A(0);
  R(0) <= '0';
  CY   <= A(3);
  
 end architecture;