--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.cfg.ALL;
--------------------------------------------------
ENTITY dot IS
    GENERIC
     (
        N : NATURAL := 4
     );
    PORT
    (
        SIGNAL d1 : IN RAT1D(N - 1 DOWNTO 0);
        SIGNAL d2 : IN RAT1D(N - 1 DOWNTO 0);
        SIGNAL do : OUT RATIO
    );
END dot;
--------------------------------------------------
ARCHITECTURE behavioral OF dot IS
    SIGNAL dx : RAT1D(N - 1 DOWNTO 0);
BEGIN
    PRO : ENTITY WORK.pro
    GENERIC MAP
    (
        N => N
    )
    PORT MAP
    (
        p1 => d1,
        p2 => d2,
        po => dx
    );
    SUM : ENTITY WORK.sum
    GENERIC MAP
    (
        N => N
    )
    PORT MAP
    (
        s1 => dx,
        so => do
    );
END behavioral;
--------------------------------------------------