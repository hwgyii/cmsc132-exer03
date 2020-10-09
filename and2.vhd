library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity and2 is
    port(
        i, j : in std_logic;
        k : out std_logic
    );
end entity and2;

architecture and_behaviour of and2 is
    begin
        process is
        begin
        wait on i, j;
        k <= (i and j);
        end process;
    end architecture and_behaviour;
    