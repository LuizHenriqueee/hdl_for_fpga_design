----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2023 09:09:02
-- Design Name: 
-- Module Name: topmodule - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topmodule is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (15 downto 0));
end topmodule;

architecture Behavioral of topmodule is
    
    component clkdiv is
        Generic (preset: unsigned(25 downto 0):= "10111110101111000010000000");
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               clkdiv_out : out STD_LOGIC);
    end component;
    
    constant N : integer range 0 to 15 := 15;
    constant pre0 : unsigned(25 downto 0) := "00000000101111101000000000";
    
begin
    
    g1: FOR i IN 0 to N GENERATE
        myclkdiv: clkdiv
        generic map(preset => shift_left(pre0,i))
        port map(clk => clk,
                 reset => reset,
                 clkdiv_out => led(i));
    END GENERATE;

end Behavioral;
