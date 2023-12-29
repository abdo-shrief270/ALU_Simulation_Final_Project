library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ALU_TB is
end entity ALU_TB;

architecture behavioral of ALU_TB is
    -- Component declaration for the DUT (Design Under Test)
    component ALU is
        port (
            A, B: in std_logic_vector(7 downto 0);
	    M: in std_logic;
            Sel: in std_logic_vector(3 downto 0);
            F: out std_logic_vector(7 downto 0)
        );
    end component;

    -- Testbench signals
    signal A: std_logic_vector(7 downto 0); 
    signal B: std_logic_vector(7 downto 0);
    signal F: std_logic_vector(7 downto 0);
    signal Sel: std_logic_vector(3 downto 0);
    signal M: std_logic:='1';
begin
    -- Instantiate the DUT
    uut: ALU port map (
        A => A,
        B => B,
        Sel => Sel,
        F => F,
        M => M
    );

    -- Stimulus process
    stim_proc: process
    begin

        A <= "10101001";
        B <= "01010101";


        Sel <= "0000";
	M <= '0';
        wait for 10 ns;
        assert F = A report "sel=0000 'A' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = (not A) report "sel=0000 '(not A)' failed!" severity error;




        Sel <= "0001";
	M <= '0';
        wait for 10 ns;
        assert F = (A OR B) report "sel=0001 '(A OR B)' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = (A NOR B) report "sel=0001 '(A NOR B)'failed!" severity error;





        Sel <= "0010";
	M <= '0';
        wait for 10 ns;
        assert F = (A OR (NOT B)) report "sel=0010 '(A OR (NOT B))' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = ((NOT A) AND B) report "sel=0010 '((NOT A) AND B)' failed!" severity error;




        Sel <= "0011";
	M <= '0';
        wait for 10 ns;
        assert F = "11111111" report "sel=0011 '(11111111)' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = "00000000" report "sel=0011 '(00000000)' failed!" severity error;




        Sel <= "0100";
	M <= '0';
        wait for 10 ns;
        assert F = (A+(A AND (NOT B))) report "sel=0100 '(A+(A AND (NOT B)))' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = (A NAND B) report "sel=0100 '((A NAND B))' failed!" severity error;
        



        Sel <= "0101";
	M <= '0';
        wait for 10 ns;
        assert F = ((A OR B)+ (A AND(NOT B))) report "sel=0101 '((A OR B)+ (A AND(NOT B)))' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = (NOT B) report "sel=0101 '(NOT B)' failed!" severity error;




        Sel <= "0110";
	M <= '0';
        wait for 10 ns;
        assert F = (A-B-1) report "sel=0110 '(A-B-1)' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = (A XOR B) report "sel=0110 '(A XOR B)' failed!" severity error;




        Sel <= "0111";
	M <= '0';
        wait for 10 ns;
        assert F = ((A AND (NOT B))-1) report "sel=0111 '((A AND (NOT B))-1)' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = (A AND (NOT B)) report "sel=0111 '(A AND (NOT B))' failed!" severity error;



        Sel <= "1000";
	M <= '0';
        wait for 10 ns;
        assert F = (A+(A AND B)) report "sel=1000 '(A+(A AND B))' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = ((NOT A) OR B) report "sel=1000 '((NOT A) OR B)' failed!" severity error;



        Sel <= "1001";
	M <= '0';
        wait for 10 ns;
        assert F = (A+B) report "sel=1001 '(A+B)' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = (A XNOR B) report "sel=1001 '(A XNOR B)' failed!" severity error;



        Sel <= "1010";
	M <= '0';
        wait for 10 ns;
        assert F = ((A OR (NOT B))+(A AND B)) report "sel=1010 '((A OR (NOT B))+(A AND B))' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = B report "sel=1010 '(B)' failed!" severity error;



	Sel <= "1011";
	M <= '0';
        wait for 10 ns;
        assert F = ((A AND B )-'1') report "sel=1011 '((A AND B )-'1')' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = (A AND B) report "sel=1011 '(A AND B)' failed!" severity error;



        Sel <= "1100";
	M <= '0';
        wait for 10 ns;
        assert F = (A + ('0' & A(7 downto 1))) report "sel=1100 '(A + ('0' & A(7 downto 1)))' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = "00000001" report "sel=1100 '(00000001)' failed!" severity error;
        


        Sel <= "1101";
	M <= '0';
        wait for 10 ns;
        assert F = ((A OR B)+A) report "sel=1101 '((A OR B)+A)' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = (A OR(NOT B)) report "sel=1101 '(A OR(NOT B))' failed!" severity error;



        Sel <= "1110";
	M <= '0';
        wait for 10 ns;
        assert F = ((A OR (NOT B))+A) report "sel=1110 '((A OR (NOT B))+A)' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = (A OR B) report "sel=1110 '(A OR B)' failed!" severity error;



        Sel <= "1111";
	M <= '0';
        wait for 10 ns;
        assert F = (A-1) report "sel=1111 '(A-1)' failed!" severity error;

	M <= '1';
        wait for 10 ns;
        assert F = A report "sel=1111 '(A)' failed!" severity error;



        wait;
    end process stim_proc;
end architecture behavioral;