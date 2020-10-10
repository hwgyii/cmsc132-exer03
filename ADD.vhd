library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ADD is
    port(
        i0,i1,j0,j1 : in std_logic;
        k0,k1,c_out : out std_logic
    );
end entity ADD;
	
architecture structural of ADD is
	signal ans1,c_in,c_in2: std_logic;
    begin
		U0  : entity work.xor2(xor_behaviour) port map(i1,j1,k1);
		U1  : entity work.and2(and_behaviour) port map(i1,j1,c_in);
		U2  : entity work.xor2(xor_behaviour) port map(i0,j0,ans1);
		U3  : entity work.xor2(xor_behaviour) port map(ans1,c_in,k0);
		U4  : entity work.and2(and_behaviour) port map(i0,j0,c_in2);
		U5  : entity work.and2(and_behaviour) port map(c_in,c_in2,c_out);
end architecture structural;