--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.cfg.ALL;
--------------------------------------------------
ENTITY rann IS
    GENERIC
     (
        I  : NATURAL := 4;
        LI : NATURAL := 4;
        L1 : NATURAL := 4;
        LO : NATURAL := 2
     );
    PORT
    (
        SIGNAL ni : IN RAT1D(I - 1 DOWNTO 0);
        SIGNAL no : OUT RAT1D(LO - 1 DOWNTO 0)
    );
END rann;
--------------------------------------------------
ARCHITECTURE behavioral OF rann IS
    SIGNAL nwi : RAT2D(LI - 1 DOWNTO 0)(I - 1 DOWNTO 0);
    SIGNAL nbi : RAT1D(LI - 1 DOWNTO 0);
    SIGNAL noi : RAT1D(LI - 1 DOWNTO 0);
    SIGNAL nw1 : RAT2D(L1 - 1 DOWNTO 0)(LI - 1 DOWNTO 0);
    SIGNAL nb1 : RAT1D(L1 - 1 DOWNTO 0);
    SIGNAL no1 : RAT1D(L1 - 1 DOWNTO 0);
    SIGNAL nwo : RAT2D(LO - 1 DOWNTO 0)(L1 - 1 DOWNTO 0);
    SIGNAL nbo : RAT1D(LO - 1 DOWNTO 0);
BEGIN
    NNLI : ENTITY WORK.nnl
    GENERIC MAP
    (
        N => I,
        U => LI
    )
    PORT MAP
    (
        li => ni,
        lw => nwi,
        lb => nbi,
        lo => noi
    );
    NNL1 : ENTITY WORK.nnl
    GENERIC MAP
    (
        N => LI,
        U => L1
    )
    PORT MAP
    (
        li => noi,
        lw => nw1,
        lb => nb1,
        lo => no1
    );
    NNLO: ENTITY WORK.nnl
    GENERIC MAP
    (
        N => L1,
        U => LO
    )
    PORT MAP
    (
        li => no1,
        lw => nwo,
        lb => nbo,
        lo => no
    );


    nbi(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nbi(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nbi(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nbi(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));

    nwi(0)(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(0)(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(0)(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(0)(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));

    nwi(1)(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(1)(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(1)(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(1)(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));

    nwi(2)(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(2)(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(2)(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(2)(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));

    nwi(3)(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(3)(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(3)(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwi(3)(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));


    nb1(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nb1(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nb1(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nb1(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));

    nw1(0)(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(0)(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(0)(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(0)(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));

    nw1(1)(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(1)(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(1)(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(1)(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));

    nw1(2)(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(2)(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(2)(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(2)(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));

    nw1(3)(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(3)(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(3)(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nw1(3)(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));


    nbo(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nbo(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));

    nwo(0)(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwo(0)(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwo(0)(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwo(0)(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));

    nwo(1)(0) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwo(1)(1) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwo(1)(2) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));
    nwo(1)(3) <= (n => TO_SIGNED(1, M + 1), d => TO_UNSIGNED(1, M));


END behavioral;
--------------------------------------------------