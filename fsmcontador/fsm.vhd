----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2023 09:25:24
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw : in STD_LOGIC;
           s : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (2 downto 0));
end fsm;

architecture Behavioral of fsm is

    type tipo_estado is (e0,e1,e2,e3,e4,e5);
    signal estado_atual, proximo_estado: tipo_estado := e0;
    
begin
    -- Processo sequencial sincrono
    process(clk,reset)
    begin
        if reset = '1' then
            estado_atual <= e0;
        elsif rising_edge(clk) then
            estado_atual <= proximo_estado;
        end if;
    end process;
    
    -- Atualização combinacional do proximo estado
    process(estado_atual,s,sw)
    begin
        case estado_atual is
            when e0 =>
                if s = '0' and sw = '0' then
                    proximo_estado <= e1;
                elsif s = '0' and sw = '1' then
                    proximo_estado <= e5;
                else
                    proximo_estado <= e0;
                end if;
            when e1 =>
                if s = '0' and sw = '0' then
                    proximo_estado <= e2;
                elsif s = '0' and sw = '1' then
                    proximo_estado <= e0;
                else
                    proximo_estado <= e1;
                end if;
            when e2 =>
                if s = '0' and sw = '0' then
                    proximo_estado <= e3;
                elsif s = '0' and sw = '1' then
                    proximo_estado <= e1;
                else
                    proximo_estado <= e2;
                end if;
            when e3 =>
                if s = '0' and sw = '0' then
                    proximo_estado <= e4;
                elsif s = '0' and sw = '1' then
                    proximo_estado <= e2;
                else
                    proximo_estado <= e3;
                end if;
            when e4 =>
                if s = '0' and sw = '0' then
                    proximo_estado <= e5;
                elsif s = '0' and sw = '1' then
                    proximo_estado <= e3;
                else
                    proximo_estado <= e4;
                end if;
            when e5 =>
                if s = '0' and sw = '0' then
                    proximo_estado <= e1;
                elsif s = '0' and sw = '1' then
                    proximo_estado <= e4;
                else
                    proximo_estado <= e5;
                end if;
            when others =>
                proximo_estado <= e0;            
        end case; 
    end process;
    
    -- Processo combinacional para as saidas
    process(estado_atual,s,sw)
    begin
        case estado_atual is
            when e0 => led <= "000";
            when e1 => led <= "001";
            when e2 => led <= "010";
            when e3 => led <= "011";
            when e4 => led <= "100";
            when e5 => led <= "101";
            when others => led <= "000";            
        end case; 
    end process;

end Behavioral;
