--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.cfg.ALL;
--------------------------------------------------
ENTITY pro IS
    GENERIC
     (
        N : NATURAL := 4
     );
    PORT
    (
        SIGNAL p1 : IN RAT1D(N - 1 DOWNTO 0);
        SIGNAL p2 : IN RAT1D(N - 1 DOWNTO 0);
        SIGNAL po : OUT RAT1D(N - 1 DOWNTO 0)
    );
END pro;
--------------------------------------------------
ARCHITECTURE behavioral OF pro IS
BEGIN
    F : FOR i IN 0 TO N - 1 GENERATE
    BEGIN
        MULI : ENTITY WORK.mul
        PORT MAP
        (
            m1 => p1(i),
            m2 => p2(i),
            mo => po(i)
        );
    END GENERATE F;
END behavioral;
--------------------------------------------------