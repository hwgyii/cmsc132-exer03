library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SUBTRACTION2 is
    port(
        i0,i1,j0,j1 : in std_logic;
        k0,k1,c_out : out std_logic
    );
end entity SUBTRACTION2;

architecture sub2_b of SUBTRACTION2 is
    begin
        k1 <= (i1 xor (not j1)) xor 1;
		k0 <= ((i0 xor (not j0)) xor (i1 and (not j1))) xor ((i1 xor (not j1)) xor 1);
		c_out <= 0;
end architecture sub2_b;