library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ADD is
    port(
        i0,i1,j0,j1 : in std_logic;
        k0,k1,c_out : out std_logic
    );
end entity ADD;

architecture add_b of ADD is
    begin
        k1 <= (i1 xor j1);
		k0 <= (i0 xor j0) xor (i1 and j1);
		c_out <= (i1 and j1) and (i0 and j0);
end architecture add_b;