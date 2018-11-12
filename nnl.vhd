--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.cfg.ALL;
--------------------------------------------------
ENTITY nnl IS
    GENERIC
     (
        N : NATURAL := 4;
        U : NATURAL := 2
     );
    PORT
    (
        SIGNAL li : IN RAT1D(N - 1 DOWNTO 0);
        SIGNAL lw : IN RAT2D(U - 1 DOWNTO 0)(N - 1 DOWNTO 0);
        SIGNAL lb : IN RAT1D(U - 1 DOWNTO 0);
        SIGNAL lo : OUT RAT1D(U - 1 DOWNTO 0)
    );
END nnl;
--------------------------------------------------
ARCHITECTURE behavioral OF nnl IS
BEGIN
    F : FOR i IN 0 TO U - 1 GENERATE
    BEGIN
        NNUI : ENTITY WORK.nnu
        GENERIC MAP
        (
            N => N
        )
        PORT MAP
        (
            ui => li,
            uw => lw(i),
            ub => lb(i),
            uo => lo(i)
        );
    END GENERATE F;
END behavioral;
--------------------------------------------------