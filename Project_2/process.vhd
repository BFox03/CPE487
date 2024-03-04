library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gates is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           F_OUT : out STD_LOGIC);
end gates;

architecture ifGates of gates is 
begin
    ifProcess: process (A, B, C) is
    begin 
        if (A = '1' AND B = '0' AND C = '0') then
            F_OUT <= '1';
        elsif (B = '1' AND C = '1') then
            F_OUT <= '1';
        else
            F_OUT <= '0';
        end if;
    end process ifProcess;
end ifGates;


architecture caseGates of gates is 
    signal ABC: std_logic_vector(2 downto 0);
    begin
        ABC <= A & B & C;
        caseProcess: process (ABC) is 
        begin
            case(ABC) is 
               when "100" => F_OUT <= '1';
               when "-11" => F_OUT <= '1';
               when others => F_OUT <= '0';
               end case;
    end process caseProcess;
end caseGates;
