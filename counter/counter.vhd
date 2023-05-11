----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2023 17:41:26
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( load : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ready : out STD_LOGIC;
           n_cnt : in STD_LOGIC_VECTOR (2 downto 0));
end counter;

architecture Behavioral of counter is
    
    signal cnt : STD_LOGIC_VECTOR (2 downto 0);
    
begin

    process(clk,reset)
        begin
            if reset = '1' then
                ready <= '0';
                cnt <= "000";
            elsif rising_edge(clk) then
                if cnt = n_cnt then
                    ready <= '1';
                    cnt <= "000";
                elsif load = '1' then
                    ready <= '0';
                    cnt <= std_logic_vector(unsigned(cnt) + 1);
                end if;
            end if;
    end process;

end Behavioral;
