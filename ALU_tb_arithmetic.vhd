library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_tb_arithmetic is
end entity;

architecture arithmetic_operations of ALU_tb_arithmetic is
    
    begin
        process
            variable selector : unsigned(1 downto 0);
            variable test_in : unsigned(3 downto 0);
            variable s0, s1, s2, i0, i1, j0, j1, k0, k1, c_out : std_logic;
			variable c_in : std_logic;
			variable c_in2 : std_logic; 
        begin
            
            selector := B"00";

            --LOOP TO TEST ALL POSSIBLE ARITHMETIC OPERATIONS--
            for selector_counter in 0 to 3 loop

                --INITIALIZATION OF SELECTORS--
                s0 := selector(0);
                s1 := selector(1);

                test_in := B"0000";
                
                --LOOP TO TEST ALL POSSIBLE INPUTS--
                for test_counter in 0 to 15 loop

                    --INITIALIZATION OF INPUTS--
                    i0 := test_in(3);
                    i1 := test_in(2);
                    j0 := test_in(1);
                    j1 := test_in(0);
                    c_in := '0';
                    c_in2 := '0';

                    --ADDITION--
                    if s0 = '0' and s1 = '0' then
                        k1 := i1 xor j1;
                        c_in := i1 and j1;
                        k0 := (i0 xor j0) xor c_in;
                        c_out := (i0 xor j0) and c_in;
                    
                    --SUB(1)--
                    elsif s0 = '0' and s1 = '1' then
                        c_in := i1 and (not j1);
                        c_in2 := (i0 and (not j0)) and c_in;
                        k1 := (i1 xor (not j1)) xor c_in2;
                        k0 := ((i0 xor  (not j0)) xor c_in) xor c_in2;
                        c_out := '0';

                    --SUB(2)--
                    elsif s0 = '1' and s1 = '0' then
                        k1 := (i1 xor (not j1)) xor '1';
                        c_in := (i1 and (not j1)) and '1';
                        k0 := (i0 xor j0) xor c_in;
                        c_out := '0';

                    --INCREMENT--
                    elsif s0 = '1' and s1 = '1' then
                        k1 :=  i1 xor '1';
                        c_in := i1 and '1';
                        k0 := i0 xor c_in;
                        c_out := c_in and i0;
                    end if;

                    test_in := test_in + 1;
                end loop;
                selector := selector + 1;
            end loop;

            wait;

        end process;

end architecture;