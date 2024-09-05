library IEEE;
use IEEE.std_logic_1164.all;

entity FFD is
Port (D,clock : in std_logic;
      q : out std_logic
		);
end FFD;

architecture arq of FFD is
signal a,b : std_logic;
begin
P1: process(clock,D)
	 begin
		if clock'EVENT and clock = '1' then
			q <= d;
		end if;
end process;
end arq;