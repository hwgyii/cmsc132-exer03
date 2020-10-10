library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity INC is
    port(
        i0,i1 : in std_logic;
        k0,k1,c_out : out std_logic
    );
end entity INC;

architecture structural of INC is
	signal c_in : std_logic;
    begin
        first : entity work.xor2(xor_behaviour) port map(i1, '1', k1);
		second : entity work.and2(and_behaviour) port map (i1,'1',c_in);
        third : entity work.xor2(xor_behaviour) port map(i0, c_in, k0);
        fourth : entity work.and2(and_behaviour) port map(i0,c_in,c_out);
end architecture structural;