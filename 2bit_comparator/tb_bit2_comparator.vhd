----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2023 21:17:23
-- Design Name: 
-- Module Name: tb_bit2_comparator - Behavioral
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

entity tb_bit2_comparator is
--  Port ( );
end tb_bit2_comparator;

architecture Behavioral of tb_bit2_comparator is

component bit2_comparator is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (1 downto 0));
end component;



signal A :  STD_LOGIC_VECTOR (1 downto 0) := "00";
signal B :  STD_LOGIC_VECTOR (1 downto 0) := "00";
signal Y :  STD_LOGIC_VECTOR (1 downto 0) := "00";

begin

utt: bit2_comparator port map( A, B, Y );

--estimulus
A <= "00", "01" after 10ns, "11" after 20ns;
B <= "00", "01" after 10ns, "11" after 30ns;

end Behavioral;
