library ieee;
use ieee.std_logic_1164.all;

entity MUX8_1 is
    port(
        I0,I1,I2,I3,I4,I5,I6,I7 : in std_logic;
        S : in std_logic_vector(2 downto 0);
        Y : out std_logic
    );
end MUX8_1;

architecture structural of MUX8_1 is

    component MUX4_1
        port(
            I0,I1,I2,I3 : in std_logic;
            S0,S1 : in std_logic;
            Y : out std_logic
        );
    end component;

    component MUX2_1
        port(
            A : in std_logic;
            B : in std_logic;
            S : in std_logic;
            Y : out std_logic
        );
    end component;

    signal muxA_out, muxB_out : std_logic;

begin

    MUX_A: MUX4_1 port map(
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        S0 => S(0),
        S1 => S(1),
        Y  => muxA_out
    );

    MUX_B: MUX4_1 port map(
        I0 => I4,
        I1 => I5,
        I2 => I6,
        I3 => I7,
        S0 => S(0),
        S1 => S(1),
        Y  => muxB_out
    );

    MUX_FINAL: MUX2_1 port map(
        A => muxA_out,
        B => muxB_out,
        S => S(2),
        Y => Y
    );

end structural;