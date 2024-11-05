clear

do while .t.

    nPrimeiroNumero := 0
    nUltimoNumero   := 0
    nQtdNumero      := 0
    nSomaEntre      := 0

    @ 01,01 say 'Digite o primeiro numero:'
    @ 02,01 say 'Digite o segundo numero :'

    @ 01,27 get nPrimeiroNumero     picture '9999'
    @ 02,27 get nUltimoNumero       picture '9999'
    read

    if LastKey() == 27
        nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'}, 'n/w')
        if nOpcao == 1
            exit
        else
            loop
        endif
    endif

    nQtdNumero := nUltimoNumero - nPrimeiroNumero + 1
    nSomaEntre := (nQtdNumero * (nPrimeiroNumero + nUltimoNumero)) / 2

    @ 04,01 say 'O resultado da soma dos numeros entre ' + AllTrim(str(nPrimeiroNumero)) + ;
                ' e ' + AllTrim(str(nUltimoNumero)) + ' foi de:'
    @ 05,01 say 'Resultado:'
    if nSomaEntre >= 0
        @ 05,12 say nSomaEntre  picture '999999'    color 'g/'
    else
        @ 05,12 say nSomaEntre  picture '999999'    color 'r/'
    endif

enddo