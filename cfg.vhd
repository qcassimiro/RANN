--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-------------------------------------------------- 
PACKAGE cfg IS

    CONSTANT M : NATURAL := 8;

    TYPE RATIO IS RECORD
        n : SIGNED(M DOWNTO 0);
        d : UNSIGNED(M - 1 DOWNTO 0);
    END RECORD RATIO;

    TYPE RAT1D IS ARRAY (NATURAL RANGE <>) OF RATIO;

    TYPE RAT2D IS ARRAY (NATURAL RANGE <>) OF RAT1D;

END PACKAGE cfg;
--------------------------------------------------