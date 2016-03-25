-- Boolean Function courtesy of 32x8.com/var6.html (an online minimizer using K Map or Quine McCluskey)
-- CF + CE + CD + BF + BE + BD + AF + AE + AD
-- Eurolfan, Jan Ellis D.
-- 2010 - 29160
-- CMSC 132 T-3L
-- Lecture Assignment - VHDL
-- Entity File

library IEEE;
use IEEE.std_logic_1164.all;

entity T3L_Eurolfan is
	port (i0, i1, i2, i3, i4, i5 : in std_logic; result : out std_logic);
end entity;

architecture T3L_Eurolfan of T3L_Eurolfan is
begin
	process (i0, i1, i2, i3, i4, i5) is
		begin
			if ( ((i0='1') or (i1='1') or (i2='1')) and ((i3='1') or (i4='1') or (i5='1')) ) then result<='1';
			else result<='0';
			end if;
	end process;
end architecture;