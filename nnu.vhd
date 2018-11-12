--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.cfg.ALL;
--------------------------------------------------
ENTITY nnu IS
    GENERIC
     (
        N : NATURAL := 4
     );
    PORT
    (
        SIGNAL ui : IN RAT1D(N - 1 DOWNTO 0);
        SIGNAL uw : IN RAT1D(N - 1 DOWNTO 0);
        SIGNAL ub : IN RATIO;
        SIGNAL uo : OUT RATIO
    );
END nnu;
--------------------------------------------------
ARCHITECTURE behavioral OF nnu IS
    SIGNAL ux, uy : RATIO;
BEGIN
    DOT : ENTITY WORK.dot
    GENERIC MAP
    (
        N => N
    )
    PORT MAP
    (
        d1 => ui,
        d2 => uw,
        do => ux
    );
    ADD: ENTITY WORK.add
    PORT MAP
    (
        a1 => ub,
        a2 => ux,
        ao => uy
    );
    RET: ENTITY WORK.ret
    PORT MAP
    (
        r1 => uy,
        ro => uo
    );
END behavioral;
--------------------------------------------------