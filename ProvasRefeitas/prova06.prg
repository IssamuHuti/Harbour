//Forca

set wrap on
set message to 08 center

clear

cParticipante         := Space(10)
nOpcaoParticipante    := 0
cDica1                := Space(10)
cDica2                := Space(10)
cDica3                := Space(10)
cPalavra              := ''
cPalavraOculta        := Space(10)
nVida                 := 0
cCaracteresPermitidos := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
cTentadas             := ''

@ 01,01 say 'Nome do participante:'
@ 01,23 get cParticipante       picture '@!'    valid !Empty(cParticipante)
read

do while .t.
    @ 03,01 say    'OPCAO'
    @ 04,01 prompt 'Criar o jogo'  message 'Informa a palavra e as dicas'
    @ 05,01 prompt 'Desafiante'    message 'Tenta concluir o jogo'
    menu to nOpcaoParticipante

    if LastKey() == 27
        nOpcaoSair := Alert('Deseja sair?', {'Sim', 'Nao'})
        if nOpcaoSair == 1
            exit
        else
            loop
        endif
    endif

    if nOpcaoParticipante == 1
        clear
        @ 01,01 say 'Digite a palavra:'
        @ 03,01 say 'Dica 1:'
        @ 04,01 say 'Dica 2:'
        @ 05,01 say 'Dica 3:'

        @ 01,19 get cPalavraOculta    picture '@!'    valid !Empty(cPalavraOculta)
        @ 03,09 get cDica1            picture '@!'    valid !Empty(cDica1)
        @ 04,09 get cDica2            picture '@!'    valid !Empty(cDica2)
        @ 05,09 get cDica3            picture '@!'    valid !Empty(cDica3)
        read 

        @ 07,01 say 'Passe para o Desafiante'

        Inkey(0)
        nOpcaoParticipante := 2
    endif

    if nOpcaoParticipante == 2
        clear

        if Len(AllTrim(cPalavraOculta)) == 0
            Alert('Nao foi cadastrada nenhuma palavra para adivinhar')
            exit
        endif

        @ 01,01 say 'Escolha o desafio'
        nOpcaoDesafio := 0
        @ 02,01 prompt 'Facil'
        @ 03,01 prompt 'Medio'
        @ 04,01 prompt 'Dificil'
        menu to nOpcaoDesafio

        if nOpcaoDesafio == 1
            nVida := 6
        elseif nOpcaoDesafio == 2
            nVida := 5
        elseif nOpcaoDesafio == 3
            nVida := 4
        endif

        do while Len(cPalavra) <= Len(AllTrim(cPalavraOculta))
            cPalavra += '*'
        enddo

        clear
        do while !(cPalavra == AllTrim(cPalavraOculta)) .and. (nVida > 0)
            cLetra := Space(1)
            @ 01,01 say 'Palavra Oculta  :'
            @ 01,19 say AllTrim(cPalavra)
            @ 02,01 say 'Digite uma letra:'
            @ 03,01 say 'Vida restante   :'
            @ 03,19 say AllTrim(Str(nVida))
            @ 05,01 say 'Letras tentadas'
            @ 06,01 say cTentadas

            if nOpcaoDesafio == 1
                if nVida <= 5
                    @ 07,01 say 'Dica 1:'
                    @ 07,09 say cDica1
                endif
                if nVida <= 4
                    @ 08,01 say 'Dica 2:'
                    @ 08,09 say cDica2
                endif
                if nVida <= 3
                    @ 09,01 say 'Dica 3:'
                    @ 09,09 say cDica3
                endif
            endif

            @ 02,19 get cLetra  picture '@!'    valid !Empty(cLetra) .and. (cLetra $ cCaracteresPermitidos)
            read

            nCount  := 1
            nColuna := 19
            nCertas := 0
            nNova   := ''
            do while nCount <= Len(AllTrim(cPalavraOculta))
                if SubStr(AllTrim(cPalavraOculta), nCount, 1) == cLetra
                    if SubStr(AllTrim(cPalavraOculta), nCount, 1) == SubStr(AllTrim(cPalavra), nCount, 1)
                    nCertas++
                else
                    nNova += '*'
                endif
                nCount++
                nColuna++
            enddo

            if nCertas == Len(AllTrim(cPalavraOculta))
                Alert('Voce acertou a palavra')
            endif

            if cLetra $ cTentadas
                Alert('Essa letra ja foi utilizada')
                loop
            endif
            cTentadas += cLetra

            if cLetra $ cPalavraOculta
                loop
            else
                nVida--
            endif

        enddo

        if nVida == 0
            clear 
            Alert('Perdedor!')
            exit
        endif

    endif
enddo
