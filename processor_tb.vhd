library ieee;
use ieee.std_logic_1164.all;

entity process_tb is
end process_tb;

architecture process_tb_behav of process_tb is

  -- Declaration of the processor component
  component processor
    port(
      clk : in std_logic
    );
  end component;

  -- Signal declarations
  signal clk : std_logic := '0'; -- Clock signal initialization

  constant clk_period : time := 10 ns; -- Constant for clock period

begin

  -- Instantiation of the processor component
  uut : processor port map(
    clk => clk
  );

  -- Testbench stimulus process
  stim_proc : process
  begin
    clk <= not clk; -- Invert the clock signal
    wait for clk_period / 2; -- Wait for half of the clock period

    -- Stop the simulation at a specific time (310 ns in this case)
    if now > 310 ns then
      wait; -- Pause the simulation
    end if;

  end process stim_proc;

end process_tb_behav;
