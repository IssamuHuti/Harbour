// Lucas Issamu Morino Yamahuti

set wrap on
set message to 12 center

clear 

cUsuario       := Space(10)
nOpcaoNivel    := 0
cPalavraChave  := Space(10)
nChances       := 0
nOpcaoJogo     := 0
cDicas         := ''
cDica1         := Space(20)
cDica2         := Space(20)
cDica3         := Space(20)
cPalavraOculta := ''
cDescoberta    := ''
cTentadas      := ''
cValidas       := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

@ 01,01 say 'Nome do desafiante:'
@ 01,20 get cUsuario    picture'@!'    valid !Empty(cUsuario)
read 

do while .t.
    @ 03,01 say 'Escreva ou Descubra a palavra'
    @ 04,01 prompt 'Escrever'   message 'Escreva a palavra chave e as dicas'
    @ 05,01 prompt 'Descobrir'
    menu to nOpcaoJogo

    clear

    if nOpcaoJogo == 1
        @ 01,01 say 'Digite a palavra:'
        @ 02,01 say 'Dica 1:'
        @ 03,01 say 'Dica 2:'
        @ 04,01 say 'Dica 3:'

        @ 01,19 get cPalavraChave   picture '@!'    valid !Empty(cPalavraChave) .and. Len(AllTrim(cPalavraChave)) >= 3
        @ 02,10 get cDica1          picture '@!'    valid !Empty(cDica1)
        @ 03,10 get cDica2          picture '@!'    valid !Empty(cDica2)
        @ 04,10 get cDica3          picture '@!'    valid !Empty(cDica3)
        read 

        nOpcaoJogo := 2
    endif 

    if nOpcaoJogo == 2

        if Len(AllTrim(cPalavraChave)) == 0
            Alert('Nao contem nenhuma palavra para descobrir')
            loop
        endif

        @ 01,01 say 'Escolha o nivel:'
        @ 02,03 say '1 - Facil'      
        @ 03,03 say '2 - Medio'      
        @ 04,03 say '3 - Dificil'

        @ 01,18 get nOpcaoNivel     picture '9'     valid (nOpcaoNivel == 1) .or. (nOpcaoNivel == 2) .or. (nOpcaoNivel == 3)
        read 

        clear 

        if nOpcaoNivel == 1
            nChances := 6
        elseif nOpcaoNivel == 2
            nChances := 5
        elseif nOpcaoNivel == 3
            nChances := 4
        endif 

        do while Len(cPalavraOculta) <= Len(AllTrim(cPalavraChave))
            cPalavraOculta += '*'
        enddo
        
        do while !(cPalavraOculta == cPalavraChave) .and. (nChances > 0)
            if nOpcaoNivel == 1 .and. nChances == 5
                @ 05,01 say cDica1
            elseif nOpcaoNivel == 1 .and. nChances == 4             
                @ 06,01 say cDica1
            elseif nOpcaoNivel == 1 .and. nChances == 3
                @ 07,01 say cDica1
            endif

            if nChances == 6
                @ 05,20 say 'O'
                @ 06,19 say '\|/'
                @ 07,20 say '|'
                @ 08,19 say '/ \'
                @ 09,19 say 'o o'
            elseif nChances == 5
                @ 05,20 say 'O'
                @ 06,19 say '\|/'
                @ 07,20 say '|'
                @ 08,19 say '/ \'
            elseif nChances == 4
                @ 05,20 say 'O'
                @ 06,19 say '\|/'
                @ 07,20 say '|'
            elseif nChances == 3
                @ 05,20 say 'O'
                @ 06,19 say '\|/'
            elseif nChances == 2
                @ 05,20 say 'O'
                @ 06,20 say '|'
            elseif nChances == 1
                @ 05,20 say 'O'
            else
                @ 05,20 say 'DIE' color 'r/'
            endif            

            @ 01,01 say 'Digite uma letra:'
            @ 02,01 say cPalavraOculta
            
            cLetra         := ' '
            @ 01,19 get cLetra  picture '@!'    valid !Empty(cLetra) .and. (cLetra $ cValidas)
            read

            cTentadas += cLetra + '/'
            
            nCount := 1
            cPalavraOculta := ''
            do while nCount <= Len(AllTrim(cPalavraChave))
                if SubStr(AllTrim(cPalavraChave), nCount, 1) == cLetra
                    cPalavraOculta += cLetra
                else 
                    cPalavraOculta +='*'
                endif 
                nCount++
            enddo

            @ 09,01 say cTentadas
            if !(cLetra $ cPalavraChave)
                nChances--
            endif

            nValicao  := 1
            nValidada := 0
            do while Len(cPalavraChave) >= nValicao
                if SubStr(cPalavraChave, nValicao, 1) $ cTentadas
                    nValidada++
                endif 
                nValicao++
            enddo 
            
            if nValidada == Len(cPalavraChave)
                Alert('Parabens, voce descobriu a palavra')
                exit
            else
                loop
            endif

        enddo
        
    endif

    nOpcaoParar := Alert('Jogo encerrado, jogar novamente:', {'Sim', 'Nao'})
    if nOpcaoParar == 1
        exit
    else 
        loop
    endif
enddo
