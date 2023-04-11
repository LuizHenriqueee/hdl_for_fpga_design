----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2023 17:14:21
-- Design Name: 
-- Module Name: tb_reg_16bit - Behavioral
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

entity tb_reg_16bit is
--  Port ( );
end tb_reg_16bit;

architecture Behavioral of tb_reg_16bit is

component reg_16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           load : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (15 downto 0));
end component;


signal A :  STD_LOGIC_VECTOR (15 downto 0);
signal clk :  STD_LOGIC := '0' ;
signal reset :  STD_LOGIC;
signal load :  STD_LOGIC;
signal Y :  STD_LOGIC_VECTOR (15 downto 0);

begin

    utt: reg_16bits Port map ( 
               A => A,
               clk => clk,
               reset => reset,
               load => load,
               Y => Y);
    
    -- Stimulus Clock
    reset <= '1', '0' after 10ns;
    clk <= not clk after 5ns;   
    
    process
        begin
            wait for 10ns;
            A <= (others => '1');
            load <= '1';
            wait for 5ns;
            A <= (others => '0');
            load <= '0';
            wait for 5ns;
            A <= (others => '0');
            load <= '1';
            wait for 5ns;
            A <= (others => '1');
            load <= '0';
            wait;            
    end process;        

end Behavioral;
