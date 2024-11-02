set date brit
set epoch to 1940

clear

nValorA     := 0
nValorB     := 0
nValorC     := 0
dDataCompra := Date()

nQuantidadeA := 0
nQuantidadeB := 0
nQuantidadeC := 0

cProdutoA:= Space(10)
cProdutoB:= Space(10)
cProdutoC:= Space(10)

dAtual           := Date()
dLimitePagamento := Date() + 30

@ 01,02 say 'Data da compra: '
@ 01,17 say nAtual

@ 03,02 say 'Produtos'
@ 03,15 say 'Valor'
@ 03,26 say 'Qtd'

@ 04,02 get cProdutoA       picture '@!'        valid !Empty(cProdutoA)
@ 04,14 get nValorA         picture '@e 999.99' valid nValorA >= 0 .and. !Empty(nValorA)
@ 04,25 get nQuantidadeA    picture "@e 999"    valid nQuantidadeA >= 0
@ 05,02 get cProdutoB       picture '@!'        valid !Empty(cProdutoB)
@ 05,14 get nValorB         picture '@e 999.99' valid nValorB >= 0 .and. !Empty(nValorB)
@ 05,25 get nQuantidadeB    picture "@e 999"    valid nQuantidadeB >= 0
@ 06,02 get cProdutoC       picture '@!'        valid !Empty(cProdutoC)
@ 06,14 get nValorC         picture '@e 999.99' valid nValorC >= 0 .and. !Empty(nValorC)
@ 06,25 get nQuantidadeC    picture "@e 999"    valid nQuantidadeC >= 0
read

nTotalA := nValorA * nQuantidadeA
nTotalB := nValorB * nQuantidadeB
nTotalC := nValorC * nQuantidadeC
nTotalFinal := nTotalA + nTotalB + nTotalC

@ 03,32 say 'TOTAL'

@ 04,27 say ' = ' + Transform(nTotalA, "@e 9999.99") 
@ 05,27 say ' = ' + Transform(nTotalB, "@e 9999.99")
@ 06,27 say ' = ' + Transform(nTotalC, "@e 9999.99")
@ 07,02 say '-----------------------------------'
@ 08,02 say 'Valor Total dos produtos'
@ 08,30 say nTotalFinal picture "@e 9999.99"
@ 10,02 say 'Desconto'

nDesconto := 0
@ 10,30 get nDesconto   picture "@e 9999.99"
read

@ 11,02 say 'Valor total' // + Transform(nDesconto, "@e 9999.99")
                          // o Transform possibilita substitui a criar uma nova linha somente para colocar picture numa variavel
@ 11,30 say nTotalFinal - nDesconto   picture "@e 9999.99"

@ 13,02 say 'Data vencimento: ' + DToC(dLimitePagamento)
