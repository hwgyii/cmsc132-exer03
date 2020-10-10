library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_tb_logical is
end entity;

architecture logical_operations of ALU_tb_logical is
    signal s0, s1, i0, i1, j0, j1, k0, k1, c_out : std_logic;
    begin
        process
            variable selector : unsigned(1 downto 0);
            variable test_in : unsigned(3 downto 0);
        begin
            
            selector := B"00";

            --LOOP TO TEST ALL POSSIBLE LOGICAL OPERATIONS--
            for selector_counter in 0 to 3 loop

                --INITIALIZATION OF SELECTORS--
                s0 <= selector(0);
                s1 <= selector(1);

                test_in := B"0000";
                
                --LOOP TO TEST ALL POSSIBLE INPUTS--
                for test_counter in 0 to 15 loop
                    wait for 1 ns;
                    --INITIALIZATION OF INPUTS--
                    i0 <= test_in(3);
                    i1 <= test_in(2);
                    j0 <= test_in(1);
                    j1 <= test_in(0);
                    --AND--
                    if s0 = '0' and s1 = '0' then
                        k0 <= i0 and j0;
                        k1 <= i1 and j1;
                        c_out <= '0';

                    --OR--
                    elsif s0 = '0' and s1 = '1' then
                        k0 <= i0 or j0;
                        k1 <= i1 or j1;
                        c_out <= '0';
                    
                    --XOR--
                    elsif s0 = '1' and s1 = '0' then
                        k0 <= i0 xor j0;
                        k1 <= i1 xor j1;
                        c_out <= '0';

                    --NOT--
                    elsif s0 = '1' and s1 = '1' then
                        k0 <= not i0;
                        k1 <= not i1;
                        c_out <= '0';
                    end if;
                    
                    test_in := test_in + 1;
                end loop;
                
                selector := selector + 1;
            end loop;

            wait;

        end process;

end architecture;