ibrary IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity INC is
    port(
        i0,i1 : in std_logic;
        k0,k1,c_out : out std_logic
    );
end entity INC;

architecture inc_b of INC is
    begin
        k1 <= (i1 xor 1);
		k0 <= i0 xor (i1 and 1);
		c_out <= (i1 xor 1) and i0;
end architecture inc_b;