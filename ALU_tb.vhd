library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_tb is
end entity;

architecture test_bench of ALU_tb is
    signal s0, s1, s2, i0, i1, j0, j1, k0, k1, c_out : std_logic;
    signal c_in : std_logic;
    signal c_in2 : std_logic; 
    begin
        process
            variable selector : unsigned(2 downto 0);
            variable test_in : unsigned(3 downto 0);
        begin
            
            selector := B"000";

            --LOOP TO TEST ALL POSSIBLE LOGICAL OPERATIONS--
            for selector_counter in 0 to 7 loop
                --INITIALIZATION OF SELECTORS--
                s0 <= selector(0);
                s1 <= selector(1);
                s2 <= selector(2);

                test_in := B"0000";
                
                --LOOP TO TEST ALL POSSIBLE INPUTS--
                for test_counter in 0 to 15 loop
                    --INITIALIZATION OF INPUTS--
                    i0 <= test_in(3);
                    i1 <= test_in(2);
                    j0 <= test_in(1);
                    j1 <= test_in(0);
                    wait for 1 ns;
                    --AND--
                    if s0 = '0' and s1 = '0' and s2 = '0' then
                        k0 <= i0 and j0;
                        k1 <= i1 and j1;
                        c_out <= '0';

                    --OR--
                    elsif s0 = '0' and s1 = '0' and s2 = '1' then
                        k0 <= i0 or j0;
                        k1 <= i1 or j1;
                        c_out <= '0';
                    
                    --XOR--
                    elsif s0 = '0' and s1 = '1' and s2 = '0' then
                        k0 <= i0 xor j0;
                        k1 <= i1 xor j1;
                        c_out <= '0';

                    --NOT--
                    elsif s0 = '0' and s1 = '1' and s2 = '1' then
                        k0 <= not i0;
                        k1 <= not i1;
                        c_out <= '0';
                    
                    --ADDITION--
                    elsif s0 = '1' and s1 = '0' and s2 = '0' then
                        k1 <= i1 xor j1;
                        c_in <= i1 and j1;
                        k0 <= (i0 xor j0) xor c_in;
                        c_out <= (i0 xor j0) and c_in;
                    
                    --SUB(1)--
                    elsif s0 = '1' and s1 = '0' and s2 = '1' then
                        c_in <= i1 and (not j1);
                        c_in2 <= (i0 and (not j0)) and c_in;
                        k1 <= (i1 xor (not j1)) xor c_in2;
                        k0 <= ((i0 xor  (not j0)) xor c_in) xor c_in2;
                        c_out <= '0';

                    --SUB(2)--
                    elsif s0 = '1' and s1 = '1' and s2 = '0' then
                        k1 <= (i1 xor (not j1)) xor '1';
                        c_in <= (i1 and (not j1)) and '1';
                        k0 <= (i0 xor j0) xor c_in;
                        c_out <= '0';

                    --INCREMENT--
                    elsif s0 = '1' and s1 = '1' and s2 = '1' then
                        k1 <=  i1 xor '1';
                        c_in <= i1 and '1';
                        k0 <= i0 xor c_in;
                        c_out <= c_in and i0;
                    end if;
                    
                    test_in := test_in + 1;
                end loop;
                
                selector := selector + 1;
            end loop;

            wait;

        end process;

end architecture;