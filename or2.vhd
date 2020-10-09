library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity or2 is
    port(
        i, j : in std_logic;
        k : out std_logic
    );
end entity or2;

architecture or_behaviour of or2 is
    begin
        process is
        begin
        wait on i, j;
        k <= (i or j);
        end process;
    end architecture or_behaviour;
    