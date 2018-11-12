--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.cfg.ALL;
--------------------------------------------------
ENTITY add IS
    PORT
    (
        SIGNAL a1, a2 : IN RATIO;
        SIGNAL ao     : OUT RATIO
    );
END add;
--------------------------------------------------
ARCHITECTURE behavioral OF add IS
BEGIN
    ao.n <= SHIFT_RIGHT(a1.n * SIGNED('0' & STD_LOGIC_VECTOR(a2.d)) + a2.n * SIGNED('0' & STD_LOGIC_VECTOR(a1.d)), M + 1)(M DOWNTO 0);
    ao.d <= SHIFT_RIGHT(a1.d * a2.d, M + 1)(M - 1 DOWNTO 0);
END behavioral;
--------------------------------------------------