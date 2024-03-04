----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2024 01:07:34 PM
-- Design Name: 
-- Module Name: mux - ifMux
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux is
    Port ( Data_in : in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (2 downto 0);
           F_CTRL : out STD_LOGIC);
end mux;

architecture ifMux of mux is
begin
    ifProcess: process (Data_in, SEL) is
    begin
        if (SEL="000") then 
            F_CTRL <= Data_in(0);
        elsif (SEL="001") then
            F_CTRL <= Data_in(1);
        elsif (SEL="010") then
            F_CTRL <= Data_in(2);
        elsif (SEL="011") then
            F_CTRL <= Data_in(3);
        elsif (SEL="100") then
            F_CTRL <= Data_in(4);
        elsif (SEL="101") then
            F_CTRL <= Data_in(5);
        elsif (SEL="110") then
            F_CTRL <= Data_in(6);
        elsif (SEL="111") then
            F_CTRL <= Data_in(7);
        else
            F_CTRL <= '0';
        end if;
    end process ifProcess;
end ifMux;

architecture convMux of mux is
begin
    convprocess: process (SEL, Data_in) is 
    begin  
        F_CTRL <= Data_in(conv_integer (SEL));
    end process convprocess;
end architecture convMux;
