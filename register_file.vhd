library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
    port(
        clk     : in std_logic;
        A_add   : in std_logic_vector(2 downto 0);
        B_add   : in std_logic_vector(2 downto 0);
        F_add   : in std_logic_vector(2 downto 0);
        F_value : in std_logic_vector(7 downto 0);
        A       : out std_logic_vector(7 downto 0);
        B       : out std_logic_vector(7 downto 0)
    );
end register_file;

architecture rf_behav of register_file is
    type registers is array(0 to 7) of std_logic_vector(7 downto 0);

    signal reg: registers := (
        "11000010",  -- Initial values for registers
        "11010101",
        "11101011",
        "11000010",
        "11010101",
        "11101011",
        "11000010",
        "11010101"
    );

begin
    process(clk)
    begin
        if falling_edge(clk) then
            -- Update register value at the index specified by F_add with F_value
            reg(to_integer(unsigned(F_add))) <= F_value;
        end if;
    end process;

    -- Output the values from registers based on A_add and B_add addresses
    A <= reg(to_integer(unsigned(A_add)));
    B <= reg(to_integer(unsigned(B_add)));
end rf_behav;
