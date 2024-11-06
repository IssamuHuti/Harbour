// Lucas Issamu Morino Yamahuti

set Date brit 
set epoch to 1940

clear 

nCadastro       := 0
cEspeciais      := '!@#$%^&*()-+'
cMinusculo      := 'abcdefghijklmnopqrstuvwxyz'
cMaiusculo      := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
lEspeciais      := .f.
lMinusculo      := .f.
lMaiusculo      := .f.
lValidado       := .f.
nCodigo         := 0
cCadastroInfo   := ''

do while .t.
    @ 01,01 say '1- Cadastrar'
    @ 02,01 say '2- Cadastrar'
    @ 03,01 say '3- Cadastrar'

    @ 04,01 get nCodigo     picture '9'   valid !Empty(nCodigo) .or. (nCodigo == 1) .or. (nCodigo == 2) .or. (nCodigo == 3)
    read 

    if LastKey() == 27
        nOpcaoSistema := Alert('Sair do programa?', {'Sim', 'Nao'})
        if nOpcaoSistema == 1
            exit
        else
            loop
        endif
    endif

    if nCodigo == 1
        nCadastro++
        do while .t.
            clear
            cSenha       := Space(20)
            dCadastro    := CToD('')
            cVerificacao := ''

            @ 01,01 say 'Codigo  :'     picture '999'
            @ 02,01 say 'Senha   :'
            @ 03,01 say 'Cadastro:'
            @ 01,11 say nCadastro

            @ 02,11 get cSenha      valid !Empty(cSenha)
            @ 03,11 get dCadastro   valid !Empty(dCadastro) .and. dCadastro <= Date()
            read 

            if LastKey() == 27
                nOpcao := Alert('Voltar?', {'Sim', 'Nao'})
                if nOpcao == 1
                    exit
                else
                    loop
                endif
            endif

            nTamanhoStr := Len(AllTrim(cSenha))

            if nTamanhoStr >= 8
                nEspeciais := 1
                nMinuscula := 1
                nMaiuscula := 1

                do while nEspeciais < Len(cEspeciais)
                    if (SubStr(cEspeciais, nEspeciais, 1) $ cSenha)
                        lEspeciais := .t.
                    endif
                    nEspeciais++
                enddo
                do while nMaiuscula < Len(cMaiusculo)
                    if (SubStr(cMaiusculo, nMaiuscula, 1) $ cSenha)
                        lMaiusculo := .t.
                    endif
                    nMaiuscula++
                enddo
                do while nMinuscula < Len(cMinusculo)
                    if (SubStr(cMinusculo, nMinuscula, 1) $ cSenha)
                        lMinusculo := .t.
                    endif
                    nMinuscula++
                enddo

                if (lMaiusculo == .t.) .and. (lMinusculo == .t.) .and. (lEspeciais == .t.)     
                    lValidado := .t.
                endif

                cCadastroInfo += str(nCadastro) + DToC(dCadastro) // 18, data(ultimas 8)
                @ 05,01 say SubStr(cCadastroInfo, 10, 1)
                @ 06,01 say SubStr(cCadastroInfo, 11, 8)

                Inkey(0)

                if lValidado == .t.
                    exit
                else
                    Alert('Senha fraca. Tente novamente!')
                    loop
                endif
            else
                Alert('Senha deve possuir pelo menos 8 caracteres')
                loop
            endif

        enddo

    elseif nCodigo == 3
        exit

    elseif nCodigo == 2
        clear

        if nCadastro == 0
            Alert('Nao existe senhas cadastradas')
            loop
            clear
        endif

        nCodigoCadastrado := 0
        
        @ 01,01 say 'Codigo:'
        
        @ 01,09 get nCodigoCadastrado   picture '999'   valid !Empty(nCodigoCadastrado)
        read

        @ 02,01 say 'Senha:'
        @ 02,08 say cSenha

    endif
enddo 
