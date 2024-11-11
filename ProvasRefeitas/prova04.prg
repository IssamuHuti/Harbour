//Cadastro Senha

set epoch to 1940
set Date brit
set message to 12 center
set wrap on 

clear

cSenhaCadastrada    := ''
nCodigo             := 1
cMaiuscula          := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
cMinuscula          := 'abcdefghijklmnopqrstuvwxyz'
cNumeros            := '0123456789'
cEspeciais          := '!@#$%^&*()-+'
lMaiuscula          := .f.
lMinuscula          := .f.
lNumero             := .f.
lEspeciais          := .f.

do while .t.
    set color to 'w/n' 
    clear
    nOpcaoMenu      := 0

    @ 01,01 prompt 'Cadastrar'  message 'Cadastra nova senha'
    @ 02,01 prompt 'Consultar'  message 'Consulta a senha e a data do cadastro'
    @ 03,01 prompt 'Sair'       message 'Sai do programa'
    menu to nOpcaoMenu

    if nOpcaoMenu == 1
        clear
        
        do while .t.
            cSenha          := Space(12)
            dCadastro       := CToD('')

            @ 01,01 say 'CODIGO..........:'
            @ 01,19 say nCodigo 
            @ 02,01 say 'SENHA...........:'
            @ 03,01 say 'DATA CADASTRO...:'

            @ 02,19 get cSenha      valid !Empty(cSenha)
            @ 03,19 get dCadastro   valid !Empty(dCadastro) .and. dCadastro <= Date()
            read 

            if LastKey() == 27
                nOpcaoVoltarMenu := Alert('Deseja voltar ao menu?', {'Sim', 'nao'})
                if nOpcaoVoltarMenu == 1
                    exit
                else
                    loop
                endif
            endif

            if Len(AllTrim(cSenha)) < 8
                Alert('A senha tem que ter no minimo 8 caracteres')
                loop
            endif

            nCount := 1
            do while nCount <= Len(cSenha)
                if SubStr(cSenha, nCount, 1) $ cMaiuscula
                    lMaiuscula := .t.
                endif
                if SubStr(cSenha, nCount, 1) $ cMinuscula
                    lMinuscula := .t.
                endif
                if SubStr(cSenha, nCount, 1) $ cNumeros
                    lNumero := .t.
                endif
                if SubStr(cSenha, nCount, 1) $ cEspeciais
                    lEspeciais := .t.
                endif
                nCount++
            enddo

            if lMaiuscula .and. lMinuscula .and. lNumero .and. lEspeciais
                exit
            else
                Alert('Senha fraca, tente novamente')
                loop
            endif
        enddo

        cSenhaCadastrada += cSenha + DToC(dCadastro)

        nCodigo++
    elseif nOpcaoMenu == 2
        clear
        
        nCodigo2 := 0
        @ 01,01 say 'Digite um Codigo:'
        @ 01,19 get nCodigo2    picture '9'     valid !Empty(nCodigo2)
        read 

        cSenhaCadastro := SubStr(cSenhaCadastrada, 1 + (nCodigo2 * 20), 12)
        cDataCadastro  := SubStr(cSenhaCadastrada, 13 + (nCodigo2 * 20), 8)

        @ 03,01 say 'Senha cadastrada :' + AllTrim(cSenhaCadastro)
        @ 04,01 say 'Data do cadastro :' + cDataCadastro
        Inkey(0)

        if Month(dCadastro) == 12
            dUltimoDiaMes   := CToD('01/01/' + Str(Year(dCadastro) + 1)) - 1
            dPrimeiroDiaMes := CToD('01/' + Str(Month(dCadastro)) + '/' + Str(Year(dCadastro)))
        else
            dUltimoDiaMes   := CToD('01/' + Str(Month(dCadastro) + 1) + '/' + Str(Year(dCadastro))) - 1
            dPrimeiroDiaMes := CToD('01/' + Str(Month(dCadastro)) + '/' + Str(Year(dCadastro)))
        endif

        @ 06,04 say 'D  S  T  Q  Q  S  S'
        nLinha  := 7
        nColuna := Dow(dPrimeiroDiaMes) * 3
        nDia    := 1

        do while  nDia <= Day(dUltimoDiaMes)
            set color to 'n/w'

            if nDia == Day(dCadastro)
                @ nLinha,nColuna say nDia picture '99' color 'w/r'
            else
                @ nLinha,nColuna say nDia picture '99'
            endif
            nColuna += 3
            if nColuna >= 22
                nLinha++
                nColuna := 3
            endif
            nDia++
        enddo

        Inkey(0)
        loop
    else
        clear
        exit
    endif

enddo
