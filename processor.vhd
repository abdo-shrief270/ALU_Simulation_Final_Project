
library ieee;
use ieee.std_logic_1164.all;
---------------------------------------------------

entity processor is
port(clk   : in std_logic);
end processor;

----------------------------------------------------

architecture Behav1 of processor is 

component pc

port (clk : in  std_logic;
     inst_add : out  std_logic_vector( 4 downto 0 ));

end component;


component register_file 
port(
	clk  :	 in std_logic;
	A_add:   in std_logic_vector(2 downto 0);
	B_add:   in std_logic_vector(2 downto 0);

	F_add:   in std_logic_vector(2 downto 0);
	F_value: in std_logic_vector(7 downto 0);

	A: 	out std_logic_vector(7 downto 0);
	B: 	out std_logic_vector(7 downto 0)

);
end component;


component instruction_memory 
port(inst_add : in std_logic_vector(4 downto 0);
	sel:    out std_logic_vector(3 downto 0);
	m  :    out std_logic;
	A_add: out std_logic_vector(2 downto 0);
	B_add: out std_logic_vector(2 downto 0);
	F_add: out std_logic_vector(2 downto 0));
end component;



component ALU
   Port (
      A : in STD_LOGIC_VECTOR(7 downto 0);
      B : in STD_LOGIC_VECTOR(7 downto 0);
      M : in std_logic;
      Sel: in STD_LOGIC_VECTOR(3 downto 0);
      f: out STD_LOGIC_VECTOR(7 downto 0)
   );
end component; 




signal inst_add :    std_logic_vector(4 downto 0);
signal m  :          std_logic;
signal A_add:        std_logic_vector(2 downto 0);
signal B_add:        std_logic_vector(2 downto 0);
signal F_add:        std_logic_vector(2 downto 0);
signal F_value:      std_logic_vector(7 downto 0);
signal A: 	     std_logic_vector(7 downto 0);
signal B: 	     std_logic_vector(7 downto 0);
signal Sel	  :  std_logic_vector(3 downto 0);
signal f	  :  std_logic_vector(7 downto 0);




begin


program_counter:pc
port map(
	clk=>clk,
	inst_add=>inst_add
);


rgister_f : register_file
port map(
	clk=>clk,
	A_add=>A_add,
	B_add=>B_add,
	F_add=>F_add,
	F_value=>F_value,
	A=>A,
	B=>B
);




inst_mem : instruction_memory
port map(
	inst_add => inst_add,
	sel =>sel,
	m   => m,
	A_add=>A_add,
	B_add=>B_add,
	F_add=>F_add
);


arithmatic_logical_unit :alu
port map(
	A=>A,
	B=>B,
	m=>m,
	sel=>sel,
	f=>F_value
);


end Behav1;
-----------------------------------------------------