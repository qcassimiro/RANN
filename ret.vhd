--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.cfg.ALL;
--------------------------------------------------
ENTITY ret IS
    PORT
    (
        SIGNAL r1 : IN RATIO;
        SIGNAL ro : OUT RATIO
    );
END ret;
--------------------------------------------------
ARCHITECTURE behavioral OF ret IS
BEGIN
    ro.n <= r1.n WHEN r1.n(M) = '0' ELSE (OTHERS => '0');
    ro.d <= r1.d WHEN r1.n(M) = '0' ELSE (0 => '1', OTHERS => '0');
END behavioral;
--------------------------------------------------