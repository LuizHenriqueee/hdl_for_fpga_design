----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2023 09:49:36
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topmodule is
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (2 downto 0));
end topmodule;

architecture Behavioral of topmodule is

    component fsm is
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               sw : in STD_LOGIC;
               s : in STD_LOGIC;
               led : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component clkdiv is
        Generic (preset: unsigned(25 downto 0):= "10111110101111000010000000");
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               clkdiv_out : out STD_LOGIC);
    end component;
    
    COMPONENT vio_0
          PORT (
            clk : IN STD_LOGIC;
            probe_in0 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
          );
    END COMPONENT;
    
    signal s_reset, s_sw, s_s, s_clkdiv: std_logic := '0';
    signal s_led: std_logic_vector(2 downto 0) := "000";
    
begin
    
    My_clkdiv: clkdiv Generic map ( preset => "10111110101111000010000000")
               Port map ( 
               clk => clk,
               reset => s_reset,
               clkdiv_out => s_clkdiv);
    
    My_FSM: fsm Port map ( 
               clk => s_clkdiv,
               reset => s_reset,
               sw => s_sw,
               s => s_s,
               led => s_led);
    
    my_vio : vio_0 PORT MAP (
                clk => clk,
                probe_in0 => s_led,
                probe_out0(0) => s_reset,
                probe_out1(0) => s_s,
                probe_out2(0) => s_sw);
    
    led <= s_led;
    
end Behavioral;
