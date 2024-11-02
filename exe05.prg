clear

nVariavelA := 0
nVariavelB := 0

@ 00,01 to 10,33 double // cria uma tabela nessas medidas estabelecidas

@ 01,02 say 'Valores iniciais'
@ 02,02 say 'Valor do Variavel A = '
@ 03,02 say 'Valor do Variavel B = '

@ 02,23 get nVariavelA // get captura valor digitado pelo usuario
@ 03,23 get nVariavelB
read // para cada bloco de gets, inserir um read, e trava a execução do sistema até informar um valor

@05,02 say 'Trocando ...'

nVariavelTroca  := nVariavelA
nVariavelA      := nVariavelB
nVariavelB      := nVariavelTroca

@ 07,02 say 'Valores trocados'
@ 08,02 say 'Valor do Variavel A = ' + AllTrim( str( nVariavelA ) )
@ 09,02 say 'Valor do Variavel B = ' + AllTrim( str( nVariavelB ) )
@ 10,02 say ''

// segunda versão

@ 00,34 to 10,66 double

@ 01,35 say 'Valores iniciais'
@ 02,35 say 'Valor do Variavel A = ' + AllTrim( str( nVariavelA ) )
@ 03,35 say 'Valor do Variavel B = ' + AllTrim( str( nVariavelB ) )

@ 05,35 say 'Trocando ...'

nVariavelB := nVariavelA + nVariavelB
nVariavelA := nVariavelB - nVariavelA
nVariavelB := nVariavelB - nVariavelA

@ 07,35 say 'Valores trocados'
@ 08,35 say 'Valor do Variavel A = ' + AllTrim( str( nVariavelA ) )
@ 09,35 say 'Valor do Variavel B = ' + AllTrim( str( nVariavelB ) )
@ 10,35 say ''

nVariavelTeste := 0

@ 12,01 say 'Digite um valor: '

@ 12,18 get nVariavelTeste // segundo variavel
read // prepara outra parada
@ 13,01 say ''