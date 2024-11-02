set date brit
set epoch to 1940

do while .t.

    clear 

    cNomeCliente    := Space( 40 )
    nIdadeCliente   := 0
    dCompra         := Date()
    dVencimento     := dCompra + 30
    dEntrega        := dCompra + 3
    nLimite         := 0
    nTotalFinal     := 0

    @ 01,01 say 'INFORMACOES CLIENTE'
    @ 02,01 say 'Nome:'
    @ 03,01 say 'Idade:'
    @ 04,01 say 'Data da compra:'
    @ 05,01 say 'Limite de gasto:'

    @ 02,06 get cNomeCliente    picture '@!'           valid !Empty( cNomeCliente )
    @ 03,07 get nIdadeCliente   picture '999'          valid !Empty( nIdadeCliente )
    @ 04,16 get dCompra                                valid dCompra <= Date() .and. !Empty( dCompra )
    @ 05,17 get nLimite         picture '@e 99999.99'  valid nLimite > 0 .and. !Empty( nLimite )
    read 

    if LastKey() == 27
        nOpcao := Alert('Deseja parar o programa?', {'Sim', 'Nao'})
        if nOpcao == 1
            exit
        endif
        loop
    endif

    inkey(0)
    clear

    @ 01,01 say 'SEQ'
    @ 01,06 say 'PRODUTO'
    @ 01,28 say 'QTD'
    @ 01,36 say 'PRECO'
    @ 01,45 say 'VALOR'
    nSequencia      := 0
    nLinhaProduto1  := 2

    do while .t.

        nSequencia++
        nLinhaProduto    := nSequencia + 1
        nLinhaPontinhada := nSequencia + 2
        nLinhaTotal      := nSequencia + 4
        nLinhaLimite     := nSequencia + 5

        cProduto         := Space( 20 )
        nQuantidade      := 0
        nPreco           := 0

        @ nLinhaProduto,01    say AllTrim(str(nSequencia))
        @ nLinhaPontinhada,01 say '---------------------------------------------------'
        
        @ nLinhaProduto,04    get cProduto       picture '@!'        valid   !Empty( cProduto )
        @ nLinhaProduto,28    get nQuantidade    picture '999.99'    valid   nQuantidade >= 0
        @ nLinhaProduto,36    get nPreco         picture '@e 999.99' valid   nQuantidade >= 0
        read 

        if LastKey() == 27
            nOpcaoProduto := Alert('Deseja', {'Cancelar', 'Finalizar', 'Continuar'})
            if nOpcaoProduto == 1 .or. nOpcaoProduto == 2
                exit
            else
                loop
            endif
        endif
        
        nTotal      := nQuantidade * nPreco
        nLimite     := nLimite - nTotal
        @ nLinhaProduto,44 say nTotal         picture '@e 99999.99'
        
        nTotalFinal += nTotal
        @ nLinhaTotal,30      say 'TOTAL'
        @ nLinhaLimite,30     say 'LIMITE'
        @ nLinhaTotal,44      say nTotalFinal      picture '@e 9999.99'
        
        cCor := Space(5)
        if nLimite >= 0
            cCor := 'g/'
        else
            cCor := 'r/'
        endif
        @ nLinhaLimite,44     say nLimite          picture '@e 9999.99'    color cCor

        @ nLinhaPontinhada,01 clear to nLinhaPontinhada,53

        if nSequencia == 20
            @ nLinhaProduto1,01 clear to nLinhaPontinhada+1,53
            nSequencia := 0
        endif

    enddo

    if nOpcaoProduto == 1
        clear
        loop
    endif

    inkey(0)
    clear

    cEndereco       := Space(31)
    nNumeroCasa     := 0
    cComplemento    := Space(15)

    @ 01,01 say 'LOCAL DE ENTREGA'
    @ 02,01 say 'Endereco:'
    @ 03,01 say 'Numero:'
    @ 04,01 say 'Complemento:'
    @ 02,10 get cEndereco       picture '@!'    valid !Empty( cEndereco )
    @ 03,08 get nNumeroCasa     picture '9999'  valid nNumeroCasa > 0
    @ 04,13 get cComplemento    picture '@!'    valid !Empty( cComplemento )
    read

    inkey(0)
    set color to 'n/gr'
    @ 00,00 clear to 20,52 

    @ 02,00 to 04,52
    @ 00,00 to 20,52 double
    @ 16,40 to 19,51

    @ 01,19 say 'NOTA DE COMPRA'
    @ 03,30 say 'DATA COMPRA: ' + DToC( dCompra )
    @ 03,01 say 'PRODUTOS'

    @ 05,35 say 'QTD'
    @ 05,46 say 'VALOR'

    @ 06,01 say 'Quantidade de produtos'
    @ 06,35 say AllTrim(str(nSequencia))
    @ 06,44 say nTotalFinal              picture '@e 99999.99'

    @ 07,01 say '---------------------------------------------------'

    @ 08,35 say 'LIMITE'
    if nLimite >= 0
        cCor := 'g/gr'
    else
        cCor := 'r/gr'
    endif
    @ 08,44 say nLimite             picture '@e 99999.99'    color cCor

    @ 10,01 say 'Inoformacao de venda'
    @ 11,01 say 'Cliente: ' + AllTrim( cNomeCliente )
    @ 12,01 say 'Idade: ' + AllTrim( str( nIdadeCliente ) )
    @ 13,01 say 'Local de entrega: ' + AllTrim( cEndereco )
    @ 14,01 say 'Numero: ' + AllTrim( str( nNumeroCasa ) )
    @ 15,01 say 'Complemento: ' + cComplemento
    @ 16,01 say 'Data estimada de entrega: ' + DToC( dEntrega )

    @ 18,01 say 'Pagar ate: ' + DToC( dVencimento )
    @ 17,44 say 'LOGO'  color 'r/gr'

    @ 20,01 say ''

    inkey(0)
enddo
