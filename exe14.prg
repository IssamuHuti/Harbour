clear

do while .t.
    nCodCli := Space(06)
    @ 01,01 say 'Informe o codigo do cliente'
    @ 01,31 get nCodCli picture '999999'
    read

    Inkey(0)

    if lastkey() == 27
        nOpcao = Alert('Deseja sair?', {'Sim', 'Nao'})
        if nOpcao == 1
            break // loop
        else
            loop
        endif
    endif
enddo
