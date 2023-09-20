----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2023 10:22:57 AM
-- Design Name: 
-- Module Name: karaSimsek_Led_Blinking - Behavioral
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
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity karaSimsek_Led_Blinking is
--   Port ( );
    port( 
            led_4 : out std_logic_vector(3 downto 0);
            sys_clk : in std_logic  );
            
end karaSimsek_Led_Blinking;

architecture Behavioral of karaSimsek_Led_Blinking is
signal led : std_logic :='0';

type led_Status is (LED_0,LED_1,LED_2,LED_3);
signal led_state : led_Status := LED_0;
begin
process(sys_clk) is
variable counter : integer := 0;
begin
    if rising_edge(sys_clk) then
        if(counter=0)then
        case led is
            when LED_0 => 
                led_4 <= "0001";
                led_state <= LED_1;
            when LED_1 => 
                led_4 <= "0001";
                led_state <= LED_2;
            when LED_2 => 
                led_4 <= "0001";
                led_state <= LED_3;
            when LED_3 => 
                led_4 <= "0001";
                led_state <= LED_0;
        end case;
        end if;
        counter := counter + 1; 
        if counter = 125e+6 then
            counter := 0;
    end if;
    
   end process;
  end Behavioral;


end Behavioral;
