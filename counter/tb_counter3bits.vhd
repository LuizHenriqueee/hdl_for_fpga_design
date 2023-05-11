----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2023 17:55:03
-- Design Name: 
-- Module Name: tb_counter3bits - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_counter3bits is
--  Port ( );
end tb_counter3bits;

architecture Behavioral of tb_counter3bits is

    component counter is
        Port ( load : in STD_LOGIC;
               clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               ready : out STD_LOGIC;
               n_cnt : in STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    
    signal load :  STD_LOGIC := '0';
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC;
    signal ready : STD_LOGIC;
    signal n_cnt : STD_LOGIC_VECTOR (2 downto 0);
    
begin

    utt: counter Port map ( 
           load => load,
           clk => clk,
           reset => reset,
           ready => ready,
           n_cnt => n_cnt);
    
    -- Stimulus clock
    reset <= '1', '0' after 10ns;
    clk <= not clk after 5ns;
    n_cnt <= "111";
    
    process
        begin
            wait for 10ns;
            load <= '1';
            wait for 5ns;
            load <= '0';
            wait for 5ns;
            load <= '0';
            wait;            
    end process; 

end Behavioral;
