library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- Using numeric_std for unsigned operations

entity pc is
  port (
    clk : in std_logic;
    inst_add : out std_logic_vector(4 downto 0)
  );
end pc;

architecture Behav1 of pc is
  signal current_signal : std_logic_vector(4 downto 0) := "00000";

begin
  process(clk)
  begin
    if falling_edge(clk) then
      -- Increment current_signal on falling edge of clk
      current_signal <= std_logic_vector(unsigned(current_signal) + to_unsigned(1, 5));
    end if;
  end process;

  -- Output the current_signal value as inst_add
  inst_add <= (current_signal);

end Behav1;
