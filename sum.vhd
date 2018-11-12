--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.cfg.ALL;
--------------------------------------------------
ENTITY sum IS
    GENERIC
     (
        N : NATURAL := 4
     );
    PORT
    (
        SIGNAL s1 : IN RAT1D(N - 1 DOWNTO 0);
        SIGNAL so : OUT RATIO
    );
END sum;
--------------------------------------------------
ARCHITECTURE behavioral OF sum IS
    SIGNAL sx : RAT1D(N - 2 DOWNTO 0);
BEGIN
    ADD1: ENTITY WORK.add
    PORT MAP
    (
        a1 => s1(0),
        a2 => s1(1),
        ao => sx(0)
    );
    F : FOR i IN 2 TO N - 1 GENERATE
    BEGIN
        ADDI : ENTITY WORK.add
        PORT MAP
        (
            a1 => sx(i - 2),
            a2 => s1(i),
            ao => sx(i - 1)
        );
    END GENERATE F;
    so <= sx(N - 2);
END behavioral;
--------------------------------------------------