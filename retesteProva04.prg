set scoreboard off
set epoch to 1940
set date british
SetMode (25,80)

clear

nCodigo             := 0 
cCadastroLogin      := ''
cValidacaoMinusculo := 'abcdefghijklmnopqrstuvwxyz'
cValidacaoMaiusculo := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
cValidacaoNumero    := '0123456789'
cValidacaoEspeciais := '!@#$%^&*()-+'
lValidacaoSenha     := .f.
lMaiuscula          := .f.
lMinuscula          := .f.
lNumerico           := .f.
lEspeciais          := .f.

do while .t. 
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
        nCodigo++
        cSenha              := Space(12)
        dDataCadastro       := CToD('')
        
        do while !lValidacaoSenha
            @ 01,01 say 'Cadastrar    : ' + AllTrim(Str(nCodigo))
            @ 02,01 say 'Senha        :'
            @ 03,01 say 'Data Cadastro:'
            
            @ 02,16 get cSenha          valid !Empty(cSenha)
            @ 03,15 get dDataCadastro   valid !Empty(dDataCadastro)
            read 
            
            if LastKey() == 27
                exit 
            endif 
            
            if Len(AllTrim(cSenha)) < 8 
                Alert('A senha tem que ter no minimo 8 caracteres')
                loop 
            endif 
            
            nCont := 1
            do while nCont <= Len(AllTrim(cSenha))
                if SubStr(cSenha, nCont, 1) $ cValidacaoMaiusculo
                    lMaiuscula := .t.
                endif 
                if SubStr(cSenha, nCont, 1) $ cValidacaoMinusculo
                    lMinuscula := .t.
                endif 
                if SubStr(cSenha, nCont, 1) $ cValidacaoNumero
                    lNumerico := .t.
                endif 
                if SubStr(cSenha, nCont, 1) $ cValidacaoEspeciais
                    lEspeciais := .t.
                endif 
                nCont++
            enddo
        
            if lMaiuscula .and. lMinuscula .and. lNumerico .and. lEspeciais
                lValidacaoSenha := .t. 
            else
                cSenhaFraca := ''
                if !lMaiuscula
                    cSenhaFraca += 'letra maiuscula '
                endif
                if !lMinuscula
                    cSenhaFraca += 'letra minuscula '
                endif
                if !lNumerico
                    cSenhaFraca += 'numero '
                endif
                if !lEspeciais
                    cSenhaFraca += 'caracter especial '
                endif
                Alert('Senha fraca, inclua ' + cSenhaFraca)
            endif 
        
            Inkey(0)
            @ 01,00 clear to 03,40
            @ 10,00 clear to 13,20
        enddo

        cCadastroLogin += cSenha + DToC(dDataCadastro)
    endif
    
    if nOpcaoInical == 2
        nConsultaCodigo := 0
        @ 03,01 say 'Consulta codigo:'

        @ 03,17 get nConsultaCodigo picture '999'   valid !Empty(nConsultaCodigo) .and. nConsultaCodigo > 0 
        read 

        cSenhaCadastrada := SubStr(cCadastroLogin, 1 + (20 * nConsultaCodigo), 12)
        cSenhaData       := SubStr(cCadastroLogin, 13 + (20 * nConsultaCodigo), 8)
        
        @ 05,01 say 'Login   :' + Str(nCodigo)
        @ 06,01 say 'Senha   :' + AllTrim(cSenhaCadastrada)
        @ 07,01 say 'Cadastro:' + cSenhaData

        dDataLogin      := DToC(cSenhaData)
        nMesAtual       := Month(nMesAtual)
        cDescricaoMes   := ''
        nAnoAtual       := Year(dDataLogin)
        nPrimeiroDia    := '01/' + AllTrim(Str(nMesAtual)) + AllTrim(Str(nAnoAtual))
        nAnoSeguinte    := nAnoAtual + 1
        nMesSeguinte    := nMesAtual + 1

        if nMesSeguinte != 13
            nUltimoDiaMes   := DToC('01/' + AllTrim(Str(nMesSeguinte)) + '/' + nAnoAtual) - 1
        else 
            nUltimoDiaMes   := DToC('31/12/' + AllTrim(Str(nAbiSeguinte)))
        endif 

        if nMesAtual == 1
            cDescricaoMes := 'Janeiro'
        elseif nMesAtual == 2
            cDescricaoMes := 'Fevereiro'
        elseif nMesAtual == 3
            cDescricaoMes := 'Marco'
        elseif nMesAtual == 4
            cDescricaoMes := 'Abril'
        elseif nMesAtual == 5
            cDescricaoMes := 'Maio'
        elseif nMesAtual == 6
            cDescricaoMes := 'Junho'
        elseif nMesAtual == 7
            cDescricaoMes := 'Julho'
        elseif nMesAtual == 8
            cDescricaoMes := 'Agosto'
        elseif nMesAtual == 9
            cDescricaoMes := 'Setembro'
        elseif nMesAtual == 10
            cDescricaoMes := 'Outubro'
        elseif nMesAtual == 11
            cDescricaoMes := 'Novembro'
        elseif nMesAtual == 12
            cDescricaoMes := 'Dezembro'
        endif 

        @ 03,23 say cDescricaoMes
        @ 04,20 say 'D   S   T   Q   Q   S   S'

        nLinha   := 05
        nColuno  := 20
        nContDia := 1
        do while nContDia <= nUltimoDiaMes
            @ nLinha,nColuno say AllTrim(Str(nContDia))

            nLinha += 4
            if nColuno > 45
                nColuno := 1
                nLinha++
            endif 

            nContDia++
        enddo

        Inkey(0)
    endif

    if nOpcaoInical == 3
        exit 
    endif 
    
enddo
