library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity INC is
    port(
        i0,i1 : in std_logic;
        k0,k1,c_out : inout std_logic
    );
end entity INC;

architecture inc_b of INC is
    begin
        first : entity work.XOR2(xor_behavior) port map(i1, '1', k1);
        second : entity work.XOR2(xor_behavior) port map(i0, k1, k0);
        third : entity work.XOR2(xor_behavior) port map(k1, i0, c_out);
end architecture inc_b;