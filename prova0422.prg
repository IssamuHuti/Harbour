// Lucas Issamu Morino Yamahuti

set Date brit 
set epoch to 1940
set message to 12 center
set wrap on 

clear 

nCadastro       := 0
cEspeciais      := '!@#$%^&*()-+'
cMinusculo      := 'abcdefghijklmnopqrstuvwxyz'
cMaiusculo      := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
cNumero         := '0123456789'
lEspeciais      := .f.
lMinusculo      := .f.
lMaiusculo      := .f.
lValidado       := .f.
lNumero         := .f.
nCodigo         := 0
cCadastroInfo   := ''

do while .t.
    // @ 01,01 say '1- Cadastrar'
    // @ 02,01 say '2- Cadastrar'
    // @ 03,01 say '3- Cadastrar'

    // @ 04,01 get nCodigo     picture '9'   valid !Empty(nCodigo) .or. (nCodigo == 1) .or. (nCodigo == 2) .or. (nCodigo == 3)
    // read 

    nOpcaoInical := 0
    @ 01,01 prompt 'Cadastrar' message 'Cadastra Senhas'
    @ 02,01 prompt 'Consultar' message 'Consulta Senhas'
    @ 03,01 prompt 'Sair     ' message 'Sai do programa'
    menu to nOpcaoInical

    if LastKey() == 27
        nOpcaoSistema := Alert('Sair do programa?', {'Sim', 'Nao'})
        if nOpcaoSistema == 1
            exit
        else
            loop
        endif
    endif

    if nOpcaoInical == 1
        nCadastro++
        do while .t.
            clear
            cSenha       := Space(12)
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
                nNumero    := 1

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
                do while nNumero < Len(cNumero)
                    if (SubStr(cNumero, nNumero, 1) $ cSenha)
                        lNumero := .t.
                    endif
                    nNumero++
                enddo

                if (lMaiusculo == .t.) .and. (lMinusculo == .t.) .and. (lEspeciais == .t.) .and. (lNumero == .t.)
                    lValidado := .t.
                endif

                cCadastroInfo += DToC(dCadastro) + cSenha
                // @ 05,01 say SubStr(cCadastroInfo, 1, 8)

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

    elseif nOpcaoInical == 2
        clear
        
        if nCadastro == 0
            Alert('Nao existe senhas cadastradas')
            loop
            clear
        endif
        
        nCodigoCadastrado := 0
        cCadastrado       := ''
        
        @ 01,01 say 'Codigo:'
        @ 02,01 say 'Data  :'
        
        @ 01,09 get nCodigoCadastrado   picture '999'   valid !Empty(nCodigoCadastrado)
        read
        
        cDataCadastrado := SubStr(cCadastroInfo, (20 * (nCodigoCadastrado - 1)) + 1, 8)
        @ 02,09 say cDataCadastrado
        dCadastrado     := CToD(cDataCadastrado)

        nAnoCadastro    := Year(dCadastrado)
        nMesCadastro    := Month(dCadastrado)
        nDiaCadastro    := Day(dCadastrado)
        cMes            := ''

        // if nMesCadastro == 1
        //     cMes := 'Janeiro'
        // elseif nMesCadastro == 2
        //     cMes := 'Fevereiro'
        // elseif nMesCadastro == 3
        //     cMes := 'Marco'
        // elseif nMesCadastro == 4
        //     cMes := 'Abril'
        // elseif nMesCadastro == 5
        //     cMes := 'Maio'
        // elseif nMesCadastro == 6
        //     cMes := 'Junho'
        // elseif nMesCadastro == 7
        //     cMes := 'Julho'
        // elseif nMesCadastro == 8
        //     cMes := 'Agosto'
        // elseif nMesCadastro == 9
        //     cMes := 'Setembro'
        // elseif nMesCadastro == 10
        //     cMes := 'Outubro'
        // elseif nMesCadastro == 11
        //     cMes := 'Novembro'
        // elseif nMesCadastro == 12
        //     cMes := 'Dezembro'
        // endif

        cPrimeiroDiaMes     := '01/' + AllTrim(Str(nMesCadastro)) + '/' + AllTrim(Str(nAnoCadastro))
        dPrimeiroDiaMes     := CToD(cPrimeiroDiaMes)
        nDiaPrimeiroMes     := DoW(dPrimeiroDiaMes)

        if nMesCadastro == 12
            cPrimeiroDia   := '01/01' + Str(nAnoCadastro + 1)
            dUltimoDiaMes  := CToD(cPrimeiroDia) - 1
        else
            cPrimeiroDia   := '01/' + Str(nMesCadastro + 1) + '/' + Str(nAnoCadastro)
            dUltimoDiaMes  := CToD(cPrimeiroDia) - 1
        endif

        @ 04,04 say 'D  S  T  Q  Q  S  S'

        nLinha       := 5
        nColuna      := nDiaPrimeiroMes * 3
        nDia         := 1
        do while nDia <= Day(dUltimoDiaMes)
            set color to 'n/w'
            
            if nDia == nDiaCadastro
                @ nLinha,nColuna say nDia   picture '99'    color 'w/r'
            else
                @ nLinha,nColuna say nDia   picture '99'
            endif

            if nColuna >= 19
                nLinha++
                nColuna := 3
            else
                nColuna += 3
            endif
            nDia++
        enddo

        Inkey(0)
        
    else
        exit
        
    endif
enddo 
