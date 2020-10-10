library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SUBTRACTION1 is
    port(
        i0,i1,j0,j1 : in std_logic;
        k0,k1,c_out : out std_logic
    );
end entity SUBTRACTION1;

architecture sub1_b of SUBTRACTION1 is
    begin
		c_out <= (i1 and (not j1)) and (i0 and (not j0));
        k1 <= (i1 xor (not j1)) xor c_out;
		k0 <= (i0 xor (not j0)) xor (i1 and (not j1)) xor (i1 xor (not j1)) xor c_out;
		c_out <= 0;
end architecture sub1_b;