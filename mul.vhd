--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.cfg.ALL;
--------------------------------------------------
ENTITY mul IS
    PORT 
    (
        SIGNAL m1, m2 : IN RATIO;
        SIGNAL mo     : OUT RATIO
    );
END mul;
--------------------------------------------------
ARCHITECTURE behavioral OF mul IS
BEGIN
    mo.n <= SHIFT_RIGHT(m1.n * m2.n, M + 1)(M DOWNTO 0);
    mo.d <= SHIFT_RIGHT(m1.d * m2.d, M + 1)(M - 1 DOWNTO 0);
END behavioral;
--------------------------------------------------