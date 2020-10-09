library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--2x1 mux using only nand gate
entity ALU is
	port (s0,s1,s2,i0,i1,j0,j1,c_in,one: in std_logic;  k0,k1,c_out: out std_logic);
end ALU;

architecture structural of ALU is
	--declararions of signals used to interconnect gates
	-- component AND2
	-- port (in1, in2: in std_logic;
	-- 	out1: out std_logic);
	-- 	end component;
	-- component XOR2
	-- port (in1, in2: in std_logic;
	-- 	out1: out std_logic);
	-- 	end component;
	-- component OR2
	-- port (in1, in2: in std_logic;
	-- 	out1: out std_logic);
	-- 	end component;
	-- component NOT2
	-- port (in1: in std_logic;
	-- 	out1: out std_logic);
	-- 	end component;
	-- component ADD
	-- port (in1, in2,c_in : in std_logic;
	-- 	out1,c_out: out std_logic);
	-- 	end component;
	-- component SUBTRACTION1
	-- port (in1, in2,c_in,inc : in std_logic;
	-- 	out1,c_out: out std_logic);
	-- 	end component;
	-- component SUBTRACTION2
	-- port (in1, in2,c_in,inc : in std_logic;
	-- 	out1,c_out: out std_logic);
	-- 	end component;
	-- component INC
	-- port (in1, in2,c_in,one : in std_logic;
	-- 	out1,c_out: out std_logic);
	-- 	end component;
		
	-- signal C1: std_logic;
begin
	--component instantiations statements
	U0 : entity work.and2(and_behaviour) port map (i1, j1, k1);
	U1 : entity work.and2(and_behaviour) port map (i0,j0, k0);
	U2 : entity work.xor2(xor_behaviour) port map (i1, j1, k1);
	U3 : entity work.xor2(xor_behaviour) port map (i0,j0, k0);
	U4 : entity work.or2(or_behaviour) port map (i1, j1, k1);
	U5 : entity work.or2(or_behaviour) port map (i0,j0, k0);
	-- U6 : entity work.not2(not_behaviour) port map (i1, k1);
	-- U7 : entity work.not2(not_behaviour) port map (i0, k0);
	-- U8 : entity ADD port map (i1, j1,c_in,k1,C1);
	-- U9 : entity ADD port map (i0,j0,C1,k0,c_out);
	-- U10 : entity SUBTRACTION1 port map (i1, j1, c_in,k1,C1);
	-- U11: entity SUBTRACTION1 port map (i0,j0, C1,k0,c_out);
	-- U12 : entity SUBTRACTION2 port map (i1, j1,c_in,one,k1,C1);
	-- U13 : entity SUBTRACTION2 port map (i0,j0,C1,one,k0,c_out);
	-- U14 : entity INC port map (i1, j1,one,k1,C1);
	-- U15 : entity INC port map (i0,j0,one,k0,c_out);
	

end structural;
