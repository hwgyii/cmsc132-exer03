library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity not2 is
    port(
        i : in std_logic;
        k : out std_logic
    );
end entity not2;

architecture not_behaviour of not2 is
    begin
        process is
        begin
        wait on i;
        k <= (not i);
        end process;
    end architecture not_behaviour;
    