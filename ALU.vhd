library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--2x1 mux using only nand gate
entity ALU is
	port (s0,s1,s2,i0,i1,j0,j1: in std_logic;  k0,k1,c_out: out std_logic);
end ALU;

architecture structural of ALU is

begin
	U0 : entity work.and2(and_behaviour) port map (i1, j1, k1);
	U1 : entity work.and2(and_behaviour) port map (i0,j0, k0);
	U2 : entity work.xor2(xor_behaviour) port map (i1, j1, k1);
	U3 : entity work.xor2(xor_behaviour) port map (i0,j0, k0);
	U4 : entity work.or2(or_behaviour) port map (i1, j1, k1);
	U5 : entity work.or2(or_behaviour) port map (i0,j0, k0);
	U6 : entity work.not2(not_behaviour) port map (i1, k1);
	U7 : entity work.not2(not_behaviour) port map (i0, k0);
	U8 : entity work.ADD(structural) port map (i0,i1,j0,j1,k0,k1,c_out);
	U10 : entity work.SUBTRACTION1(structural) port map (i0,i1,j0,j1,k0,k1,c_out);
	U12 : entity work.SUBTRACTION2(structural) port map (i0,i1,j0,j1,k0,k1,c_out);
	U14 : entity work.INC(inc_b) port map (i0,i1,k0,k1,c_out);
	
end structural;
