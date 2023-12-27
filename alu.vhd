library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
------------------------------------------------
entity Alu is
   Port (
      A : in STD_LOGIC_VECTOR(7 downto 0);
      B : in STD_LOGIC_VECTOR(7 downto 0);
      M : in std_logic;
      Sel: in STD_LOGIC_VECTOR(3 downto 0);
      f: out STD_LOGIC_VECTOR(7 downto 0)
   );
end ALU;
-------------------------------------------------
ARCHITECTURE behav OF Alu IS
    begin
    process (A, B, M, Sel)
    begin
    if (M = '1') then
        case Sel IS 
            WHEN "0000" =>
                f <= not A; 
            WHEN "0001" =>
                f <= A NOR B; 
            WHEN "0010" =>
                f <= (NOT A) AND B;
            WHEN "0011" =>
                f <= "00000000";
            WHEN "0100" =>
                f <= A NAND B; 
            WHEN "0101" =>
                f <= NOT B; 
            WHEN "0110" =>
                f <= A XOR B; 
            WHEN "0111" =>
                f <= A AND (NOT B); 
            WHEN "1000" =>
                f <= (NOT A) OR B;  
            WHEN "1001" =>
                f  <= A XNOR B; 
            WHEN "1010" =>
                f <= B;
            WHEN "1011" =>
                f <= A AND B;
            WHEN "1100" =>
                f <= "00000001"; 
            WHEN "1101" =>
                f <= A OR(NOT B);
            WHEN "1110" =>
                f <= A OR B;
            WHEN "1111" =>
                f <= A; 
            WHEN OTHERS =>
                f <= "00000000"; 
        end case;
    else
 	case Sel IS 
   	    WHEN "0000" =>
                f  <= A ; 
            WHEN "0001" =>
                f  <= A OR B;  
            WHEN "0010" =>
                f  <= A OR (NOT B);  
            WHEN "0011" =>
                f  <= "11111111"; 
            WHEN "0100" =>
                f  <= A+(A AND (NOT B)) ; 
            WHEN "0101" =>
                f  <= (A OR B)+ (A AND(NOT B)); 
            WHEN "0110" =>
                f  <= A-B-1 ; 
            WHEN "0111" => 
                f  <= (A AND (NOT B))-1 ; 
            WHEN "1000" =>
                f  <= A+(A AND B);  
            WHEN "1001" =>
                f  <= A+B ;  
            WHEN "1010" =>
                f  <= (A OR (NOT B))+(A AND B) ;  
            WHEN "1011" =>
                f  <= (A AND B )-'1' ; 
            WHEN "1100" =>
                f  <= A + ('0' & A(7 downto 1));  
            WHEN "1101" =>
                f  <= (A OR B)+A; 
            WHEN "1110" =>
                f  <= (A OR (NOT B))+A ;  
            WHEN "1111" =>
                f  <= A-1; 
            WHEN OTHERS =>
                f  <= "00000000" ; 
        end case;
    end if;
    end process;
end behav;