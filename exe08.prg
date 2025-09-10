clear 
set epoch to 1940
set date british
set scoreboard off
SetMode (25,80)

// cProdutoA := Space(10)
// cProdutoB := Space(10)
// cProdutoC := Space(10)
// cCliente  := Space(35)
// nPrecoA  := 0
// nPrecoB  := 0
// nPrecoC  := 0

// nQtdA    := 0
// nQtdB    := 0
// nQtdC    := 0
// nIdade   := 0

// @ 00,00 to 12,48

// @ 01,19 say 'FATURAMENTO'
// @ 02,01 say Replicate('-', 47)
// @ 03,01 say 'Cliente:'

// @ 03,09 get cCliente picture '@!' valid !Empty(cCliente)
// read

// @ 04,01 say Replicate('-', 47)
// @ 05,03 say 'PRODUTO'
// @ 05,14 say 'Valor Unit'
// @ 05,28 say 'QTD'
// @ 05,35 say 'Valor Total'
// @ 06,01 say Replicate('-', 47)
// @ 07,01 say '           | R$         |      |               '
// @ 08,01 say '           | R$         |      |               '
// @ 09,01 say '           | R$         |      |               '
// @ 10,01 say Replicate('-', 47)
// @ 11,27 say 'TOTAL  R$'

// @ 07,02 get cProdutoA   picture '@!'        valid !Empty(cProdutoA)
// @ 07,19 get nPrecoA     picture '@E 999.99' valid !Empty(nPrecoA)   .and. nPrecoA >= 0
// @ 07,26 get nQtdA       picture '@E 999.99' valid nQtdA   >= 0
// read 

// nTotalA := nQtdA * nPrecoA
// nTotalCompra := nTotalA

// @ 07,34 say 'R$'
// @ 07,37 say nTotalA picture '@E 999,999.99'
// @ 11,37 say nTotalCompra picture '@E 999,999.99'

// @ 08,02 get cProdutoB   picture '@!'        valid !Empty(cProdutoB)
// @ 08,19 get nPrecoB     picture '@E 999.99' valid !Empty(nPrecoB)   .and. nPrecoB >= 0
// @ 08,26 get nQtdB       picture '@E 999.99' valid nQtdB >= 0
// read 

// nTotalB := nQtdB * nPrecoB
// nTotalCompra := nTotalCompra + nTotalB
// @ 08,34 say 'R$'
// @ 08,37 say nTotalB picture '@E 999,999.99'
// @ 11,37 say nTotalCompra picture '@E 999,999.99'

// @ 09,02 get cProdutoC   picture '@!'        valid !Empty(cProdutoC)
// @ 09,19 get nPrecoC     picture '@E 999.99' valid !Empty(nPrecoC)   .and. nPrecoC >= 0
// @ 09,26 get nQtdC       picture '@E 999.99' valid nQtdC >= 0
// read 

// nTotalC := nQtdC * nPrecoC
// nTotalCompra := nTotalCompra + nTotalC
// @ 09,34 say 'R$'
// @ 09,37 say nTotalC picture '@E 999,999.99'
// @ 11,37 say nTotalCompra picture '@E 999,999.99'

// Inkey(0)

// @ 00,00 clear to 12,48
// @ 00,00 to 12,48 double

// @ 01,19 say 'FATURAMENTO'
// @ 02,01 say Replicate('-', 47)
// @ 03,01 say 'Cliente:'
// @ 03,09 say cCliente
// @ 04,01 say Replicate('-', 47)
// @ 05,03 say 'PRODUTO'
// @ 05,14 say 'Valor Unit'
// @ 05,28 say 'QTD'
// @ 05,35 say 'Valor Total'
// @ 06,01 say Replicate('-', 47)
// @ 07,01 say '           | R$         |      |               '
// @ 08,01 say '           | R$         |      |               '
// @ 09,01 say '           | R$         |      |               '
// @ 10,01 say Replicate('-', 47)
// @ 11,27 say 'TOTAL  R$'
// @ 07,02 say cProdutoA   
// @ 07,19 say nPrecoA     
// @ 07,26 say nQtdA       
// @ 08,02 say cProdutoB   
// @ 08,19 say nPrecoB     
// @ 08,26 say nQtdB       
// @ 09,02 say cProdutoC   
// @ 09,19 say nPrecoC     
// @ 09,26 say nQtdC       
// @ 07,34 say 'R$'
// @ 07,37 say nTotalA         picture '@E 999,999.99'
// @ 08,34 say 'R$'
// @ 08,37 say nTotalB         picture '@E 999,999.99'
// @ 09,34 say 'R$'
// @ 09,37 say nTotalC         picture '@E 999,999.99'
// @ 11,37 say nTotalCompra    picture '@E 999,999.99'

// @ 13,00 say ''

@ 00,00 to 20,50 double 

