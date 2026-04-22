library ieee;
use ieee.std_logic_1164.all;

entity KeyTransmitter_DataPath is
    port(
        TX_clk  : in std_logic;
        reset   : in std_logic;
        load    : in std_logic;                 
        CE      : in std_logic;                
        D       : in std_logic_vector(3 downto 0);

        TX_D    : out std_logic;
        cnt_out : out std_logic_vector(2 downto 0)
    );
end KeyTransmitter_DataPath;

architecture structural of KeyTransmitter_DataPath is

    component RG4
        port(
            D : in std_logic_vector(3 downto 0);
            Q : out std_logic_vector(3 downto 0);
            CLK, EN, Reset : in std_logic
        );
    end component;

    component Counter4
        port(
            CE, Reset : in std_logic;
            MClk      : in std_logic;
            Q         : out std_logic_vector(3 downto 0)
        );
    end component;

    component MUX8_1
        port(
            I0,I1,I2,I3,I4,I5,I6,I7 : in std_logic;
            S : in std_logic_vector(2 downto 0);
            Y : out std_logic
        );
    end component;


    signal data_reg : std_logic_vector(3 downto 0);
    signal cnt4     : std_logic_vector(3 downto 0);
    signal cnt      : std_logic_vector(2 downto 0);
    signal txd_sig  : std_logic;
	 
begin

    REG: RG4 port map(
        D     => D,
        Q     => data_reg,
        CLK   => TX_clk,
        EN    => load,     
        Reset => reset
    );

    COUNTER: Counter4 port map(
        CE    => CE,       
        Reset => load,    
        MClk  => TX_clk,
        Q     => cnt4
    );

    cnt <= cnt4(2 downto 0);

    MUX_TX: MUX8_1 port map(
        I0 => '0',              
        I1 => data_reg(0),
        I2 => data_reg(1),
        I3 => data_reg(2),
        I4 => data_reg(3),
        I5 => '1',              
        I6 => '1',
        I7 => '1',
        S  => cnt,
        Y  => txd_sig
    );

    
    TX_D <= txd_sig;

    cnt_out <= cnt;

end structural;