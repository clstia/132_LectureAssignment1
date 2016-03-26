-- Eurolfan, Jan Ellis D.
-- 2010 - 29160
-- CMSC 132 T-3L
-- Lecture Assignment - VHDL
-- Testbench File

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity T3L_Eurolfan_tb_v2 is
	constant DELAY: time := 10 ns;
end entity;

architecture tb_arch of T3L_Eurolfan_tb_v2 is
	component T3L_Eurolfan_v2 is
		port (i0, i1, i2, i3, i4, i5 : in std_logic; result : out std_logic);
	end component;

	signal result: std_logic;
	signal i0, i1, i2, i3, i4, i5: std_logic;
	
	begin -- architecture
		uut: component T3L_Eurolfan_v2 port map (i0, i1, i2, i3, i4, i5, result);
		
		process
			variable error_count: integer := 0;
			variable expected_result: std_logic;
			variable temp: unsigned(5 downto 0);

			begin -- process
				report "start";

				for i in 0 to 64 loop
					temp := TO_UNSIGNED(i, 6);
					i0 <= temp(5);
					i1 <= temp(4);
					i2 <= temp(3);
					i3 <= temp(2);
					i4 <= temp(1);
					i5 <= temp(0);

					if (i <= 8) then
						expected_result := '0';
					elsif (i mod 8=0) then
						expected_result := '0';
					else
						expected_result := '1';
					end if;

					wait for DELAY;

					assert (expected_result = result) -- combination i0-i1-i2-i3-i4-i5 result R expected_result ER time T
						report "combination " & std_logic'image(i0) & std_logic'image(i1) & std_logic'image(i2) & std_logic'image(i3) & std_logic'image(i4) & std_logic'image(i5) & " result " & std_logic'image(result) & " expected result " & std_logic'image(expected_result) & " at time " & time'image(now);

					if (expected_result /= result) then 
						error_count := error_count + 1;
					end if;
				end loop;

				wait for DELAY;

				assert (error_count = 0)
					report "ERROR: There were " & integer'image(error_count) & " errors!";
					if(error_count = 0)
						then report "Simulation completed with NO errors.";
					end if;
				wait;
		end process;
end architecture;