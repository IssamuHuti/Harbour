set date brit
set epoch to 1940

clear 

cNomeCliente    := Space( 40 )
nIdadeCliente   := 0
dCompra         := Date()
dVencimento     := dCompra + 30
dEntrega        := dCompra + 3
nLimite         := 0

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

inkey(0)
clear

@ 01,01 say 'SEQ'
@ 01,06 say 'PRODUTO'
@ 01,28 say 'QTD'
@ 01,36 say 'PRECO'
@ 01,45 say 'VALOR'

cProdutoA    := Space( 20 )
cProdutoB    := Space( 20 )
cProdutoC    := Space( 20 )
nQuantidadeA := 0
nQuantidadeB := 0
nQuantidadeC := 0
nPrecoA      := 0
nPrecoB      := 0
nPrecoC      := 0
nTotalA      := nQuantidadeA * nPrecoA
nTotalB      := nQuantidadeB * nPrecoB
nTotalC      := nQuantidadeC * nPrecoC

@ 02,01 say '1'
@ 03,01 say '2'
@ 04,01 say '3'
@ 05,01 say '---------------------------------------------------'
nTotalFinal := nTotalA + nTotalB + nTotalC
@ 06,30 say 'TOTAL'
cCor := Space(5)
@ 07,30 say 'LIMITE'
if nLimite >= 0
    cCor := 'g/'
else
    cCor := 'r/'
endif

@ 06,44 say nTotalFinal     picture '@e 9999.99'
@ 07,44 say nLImite         picture '@e 9999.99'    color cCor

@ 02,06 get cProdutoA       picture '@!'        valid   !Empty( cProdutoA )
@ 02,28 get nQuantidadeA    picture '999.99'    valid   nQuantidadeA >= 0
@ 02,36 get nPrecoA         picture '@e 999.99' valid   nQuantidadeA >= 0
read 

nTotalA      := nQuantidadeA * nPrecoA
@ 02,44 say nTotalA         picture '@e 99999.99'

nTotalFinal := nTotalA + nTotalB + nTotalC
nLimite     := nLimite - nTotalA
@ 06,44 say nTotalFinal     picture '@e 99999.99'
if nLimite >= 0
    cCor := 'g/'
else
    cCor := 'r/'
endif
@ 07,44 say nLImite         picture '@e 99999.99'    color cCor

@ 03,06 get cProdutoB       picture '@!'        valid   !Empty( cProdutoB )
@ 03,28 get nQuantidadeB    picture '999.99'    valid   nQuantidadeB >= 0
@ 03,36 get nPrecoB         picture '@e 999.99' valid   nQuantidadeB >= 0
read 

nTotalB      := nQuantidadeB * nPrecoB
@ 03,44 say nTotalB         picture '@e 99999.99'

nTotalFinal := nTotalA + nTotalB + nTotalC
nLimite     := nLimite - nTotalB
@ 06,44 say nTotalFinal     picture '@e 99999.99'
if nLimite >= 0
    cCor := 'g/'
else
    cCor := 'r/'
endif
@ 07,44 say nLImite         picture '@e 99999.99'    color cCor

@ 04,06 get cProdutoC       picture '@!'        valid   !Empty( cProdutoC )
@ 04,28 get nQuantidadeC    picture '999.99'    valid   nQuantidadeC >= 0
@ 04,36 get nPrecoC         picture '@e 999.99' valid   nQuantidadeC >= 0
read 

nTotalC      := nQuantidadeC * nPrecoC
@ 04,44 say nTotalC     picture '@e 99999.99'

nTotalFinal := nTotalA + nTotalB + nTotalC
nLimite     := nLimite - nTotalC
@ 06,44 say nTotalFinal     picture '@e 99999.99'
if nLimite >= 0
    cCor := 'g/'
else
    cCor := 'r/'
endif
@ 07,44 say nLImite         picture '@e 99999.99'    color cCor

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
@ 00,00 clear to 21,52 

@ 02,00 to 04,52
@ 00,00 to 21,52 double
@ 16,40 to 20,51

@ 01,19 say 'NOTA DE COMPRA'
@ 03,30 say 'DATA COMPRA: ' + DToC( dCompra )
@ 03,01 say 'PRODUTOS'

@ 05,01 say 'SEQ'
@ 05,06 say 'PRODUTO'
@ 05,29 say 'QTD'
@ 05,37 say 'PRECO'
@ 05,46 say 'VALOR'

@ 06,01 say '1'
@ 06,06 say cProdutoA           picture '@!'       
@ 06,28 say nQuantidadeA        picture '999.99'   
@ 06,36 say nPrecoA             picture '@e 999.99'
@ 06,44 say nTotalA             picture '@e 99999.99'

@ 07,01 say '2'
@ 07,06 say cProdutoB           picture '@!'       
@ 07,28 say nQuantidadeB        picture '999.99'   
@ 07,36 say nPrecoB             picture '@e 999.99'
@ 07,44 say nTotalB             picture '@e 99999.99'

@ 08,01 say '3'
@ 08,06 say cProdutoC           picture '@!'       
@ 08,28 say nQuantidadeC        picture '999.99'   
@ 08,36 say nPrecoC             picture '@e 999.99'
@ 08,44 say nTotalC             picture '@e 99999.99'

@ 09,01 say '---------------------------------------------------'

@ 10,35 say 'TOTAL'
@ 11,35 say 'LIMITE'
@ 10,44 say nTotalFinal         picture '@e 99999.99'
if nLimite >= 0
    cCor := 'g/gr'
else
    cCor := 'r/gr'
endif
@ 11,44 say nLimite             picture '@e 99999.99'    color cCor

@ 12,01 say 'Inoformacao de venda'
@ 13,01 say 'Cliente: ' + AllTrim( cNomeCliente )
@ 14,01 say 'Idade: ' + AllTrim( str( nIdadeCliente ) )
@ 15,01 say 'Local de entrega: ' + AllTrim( cEndereco )
@ 16,01 say 'Numero: ' + AllTrim( str( nNumeroCasa ) )
@ 17,01 say 'Complemento: ' + cComplemento
@ 18,01 say 'Data estimada de entrega: ' + DToC( dEntrega )

@ 20,01 say 'Pagar ate: ' + DToC( dVencimento )
@ 18,44 say 'LOGO'  color 'r/gr'

@ 22,01 say ''