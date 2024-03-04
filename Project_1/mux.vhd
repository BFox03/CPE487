library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( D0 : in STD_LOGIC;
           D1 : in STD_LOGIC;
           D2 : in STD_LOGIC;
           D3 : in STD_LOGIC;
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           MX_OUT : out STD_LOGIC);
end mux;

architecture whenmux of mux is
begin
    MX_OUT <= D0 when (SEL(1) = '0' AND SEL(0) = '0') else
              D1 when (SEL = "01") else
              D2 when (SEL(1) = '1' AND SEL(0) = '0') else
              D3 when (SEL = "11") else
              '0';
end whenmux;
