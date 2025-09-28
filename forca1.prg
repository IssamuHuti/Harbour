set scoreboard off
SetMode (25,80)
set message to 24 center 
set wrap on  

clear

do while  .t.
    cDica1            := Space(20)
    cDica2            := Space(20)
    cDica3            := Space(20)
    cPalavraEscondida := ''
    cPalavraOcultada  := ''
    nVidas            := 0
    lDica             := .f.
    cLetrasErradas    := ''
    cCorErrado        := 'r/'
    
    cNomeJogador      := Space(15)
    @ 00,00 to 02,50
    @ 01,01 say 'Jogador:'
    
    @ 01,09 get cNomeJogador    picture '@!'    valid !Empty(cNomeJogador)
    read 
    if LastKey() == 27
        nOpcaoAcabar := Alert('Deseja sair do jogo?', {'Sim', 'Nao'})
        if nOpcaoAcabar == 1
            exit 
        else 
            loop
        endif
    endif 
    
    @ 03,01 say 'Digite a palavra a descobrir:'
    
    nColunaDigitar := 31
    do while nColunaDigitar <= 45
        nLetrasDesafio := Space(1)
        @ 03,nColunaDigitar get nLetrasDesafio picture '@!'    valid !Empty(nLetrasDesafio)
        read 
        if LastKey() == 13 .or. LastKey() == 27
            exit 
        // elseif LastKey() == 8
        //     cPalavraEscondida -= SubStr(cPalavraEscondida, -1, 1)
        //     cPalavraOcultada  -= SubStr(cPalavraOcultada, -1, 1)
        //     nColunaDigitar--
        //     @ 03,nColunaDigitar say ' '
        endif 

        cPalavraEscondida += nLetrasDesafio
        cPalavraOcultada  += '*'
        @ 03,nColunaDigitar say '*'

        nColunaDigitar++
    enddo
    
    nOpcaoNivel := 0
    @ 05,01 prompt 'Facil'    message 'Facil'
    @ 06,01 prompt 'Medio'    message 'Medio'
    @ 07,01 prompt 'Dificil'  message 'Dificil'
    menu to nOpcaoNivel
    
    @ 08,00 to 22,50
    if nOpcaoNivel == 1
        nVidas      := 6
        lDica       := .t.
        
        @ 09,01 say 'Digite as dicas'   picture '@!'
        @ 10,01 say 'Dica1:'
        @ 11,01 say 'Dica2:'
        @ 12,01 say 'Dica3:'

        @ 10,07 get cDica1  picture '@!'    valid !Empty(cDica1)
        @ 11,07 get cDica2  picture '@!'    valid !Empty(cDica2)
        @ 12,07 get cDica3  picture '@!'    valid !Empty(cDica3)
        read 

        Inkey(0)
        @ 09,01 clear to 21,49
    elseif nOpcaoNivel == 2
        nVidas := 5
    elseif nOpcaoNivel == 3
        nVidas := 4
    endif
    
    @ 09,01 say 'Palavra oculta  :'
    @ 11,01 say 'Digite uma letra:'
    @ 13,01 say 'Letras erradas  :'
    @ 15,01 say 'Vidas restantes :'
    
    cLetraAcertada := ''
    do while nVidas > 0
        if cPalavraOcultada == cPalavraEscondida
            Alert('Parabens, achou a palavra oculta!')
            exit 
        endif
        if nVidas == 0
            Alert('Perdeu, a palavra oculta era ' + cPalavraEscondida)
            exit 
        endif 
        
        cLetraTentada := Space(1)
        
        @ 09,19 say cPalavraOcultada
        @ 15,19 say nVidas
        
        @ 11,19 get cLetraTentada  picture '@!'    valid !Empty(cLetraTentada)
        read 
        
        if cLetraTentada $ cLetrasErradas .or. cLetraTentada $ cLetraAcertada
            Alert('A Letra ja foi digitada anteriormente! Tente outra letra!')
            loop 
        endif 
        
        if cLetraTentada $ cPalavraEscondida
            cLetraAcertada += cLetraTentada
            
            nContLetras := 1
            do while nContLetras <= Len(cPalavraEscondida)
                if SubStr(cPalavraEscondida, nContLetras, 1) $ cLetraAcertada
                    cPalavraOcultada += SubStr(cPalavraEscondida, nContLetras, 1)
                else
                    cPalavraOcultada += '*'
                endif
                
                nContLetras++
            enddo
            
            cPalavraOcultada := SubStr(cPalavraOcultada, Len(cPalavraEscondida)+1, 8)
        else
            nVidas -= 1
            cLetrasErradas += cLetraTentada
    
            nColunaErradas := 19
            nContErradas   := 1
            do while nContErradas <= Len(cLetrasErradas)
                cCorLetra := ''
                if cLetraTentada == SubStr(cLetrasErradas, nContErradas, 1)
                    cCorLetra := cCorErrado
                endif 
    
                @ 13,nColunaErradas say SubStr(cLetrasErradas, nContErradas, 1) color cCorLetra
    
                nColunaErradas += 2
                nContErradas++
            enddo
            
            if lDica
                if nVidas == 5
                    @ 17,01 say 'Dica 1: ' + cDica1
                elseif nVidas == 4
                    @ 18,01 say 'Dica 2: ' + cDica2
                elseif nVidas == 3
                    @ 19,01 say 'Dica 3: ' + cDica3
                endif
            endif 

            if nVidas == 5
                @ 10,40 say 'o'
            elseif nVidas == 4
                @ 11,40 say '|'
                @ 12,40 say '|'
            elseif nVidas == 3
                @ 11,39 say '/|\'
            elseif nVidas == 2
                @ 13,39 say '/ \'
            elseif nVidas == 1
                @ 14,39 say 'o o'
            elseif nVidas == 0
                @ 10,41 clear to 14,41
                @ 10,39 say '___'   color cCorErrado
                @ 11,38 say '/   \' color cCorErrado
                @ 12,38 say '|DIE|' color cCorErrado
                @ 13,38 say '|___|' color cCorErrado
                Inkey(0)
            endif
        endif 
        
    enddo
    
    clear 
enddo
