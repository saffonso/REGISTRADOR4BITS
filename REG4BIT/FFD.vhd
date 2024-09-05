library IEEE;
use IEEE.std_logic_1164.all;

entity FFD is
Port (c,reset : in std_logic;
dado : in std_logic;

      q : out std_logic
		);
end FFD;

architecture arq of FFD is
signal a,b : std_logic;

begin
P1: process(c,reset)
		 begin
	 IF reset = '1' then 
		q <= '0';
	 elsif c'event and c = '1' then
			q <= dado;
		end if;
end process;
end arq;