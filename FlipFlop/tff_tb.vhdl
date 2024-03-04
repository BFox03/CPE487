--  https://electronicstopper.blogspot.com/2017/07/t-flip-flop-in-vhdl-with-testbench.html
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TFF_tb IS
END TFF_tb;

ARCHITECTURE behavior OF TFF_tb IS 

    COMPONENT TFF
    PORT(
         T : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         set : IN std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    
    component ha
    port(
        a:  in  std_ulogic; -- Input of the unresolved type
        b:  in  std_ulogic; -- https://vhdlwhiz.com/std_logic-vs-std_ulogic/
        s:  out std_ulogic; -- Output sum of a and b
        c:  out std_ulogic  -- Output carry
        );
    end component;
    
   signal T : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal set: std_logic := '0';
   signal Q : std_logic;

   constant clk_period : time := 10 ns;
   
   signal a : std_ulogic := '0';
   signal b : std_ulogic := '0';
   signal s : std_ulogic;

BEGIN

   uut: TFF PORT MAP (
          T => T,
          clk => clk,
          rst => rst,
          Q => Q,
          set => set
        );
    
   halfadder: ha port map (
          a => a,
          b => b,
          s => s,
          c => T
        );

  clk_process :process
  begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
  if NOW > 350 ns then
  wait;
  end if;
  end process;

  stim_proc: process
  begin  
 
  rst <= '0';
  set <= '1';
  wait for 50 ns;
 
  rst <= '1';
  set <= '0';
  wait for 50 ns; 

  rst <= '0';
  set <= '0';
  a <= '0';
  b <= '0';
  wait for 50 ns;
  
  rst <= '0';
  set <= '0';
  a <= '1';
  b <= '0'; 
  wait for 50 ns;

  rst <= '0';
  set <= '0';
  a <= '0';
  b <= '1'; 
  wait for 50 ns;
  
  rst <= '0';
  set <= '0';
  a <= '1';
  b <= '1'; 
  wait for 50 ns;
  
  rst <= '1';
  wait;

  end process;

END;
