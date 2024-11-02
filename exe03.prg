clear

nSomaProduto := 0

@ 01,01 to 06,39

do while .t.

    nNumero1     := 0
    nNumero2     := 0

    @ 02,02 say 'Valor do primeiro numero: '
    @ 03,02 say 'Valor do segundo numero:  '

    @ 02,28 get nNumero1  picture '999'  valid   nNumero1 > 0
    @ 03,28 get nNumero2  picture '999'  valid   nNumero2 > 0
    read

    nProduto := nNumero1 * nNumero2
    nSomaProduto += nProduto

    @ 05,02 say 'O produto entre ' + AllTrim( str( nNumero1 ) ) + ' e ' + AllTrim( str( nNumero2 ) ) + ' = ' + AllTrim( str( nProduto ) )
    @ 07,01 say ''

    Inkey(0)

    if LastKey() == 27
        nOpcao := Alert('Deseja sair? ', {'Sim', 'Nao', 'Zerar'}, 'w/n')
        if nOpcao == 1
            exit
        elseif nOpcao ==3
            nSomaProduto := 0
            loop
        endif
        loop
    endif 

    @ 02,02 clear to 05,38
enddo 

Alert('A soma de todos os produtos calculados = ' + AllTrim( str( nSomaProduto ) ))

@ 08,01 say 'A soma de todos os produtos calculados ='
@ 08,42 say AllTrim( str( nSomaProduto ) )