dNascimentoCliente  := CToD('')
dDataAtual          := Date()
dDataEntrega        := Date() + 7
cNomeCliente        := Space(40)
cEnderecoCliente    := Space(30)
cCidadeCliente      := Space(15)
cEstadoCliente      := Space(2)
nEnderecoNumero     := 0
nCep1               := 0
nCep2               := 0
nDDD                := 0
nTelefone1          := 0
nTelefone2          := 0
nTaxaEntrega        := 0
cProdutoA           := Space(10)
cProdutoB           := Space(10)
cProdutoC           := Space(10)
nPrecoA             := 0
nPrecoB             := 0
nPrecoC             := 0
nPrecoTotal         := 0
nQtdA               := 0
nQtdB               := 0
nQtdC               := 0

@ 01,20 say 'FATURAMENTO'
@ 02,01 say Replicate('-', 48)
@ 03,03 say 'Produto'
@ 03,14 say 'Preco Unit'
@ 03,28 say 'Qtd'
@ 03,35 say 'Valor Total'
@ 04,01 say Replicate('-', 48)
@ 05,01 say '           | R$         |      |R$             '
@ 06,01 say '           | R$         |      |R$             '
@ 07,01 say '           | R$         |      |R$             '
@ 08,01 say Replicate('-', 48)
@ 09,28 say 'TOTAL'

@ 05,02 get cProdutoA   picture '@!'        valid !Empty(cProdutoA)
@ 05,19 get nPrecoA     picture '@E 999.99' valid !Empty(nPrecoA) .and. nPrecoA >= 0
@ 05,26 get nQtdA       picture '@E 999.99' valid !Empty(nQtdA)   .and. nQtdA >= 0
read 

nTotalA := nPrecoA * nQtdA
nPrecoTotal := nPrecoTotal + nTotalA
@ 05,37 say nTotalA     picture '@E 999,999.99'
@ 09,37 say nTotalA     picture '@E 999,999.99'

@ 06,02 get cProdutoB   picture '@!'        valid !Empty(cProdutoB)
@ 06,19 get nPrecoB     picture '@E 999.99' valid !Empty(nPrecoB) .and. nPrecoB >= 0
@ 06,26 get nQtdB       picture '@E 999.99' valid !Empty(nQtdB)   .and. nQtdB >= 0
read 

nTotalB := nPrecoB * nQtdB
nPrecoTotal := nPrecoTotal + nTotalB
@ 06,37 say nTotalB     picture '@E 999,999.99'
@ 09,37 say nTotalB     picture '@E 999,999.99'

@ 07,02 get cProdutoC   picture '@!'        valid !Empty(cProdutoC)
@ 07,19 get nPrecoC     picture '@E 999.99' valid !Empty(nPrecoC) .and. nPrecoC >= 0
@ 07,26 get nQtdC       picture '@E 999.99' valid !Empty(nQtdC)   .and. nQtdC >= 0
read 

nTotalC := nPrecoC * nQtdC
nPrecoTotal := nPrecoTotal + nTotalC
@ 07,37 say nTotalC     picture '@E 999,999.99'
@ 09,37 say nTotalC     picture '@E 999,999.99'

Inkey(0)

@ 01,01 clear to 19,49
@ 01,10 say 'Dados Cliente'
@ 01,40 say dDataAtual
@ 02,01 say Replicate('-', 48)
@ 03,01 say 'Cliente :'
@ 04,01 say 'Endereco:'
@ 04,43 say 'n'
@ 05,01 say 'Cidade:'
@ 05,23 say 'Estado:'
@ 06,01 say 'CEP:     -'
@ 06,15 say 'Telefone: (  )      -'

@ 03,10 get cNomeCliente        picture '@!'    valid !Empty(cNomeCliente)
@ 04,10 get cEnderecoCliente    picture '@!'    valid !Empty(cEnderecoCliente)
@ 04,45 get nEnderecoNumero     picture '9999'  valid !Empty(nEnderecoNumero)
@ 05,08 get cCidadeCliente      picture '@!'    valid !Empty(cCidadeCliente)
@ 05,30 get cEstadoCliente      picture '@!'    valid !Empty(cEstadoCliente)
@ 06,05 get nCep1               picture '99999' valid !Empty(nCep1)
@ 06,11 get nCep2               picture '999'   valid !Empty(nCep2)
@ 06,26 get nDDD                picture '99'    valid !Empty(nDDD)
@ 06,30 get nTelefone1          picture '99999' valid !Empty(nTelefone1)
@ 06,36 get nTelefone2          picture '99999' valid !Empty(nTelefone2)
read

@ 08,01 say Replicate('-', 48)
@ 09,19 say 'Taxa de entrega'   picture '@!'
@ 10,01 say Replicate('-', 48)
@ 11,01 say 'Endereco de entrega'
@ 12,01 say cEnderecoCliente
@ 12,43 say 'n'
@ 12,45 say nEnderecoNumero
@ 13,01 say 'CEP:     -'
@ 13,05 say nCep1
@ 13,11 say nCep2
@ 15,01 say 'Data de compra  :'
@ 15,19 say dDataAtual
@ 16,01 say 'Prazo de entrega:'
@ 16,19 say dDataEntrega

nTaxaEntrega := nPrecoTotal * 0.01

@ 18,01 say 'Taxa de entrega: R$'
@ 18,21 say nTaxaEntrega    picture '@E 999,999.00'

Inkey(0)
