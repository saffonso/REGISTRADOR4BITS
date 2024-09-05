library IEEE;
use IEEE.std_logic_1164.all;

entity reg4bit is
Port(I : in std_logic_vector(3 downto 0);
	  sel :in std_logic_vector(1 downto 0);
	  clock : in std_logic;
	  clear : in std_logic;
	  S : out std_logic_vector(3 downto 0));
end reg4bit;  


architecture arq of reg4bit is

component MUX is 
Port(a,b,c,d : in std_logic;
		sel : in std_logic_vector(1 downto 0);
      y : out std_logic);
end component;

component FFD is
port(c,reset : in std_logic;
dado : in std_logic;
      q : out std_logic);
end component;
signal q : std_logic_vector(3 downto 0);
signal D : std_logic_vector(3 downto 0);
begin

M3: MUX port map(a=> Q(3),
						b=> Q(2),
						c=> '0',
						d=> I(3),
						sel=>sel,
						y=>D(3));
						
M2: MUX port map(a=> Q(2),
						b=> Q(1),
						c=> Q(3),
						d=> I(2),
						sel=>sel,
						y=>D(2));
						
M1: MUX port map(a=> Q(1),
						b=> Q(0)	,
						c=> Q(2),
						d=> I(1),
						sel=>sel,
						y=>D(1));
						
M0: MUX port map(a=> Q(0),
						b=> '1',
						c=> Q(1),
						d=> I(0),
						sel=>sel,
						y=>D(0));

F3: FFD port map( Q => Q(3),
						dado=>D(3),
						reset=> clear,
						c=> clock);
						
F2: FFD port map(Q => Q(2),
						dado=>D(2),
						reset=> clear,
						c=> clock);
						
F1: FFD port map(Q => Q(1),
						dado=>D(1),
						reset=> clear,
						c=> clock);
						
F0: FFD port map(Q => Q(0),
						dado=>D(0),
						reset=> clear,
						c=> clock);	

S <= Q;					
end arq;