library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
Port (a,b,c,d : in std_logic;
 sel : in std_logic_vector(1 downto 0);
      y : out std_logic
		);
end mux;


architecture arq of mux is
begin 
 with sel select
 y<=  a when "00",
		b when "01",
		c when "10",
		d when "11";

end arq;

