----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2023 22:10:54
-- Design Name: 
-- Module Name: tb_full_adder - Behavioral
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

entity tb_full_adder is
--  Port ( );
end tb_full_adder;

architecture Behavioral of tb_full_adder is

component full_adder_1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Sum : out STD_LOGIC);
end component;


signal A    : STD_LOGIC;
signal B    : STD_LOGIC;
signal Cin  : STD_LOGIC;
signal Cout : STD_LOGIC;
signal Sum  :  STD_LOGIC;

begin

uut: full_adder_1bit port map( A, B, Cin, Cout, Sum);

-- estimulus
A   <= '0', '1' after 10ns, '0' after 20ns;
B   <= '0', '1' after 10ns, '1' after 20ns;
Cin <= '0', '0' after 10ns, '1' after 30ns;

end Behavioral;
