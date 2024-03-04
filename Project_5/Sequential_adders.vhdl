--  https://ghdl.readthedocs.io/en/stable/using/QuickStartGuide.html
--  A testbench has no ports.
entity adder_tb is
end adder_tb;

architecture behav of adder_tb is
  --  Declaration of the component that will be instantiated.
  component adder
    port (i0, i1 : in bit; ci : in bit; s : out bit; co : out bit);
  end component;

  --  Specifies which entity is bound with the component.
  for adder_1: adder use entity work.adder;
  for adder_2: adder use entity work.adder;
  for adder_3: adder use entity work.adder;
  for adder_4: adder use entity work.adder;
  
  signal A0, B0, A1, B1, A2, B2, A3, B3, cin, s0, s1, s2, s3, c0, c1, c2, c3 : bit;
begin
  --  Component instantiation.
  adder_1: adder port map (i0 => A0, i1 => B0, ci => cin,
                           s => s0, co => c0);
  adder_2: adder port map (i0 => A1, i1 => B1, ci => c0,
                           s => s1, co => c1); 
  adder_3: adder port map (i0 => A2, i1 => B2, ci => c1,
                           s => s2, co => c2); 
  adder_4: adder port map (i0 => A3, i1 => B3, ci => c2,
                           s => s3, co => c3); 
                          
  --  This process does the real job.
  process
    type pattern_type is record
      --  The inputs of the adder.
      i0, i1, ci : bit;
      --  The expected outputs of the adder.
      s, co : bit;
    end record;
    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (('0', '0', '0', '0', '0'),
       ('0', '0', '1', '1', '0'),
       ('0', '1', '0', '1', '0'),
       ('0', '1', '1', '0', '1'),
       ('1', '0', '0', '1', '0'),
       ('1', '0', '1', '0', '1'),
       ('1', '1', '0', '0', '1'),
       ('1', '1', '1', '1', '1'));
  begin
    --  Check each pattern.
     for i in patterns'range loop
      --  Set the inputs.
      A0 <= patterns(i).i0;
      B0 <= patterns(i).i1;
      cin <= patterns(i).ci;   
      A1 <= '1';
      B1 <= '0';
      A2 <= '1';
      B2 <= '0';
      A3 <= '1';
      B3 <= '0';
      -- Wait for the results
      wait for 1 ns;
         
      --  Check the outputs.
      --assert s = patterns(i).s;
      --   report "bad sum value" severity error;
      --assert co = patterns(i).co;
      --  report "bad carry out value" severity error;
    end loop;
    assert false report "end of test" severity note;
    --  Wait forever; this will finish the simulation.
    wait;
  end process;
end behav;
