clear

do while .t.

    cNome1      := Space(10)
    cNome2      := Space(10)
    cNome3      := Space(10)
    cNome4      := Space(10)
    cNome5      := Space(10)
    cNome6      := Space(10)
    nPeso1      := 0
    nPeso2      := 0
    nPeso3      := 0
    nPeso4      := 0
    nPeso5      := 0
    nPeso6      := 0
    nMenorPeso  := 0

    @ 01,01 say 'NOME'
    @ 01,12 say 'PESO'
    
    @ 02,01 get cNome1  picture '@!'            valid !Empty(cNome1)
    @ 03,01 get cNome2  picture '@!'            valid !Empty(cNome2)
    @ 04,01 get cNome3  picture '@!'            valid !Empty(cNome3)
    @ 05,01 get cNome4  picture '@!'            valid !Empty(cNome4)
    @ 06,01 get cNome5  picture '@!'            valid !Empty(cNome5)
    @ 07,01 get cNome6  picture '@!'            valid !Empty(cNome6)
    @ 02,12 get nPeso1  picture '@e 999.99'     valid nPeso1 > 0
    @ 03,12 get nPeso2  picture '@e 999.99'     valid nPeso2 > 0
    @ 04,12 get nPeso3  picture '@e 999.99'     valid nPeso3 > 0
    @ 05,12 get nPeso4  picture '@e 999.99'     valid nPeso4 > 0
    @ 06,12 get nPeso5  picture '@e 999.99'     valid nPeso5 > 0
    @ 07,12 get nPeso6  picture '@e 999.99'     valid nPeso6 > 0
    read

    nMaiorPeso := nPeso1

    if nPeso2 > nMaiorPeso
        nMaiorPeso := nPeso2
    endif
    if nPeso3 > nMaiorPeso
        nMaiorPeso := nPeso3
    endif
    if nPeso4 > nMaiorPeso
        nMaiorPeso := nPeso4
    endif
    if nPeso5 > nMaiorPeso
        nMaiorPeso := nPeso5
    endif
    if nPeso6 > nMaiorPeso
        nMaiorPeso := nPeso6
    endif
    
enddo
