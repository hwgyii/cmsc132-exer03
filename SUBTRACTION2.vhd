library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SUBTRACTION2 is
    port(
        i0,i1,j0,j1 : in std_logic;
        k0,k1,c_out : out std_logic
    );
end entity SUBTRACTION2;

architecture structural of SUBTRACTION2 is
signal notj1,notj0,c_in,c_in2,c_in3,ans1,ans2 : std_logic;
    begin
		U0 : entity work.not2(not_behaviour) port map(j1, notj1);
		U1 : entity work.not2(not_behaviour) port map(j0, notj0);
		U2  : entity work.and2(and_behaviour) port map(i1,notj1,c_in);
		U3  : entity work.xor2(xor_behaviour) port map(i1,notj1,ans1);
		U4  : entity work.xor2(xor_behaviour) port map(ans1,'1',k1);
		U5  : entity work.and2(and_behaviour) port map(ans1,'1',c_in2);
		U6  : entity work.xor2(xor_behaviour) port map(i0,notj0,ans2);
		U7  : entity work.xor2(xor_behaviour) port map(c_in2,c_in,c_in3);
		U8  : entity work.xor2(xor_behaviour) port map(c_in3,ans2,k0);
		U9 : entity work.not2(not_behaviour) port map('1',c_out);
		

end architecture structural;