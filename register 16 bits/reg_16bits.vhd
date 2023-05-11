----------------------------------------------------------------------------------
-- Company: 
-- Engineer: L. H. Oliveira
-- 
-- Create Date: 22.03.2023 17:06:15
-- Design Name: L. H. Oliveira
-- Module Name: reg_16bits - Behavioral
-- Project Name: registrador de 16 bits
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

entity reg_16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           load : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (15 downto 0));
end reg_16bits;

architecture Behavioral of reg_16bits is

   signal Y_ant : STD_LOGIC_VECTOR (15 downto 0);
   
begin

    process(clk,reset)
        begin
            if reset = '1' then
                Y_ant <= (others => '0');
            elsif rising_edge(clk) then
                if load = '1' then
                    Y_ant <= A;
                end if;
            end if; 
    end process;
    
    Y <= Y_ant;
    
end Behavioral;
