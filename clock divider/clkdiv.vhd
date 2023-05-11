----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2023 08:51:59
-- Design Name: 
-- Module Name: clkdiv - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


entity clkdiv is
    Generic (preset: unsigned(25 downto 0):= "10111110101111000010000000");
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clkdiv_out : out STD_LOGIC);
end clkdiv;

architecture Behavioral of clkdiv is

    signal cnt: unsigned(25 downto 0) := (others => '0');
    signal clkaux: std_logic := '0';
    
begin
    
    process(clk,reset)
    begin
        if reset = '1' then
            cnt <= (others => '0');
            clkaux <= '0';
        elsif rising_edge(clk) then
            if cnt = preset then
                cnt <= (others => '0');
                clkaux <= not clkaux;
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;
    
    clkdiv_out <= clkaux;

end Behavioral;
