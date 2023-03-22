----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2023 22:29:31
-- Design Name: 
-- Module Name: tb_voto_maioria - Behavioral
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

entity tb_voto_maioria is
--  Port ( );
end tb_voto_maioria;

architecture Behavioral of tb_voto_maioria is


component voto_maioria is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           V : out STD_LOGIC);
end component;

signal A : STD_LOGIC;
signal B : STD_LOGIC;
signal C :  STD_LOGIC;
signal V :  STD_LOGIC;

begin

utt: voto_maioria port map ( A, B, C, V);

-- Estimulus
A <= '0', '1' after 10ns, '0' after 40ns;
B <= '0', '1' after 20ns, '0' after 30ns;
C <= '0', '1' after 30ns;

end Behavioral;
