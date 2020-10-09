library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity xor2 is
    port(
        i, j : in std_logic;
        k : out std_logic
    );
end entity xor2;

architecture xor_behaviour of xor2 is
    begin
        process is
        begin
        wait on i, j;
        k <= (i xor j);
        end process;
    end architecture xor_behaviour;
    