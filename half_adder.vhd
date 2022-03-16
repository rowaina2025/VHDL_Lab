--testbench
-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component half_adder is
port(
  a: in std_logic;
  b: in std_logic;
  c: out std_logic;
  s: out std_logic);
end component;

signal a_in, b_in, c_out, s_out: std_logic;

begin

  -- Connect DUT
  DUT: half_adder port map(a_in, b_in, c_out, s_out);

  process
  begin
    a_in <= '0';
    b_in <= '0';
    wait for 1 ns;
    assert(c_out='0') report "Fail 0/0" severity error;
    assert(s_out='0') report "Fail 0/0" severity error;
    
    a_in <= '0';
    b_in <= '1';
    wait for 1 ns;
    assert(c_out='0') report "Fail 0/1" severity error;
    assert(s_out='1') report "Fail 0/1" severity error;
    
    a_in <= '1';
    b_in <= '0';
    wait for 1 ns;
    assert(c_out='0') report "Fail 1/0" severity error;
    assert(s_out='1') report "Fail 1/0" severity error;
    
    a_in <= '1';
    b_in <= '1';
    wait for 1 ns;
    assert(c_out='1') report "Fail 1/1" severity error;
    assert(s_out='0') report "Fail 1/1" severity error;
    
    -- Clear inputs
    a_in <= '0';
    b_in <= '0';

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;

--design
library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
port(
  a: in std_logic;
  b: in std_logic;
  c: out std_logic;
  s: out std_logic);
end half_adder;

architecture add of half_adder is
begin
  process(a, b) is
  begin
    c <= a and b;
    s <= a xor b;
  end process;
end add;
