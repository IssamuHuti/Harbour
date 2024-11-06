// Lucas Issamu Morino Yamahuti

set Date brit 
set epoch to 1940

clear 

cCodigo     := 0
cEspeciais  := '!@#$%^&*()-+'
cMinusculo  := 'abcdefghijklmnopqrstuvwxyz'
cMaiusculo  := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
lEspeciais  := .f.
lMinusculo  := .f.
lMaiusculo  := .f.
nCodigo     := 0

do while .t.
    cCodigo++

    @ 01,01 say '1- Cadastrar'
    @ 02,01 say '2- Cadastrar'
    @ 03,01 say '3- Cadastrar'

    @ 04,01 get nCodigo     picture '9'   valid !Empty(nCodigo) .or. (nCodigo == 1) .or. (nCodigo == 2) .or. (nCodigo == 3)
    read 

    if LastKey() == 27
        nOpcaoSistema := Alert('Sair do programa?', {'Sim', 'Nao'})
        if nOpcao == 1
            exit
        else
            loop
        endif
    endif

    if nCodigo == 1
        clear
        do while .t.
            cSenha       := Space(20)
            dCadastro    := CToD('')
            cVerificacao := ''

            @ 01,01 say 'Codigo  :'     picture '999'
            @ 02,01 say 'Senha   :'
            @ 03,01 say 'Cadastro:'
            @ 01,11 say cCodigo

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
                nValidacao := 1
                do while nTamanhoStr > 0
                    if (SubStr(cSenha, nValidacao, 1) $ cEspeciais)
                        lEspeciais := .t.
                    endif
                    if (SubStr(cSenha, nValidacao, 1) $ cMaiusculo)
                        lMaiusculo := .t.
                    endif
                    if (SubStr(cSenha, nValidacao, 1) $ cMinusculo)
                        lMinusculo := .t.
                    endif   
                    if lMaiusculo .and. lMinusculo .and. lEspeciais     
                        cVerificacao += SubStr(cSenha, nValidacao, 1)
                    endif
                    nValidacao++
                    nTamanhoStr--
                enddo
                if cSenha == cVerificacao
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
    endif

    if nCodigo == 3
        exit
    endif
enddo 
