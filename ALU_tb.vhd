library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_tb is
end entity;

architecture arithmetic_logic of ALU_tb is
    signal s0, s1, s2, i0, i1, j0, j1, k0, k1, c_out : std_logic;

    component ALU is
        port (
            s0, s1, s2 : in std_logic;
            i0, i1, j0, j1 : in std_logic;
            k0, k1, c_out : out std_logic
        );
    end component;
    begin
        uut: component ALU  port map (s0, s1, s2, i0, i1, j0, j1, k0, k1, c_out);
        process
            variable error_count : integer := 0;
            variable test_in : unsigned (3 downto 0);
            variable selector_in : unsigned (2 downto 0);
            variable k0_output : std_logic;
            variable k1_output : std_logic;
            variable c_out_output : std_logic;
        begin
            selector_in := B"000";
            for select_loop in 0 to 7 loop

                -- SELECTORS
                s0 <= selector_in(2);
                s1 <= selector_in(1);
                s2 <= selector_in(0);

                test_in := B"0000";

                for count in 0 to 15 loop

                    -- GETTING THE TEST BENCH
                    i0 <= test_in(3);
                    i1 <= test_in(2);
                    j0 <= test_in(1);
                    j1 <= test_in(0);
                    
                    -- LOGICAL
                    if s0 = "0" then
                        
                        -- AND
                        if s1 = "0" and s2 = "0" then
                            k0_output := i0 and j0;
                            k1_output := i1 and j1;
                            c_out_output := 0;
                        
                        -- OR
                        elsif s1 = "0" and s2 = "1" then
                            k0_output := i0 or j0;
                            k1_output := i1 or j1;
                            c_out_output := 0;

                        -- XOR
                        elsif s1 = "1" and s2 = "0" then
                            k0_output := i0 xor j0;
                            k1_output := i1 xor j1;
                            c_out_output := 0;
                        
                        -- NOT
                        elsif s1 = "1" and s2 = "1" then
                            k0_output := not i0;
                            k1_output := not i1;
                            c_out_output := 0;
                        end if;
                    -- ARITHMETIC
                    -- if s0 = "1" then
                        
                    --     -- ADD 
                    --     if s1 = "0" and s2 = "0" then
                    --         k1_output := i1 + j1;
                    --         if k1_output = 2 then
                    --             k1_output := 0;
                    --             k0_output := i0 + j0 + 1;
                    --             if k0_output > 1 then
                    --                 k0_output := k0 - 2;
                    --                 c_out_output := 1;
                    --             end if;
                    --         end if;

                    --     -- SUB(1)
                    --     -- elsif s1 == "0" and s2 == "1" then
                                                        
                            
                    --     -- SUB(2)
                    --     -- elsif s1 == "1" and s2 == "0" then
                        

                    --     -- INCREMENT
                    --     elsif s1 = "1" and s2 = "1" then
                    --         k1_output := i1 + 1;
                    --         if k1_output = 2 then
                    --             k1_ouput := 0;
                    --             k0_output := i0 + 1;
                    --             if k0_output = 2 then
                    --                 k0_output := 0;
                    --                 c_out_output := 1;
                    --             else 
                    --                 c_out_output := 0;
                    --             end if;
                    --         else
                    --             k0_output := i0; 
                    --             c_out_output := 0;
                    --         end if;
                    --     end if;
                    --     test_in := test_in + 1;
                    -- end if;
                end if;
                end loop;
                
                selector_in := selector_in + 1;
                end loop;

            wait;
        end process;
end architecture arithmetic_logic;