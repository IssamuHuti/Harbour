// Lucas Issamu Morino Yamahuti

clear 

cNomeJogador := ''
cPonto       := ''

do while .t.
    cJogador     := Space(20)
    lErrou       := .f.
    nAcertos     := 0

    @ 01,01 to 03,31 double
    
    @ 02,02 say 'Player:'
    
    @ 02,10 get cJogador    picture '@!'    valid !Empty(cJogador)
    read 
    
    if LastKey() == 27
        nOpcao := Alert('Deseja Sair do jogo?', {'Sim', 'Nao'})
        if nOpcao == 1
            exit
        else 
            loop
        endif
    endif
    
    if Len(cNomeJogador) == 100
        cNomeJogador := SubStr(cNomeJogador, 21, 80)
        cNomeJogador += cJogador
    else
        cNomeJogador += cJogador
    endif

    clear 

    @ 01,01 say 'Pressione qualquer tecla para iniciar o jogo'  color 'gr/'
    Inkey(0)

    clear 
    @ 02,01 to 24,09 double 

    @ 23,02 say 'Q W E R' color 'gr/'

    cAcumulo := ''
    nLinha := 22
    do while nLinha > 2
        nAleatorio  := hb_RandomInt(1, 4)
        cDigito := Space(1)
        if nAleatorio == 1
            cDigito := 'Q'
        elseif nAleatorio == 2
            cDigito := 'W'
        elseif nAleatorio == 3
            cDigito := 'E'
        elseif nAleatorio == 4
            cDigito := 'R'
        endif 
        
        if cDigito == 'Q'
            @ nLinha,02 say 'Q'
        elseif cDigito == 'W'
            @ nLinha,04 say 'W'
        elseif cDigito == 'E'
            @ nLinha,06 say 'E'
        elseif cDigito == 'R'
            @ nLinha,08 say 'R'
        endif
        
        cAcumulo += cDigito
        
        nLinha--
    enddo
    
    do while lErrou == .f.
        nKey        := Inkey(1) 
        nAleatorio  := hb_RandomInt(1, 4)

        @ 19,15 say ' ___   ___   ___   ___ '
        @ 20,15 say '|   | |   | |   | |   |'
        @ 21,15 say '| Q | | W | | E | | R |'
        @ 22,15 say '|___| |___| |___| |___|'
        
        if nKey == 113 .and. SubStr(cAcumulo, 1, 1) == 'Q'
            nAcertos++
            @ 21,17 say 'Q' color 'r/'
            cAcumulo := SubStr(cAcumulo, 2, 18)
            if nAleatorio == 1
                cDigito := 'Q'
            elseif nAleatorio == 2
                cDigito := 'W'
            elseif nAleatorio == 3
                cDigito := 'E'
            elseif nAleatorio == 4
                cDigito := 'R'
            endif 
            cAcumulo += cDigito
        elseif nKey == 119 .and. SubStr(cAcumulo, 1, 1) == 'W'
            nAcertos++
            @ 21,23 say 'W' color 'r/'
            cAcumulo := SubStr(cAcumulo, 2, 18)
            if nAleatorio == 1
                cDigito := 'Q'
            elseif nAleatorio == 2
                cDigito := 'W'
            elseif nAleatorio == 3
                cDigito := 'E'
            elseif nAleatorio == 4
                cDigito := 'R'
            endif 
            cAcumulo += cDigito
        elseif nKey == 101 .and. SubStr(cAcumulo, 1, 1) == 'E'
            nAcertos++
            @ 21,29 say 'E' color 'r/'
            cAcumulo := SubStr(cAcumulo, 2, 18)
            if nAleatorio == 1
                cDigito := 'Q'
            elseif nAleatorio == 2
                cDigito := 'W'
            elseif nAleatorio == 3
                cDigito := 'E'
            elseif nAleatorio == 4
                cDigito := 'R'
            endif 
            cAcumulo += cDigito
        elseif nKey == 114 .and. SubStr(cAcumulo, 1, 1) == 'R'
            nAcertos++
            @ 21,35 say 'R' color 'r/'
            cAcumulo := SubStr(cAcumulo, 2, 18)
            if nAleatorio == 1
                cDigito := 'Q'
            elseif nAleatorio == 2
                cDigito := 'W'
            elseif nAleatorio == 3
                cDigito := 'E'
            elseif nAleatorio == 4
                cDigito := 'R'
            endif 
            cAcumulo += cDigito
        else
            lErrou := .t.
            Alert('Jogo finalizado!')
            Alert('Pontuacao: ' + AllTrim(Str(nAcertos)))
            if Len(cPonto) == 15
                cPonto := SubStr(cPonto, 4, 15)
                if Len(AllTrim(Str(nAcertos))) == 1
                    cPonto += AllTrim(Str(nAcertos)) + '  '
                elseif Len(AllTrim(Str(nAcertos))) == 2
                    cPonto += AllTrim(Str(nAcertos)) + ' '
                endif
            else 
                if Len(AllTrim(Str(nAcertos))) == 1
                    cPonto += AllTrim(Str(nAcertos)) + '  '
                elseif Len(AllTrim(Str(nAcertos))) == 2
                    cPonto += AllTrim(Str(nAcertos)) + ' '
                endif
            endif 
        endif
        
        @ 04,02 clear to 22,08

        nLinha2     := 22
        nCount      := 1
        do while nCount <= 20

            if SubStr(cAcumulo, nCount, 1) == 'Q'
                @ nLinha2,02 say SubStr(cAcumulo, nCount, 1)
            elseif SubStr(cAcumulo, nCount, 1) == 'W'
                @ nLinha2,04 say SubStr(cAcumulo, nCount, 1)
            elseif SubStr(cAcumulo, nCount, 1) == 'E'
                @ nLinha2,06 say SubStr(cAcumulo, nCount, 1)
            elseif SubStr(cAcumulo, nCount, 1) == 'R'
                @ nLinha2,08 say SubStr(cAcumulo, nCount, 1)
            endif 

            nLinha2--
            nCount++
        enddo
        
    enddo

    clear 

    @ 07,05 to 09,35
    @ 05,05 to 15,35 double

    @ 06,17 say 'History'
    @ 08,06 say 'Player'
    @ 08,28 say 'Points'

    nLinha3     := 10
    nCountNome  := 1
    nCountPonto := 1
    do while nLinha3 < 15
        @ nLinha3,06 say SubStr(cNomeJogador, nCountNome, 20) color 'n/w'
        @ nLinha3,31 say SubStr(cPonto, nCountPonto, 3)       color 'n/w'
        nCountNome  += 20
        nCountPonto += 3
        nLinha3++
    enddo

    cMelhor := ''
    nMelhor := 0

    nPlayers := 0
    do while nPlayers <= 5 
        if SubStr(cPonto, 1 + (nPlayers * 3), 3) > nMelhor
        nPlayers++
    enddo

enddo