library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------
entity instruction_memory is
    port(
        inst_add : in std_logic_vector(4 downto 0);
        sel      : out std_logic_vector(3 downto 0);
        m        : out std_logic;
        A_add    : out std_logic_vector(2 downto 0);
        B_add    : out std_logic_vector(2 downto 0);
        F_add    : out std_logic_vector(2 downto 0)
    );
end instruction_memory;

architecture ins_behav1 of instruction_memory is 
    -- Declare the type for the instruction set
    type instruction_set is array (0 to 15) of std_logic_vector(15 downto 0);
    
    -- Initialize the instruction memory with values
    constant instruction_mem : instruction_set := (
        "0011001001000010",
	"0001010111101011",
	"0001111110101100",
	"0000000010101100",
	"0010011111101000",
	"0000000110000000",
	"0000000010101100",
	"0010011111101000",
	"0001111110101100",
	"0000000010101100",
	"0010011111101000",
	"0000000110000000",
	"0000000110000000",
	"0010001011010101",
	"0001010111101011",
	"0001111110101100"
    );
begin 
    -- Assign values based on the instruction address (inst_add)
    sel    <= instruction_mem(to_integer(unsigned(inst_add)))(13 downto 10);
    m      <= instruction_mem(to_integer(unsigned(inst_add)))(9);
    A_add  <= instruction_mem(to_integer(unsigned(inst_add)))(8 downto 6);
    B_add  <= instruction_mem(to_integer(unsigned(inst_add)))(5 downto 3);
    F_add  <= instruction_mem(to_integer(unsigned(inst_add)))(2 downto 0);
end ins_behav1;
