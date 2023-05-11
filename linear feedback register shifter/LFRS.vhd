----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2023 19:00:01
-- Design Name: 
-- Module Name: LFRS - Behavioral
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


entity LFRS is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           l : in STD_LOGIC;
           c : in STD_LOGIC;
           r : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (11 downto 0));
end LFRS;

architecture Behavioral of LFRS is
    
    signal regis : std_logic_vector(15 downto 0) := (others=>'0');
    signal feedback: std_logic := '0';
    signal clk_aux: std_logic := '0';
    signal loadA, loadB, loadC: std_logic_vector(3 downto 0) := (others=>'0');
    signal mux_sel: std_logic_vector(1 downto 0) := (others=>'0');
    signal mux_out, valueA, valueB, valueC: std_logic_vector(3 downto 0) := (others=>'0');
    signal selector: std_logic_vector(2 downto 0) := (others=>'0');
    
begin
    
    -- Level Feedback Register Shifter
    
    process(clk,reset)
    begin
        if reset = '1' then
            regis <= "0011011100010010";
        elsif rising_edge(clk) then
            regis(15 downto 1) <= regis(14 downto 0);
            regis(0) <= feedback;            
        end if;    
    end process;
    
    feedback <= ((regis(15) xor regis(13)) xor regis(12))xor regis(10);
   
 -- Mutiplexer
    mux_out <= regis(3 downto 0) when l='1' and c='0' and r='0' else
               regis(7 downto 4) when l='0' and c='1' and r='0' else
               regis(11 downto 8) when l='0' and c='0' and r='1' else
               (others=>'0');
 
 -- Demutiplexer
 process(mux_out, l, c, r)
 begin
    if l = '1' and c = '0' and r = '0' then
        valueA <= mux_out;
        valueB <= (others=>'0');
        valueC <= (others=>'0');
    elsif l = '0' and c = '1' and r = '0' then
        valueA <= (others=>'0');
        valueB <= mux_out;
        valueC <= (others=>'0');
    elsif l = '0' and c = '0' and r = '1' then
        valueA <= (others=>'0');
        valueB <= (others=>'0');
        valueC <= mux_out;
    else
        valueA <= (others=>'0');
        valueB <= (others=>'0');
        valueC <= (others=>'0');
    end if;
 end process;
 
 -- Register outputs
 process(clk, reset)
 begin
    if reset = '1' then
        loadA <= (others => '0');
        loadB <= (others => '0');
        loadC <= (others => '0');
    elsif rising_edge(clk) then
        if l = '1' then
            loadA <= valueA;
            loadB <= loadB;
            loadC <= loadC;
        elsif c = '1' then
            loadA <= loadA;
            loadB <= valueB;
            loadC <= loadC;
        elsif r = '1' then
            loadA <= loadA;
            loadB <= loadB;
            loadC <= valueC;
        else
            loadA <= loadA;
            loadB <= loadB;
            loadC <= loadC;
        end if;
    end if;
 end process;
 
 led(3 downto 0) <= loadA;
 led(7 downto 4) <= loadB;
 led(11 downto 8) <= loadC;
              
end Behavioral;
