library ieee;
use ieee.std_logic_1164.all;

entity Adder4 is
    port(
        A   : in  std_logic_vector(2 downto 0);
        B   : in  std_logic_vector(2 downto 0);
        Cin : in  std_logic;
        R   : out std_logic_vector(2 downto 0)
    );
end Adder4;

architecture structural of Adder4 is
    signal carry : std_logic_vector(3 downto 0);
begin

    carry(0) <= Cin;

    FA0: entity work.FA port map(
        A => A(0), B => B(0), Ci => carry(0),
        S => R(0), Co => carry(1)
    );

    FA1: entity work.FA port map(
        A => A(1), B => B(1), Ci => carry(1),
        S => R(1), Co => carry(2)
    );

    FA2: entity work.FA port map(
        A => A(2), B => B(2), Ci => carry(2),
        S => R(2), Co => carry(3)
    );

end structural;