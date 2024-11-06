clear

cPalavra          := Space(20)
cPalavraInvertida := ''
//nTamanho          := 0

@ 01,01 say 'Digite uma palavra:'
@ 01,21 get cPalavra    picture '@!'    valid !Empty(cPalavra)
read

nTamanho := Len(AllTrim(cPalavra))

do while nTamanho > 0
    cPalavraInvertida += SubStr(cPalavra, nTamanho--, 1)
enddo 

@ 03,01 say cPalavraInvertida


if nTamanhoStr >= 8
    nValidacao := 0
    do while nValidacao <= nTamanhoStr
        nValidacao := 1
        do while Len(cEspeciais) > 0
            if (SubStr(cEspeciais, Len(cEspeciais), 1) $ cSenha)
                lEspeciais := .t.
            endif
            if lEspeciais == .t.
                exit
            endif
        enddo
        do while Len(cMaiusculo) > 0
            if (SubStr(cMaiusculo, Len(cMaiusculo), 1) $ cSenha)
                lMaiusculo := .t.
            endif
            if lMaiusculo == .t.
                exit
            endif
        enddo
        do while Len(cMinusculo) > 0
            if (SubStr(cMinusculo, Len(cMinusculo), 1) $ cSenha)
                lMinusculo := .t.
            endif
            if lMinusculo == .t.
                exit
            endif
        enddo
        if lMaiusculo .and. lMinusculo .and. lEspeciais     
            cVerificacao += SubStr(cSenha, nValidacao, 1)
        endif
        nValidacao++

    enddo
    