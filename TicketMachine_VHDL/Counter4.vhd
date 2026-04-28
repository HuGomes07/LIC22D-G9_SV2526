library ieee;
use ieee.std_logic_1164.all;

entity Counter4 is
    port(
        CE, Reset : in std_logic;
        MClk      : in std_logic; 
        Q         : out std_logic_vector(2 downto 0)
    );
end Counter4;

architecture structural of Counter4 is 

    signal CurrQ, RGtoAdd : std_logic_vector(2 downto 0);

begin

    Adder : entity work.Adder4 port map(
        A   => RGtoAdd,
        B   => "000",
        Cin => '1',
        R   => CurrQ
    );

    Reg : entity work.RG3 port map(
        CLK   => MClk,
        D     => CurrQ,
        Q     => RGtoAdd,
        EN    => CE,
        Reset => Reset
    );

    Q <= RGtoAdd;

end structural;