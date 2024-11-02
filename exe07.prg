Clear

nNumero1 := 0
nNumero2 := 0

@ 02,02 say 'Digite o primeiro numero: '
@ 03,02 say 'Digite o segundo numero : '

// picture funciona somente para variáveis do tipo número
@ 02,27 get nNumero1 picture '@e 9999999.99' // "@e" troca "." por ","
@ 03,27 get nNumero2 picture '@e 9999999.99' // 999999.99 limita a quantidade de dígitos que pode ser incluido, 
                                             // o "." serve para limitar quantidade de casas decimais depois da virgula
read 

nSoma           := nNumero1 + nNumero2
nSubtracao      := nNumero1 - nNumero2
nMultiplicacao  := nNumero1 * nNumero2
nDivisao        := nNumero1 / nNumero2

@ 05,20 say 'RESULTADO'
@ 06,02 say 'Operacao com "+": ' // + str( nSoma, 0, 2 ) não é possível substituir "." por "," mesmo se informar picture dentro do str
@ 06,20 say nSoma                 picture '@e 9999999.99'
@ 07,02 say 'Operacao com "-": '    
@ 07,20 say nSubtracao            picture '@e 9999999.99'
@ 08,02 say 'Operacao com "*": '
@ 08,20 say nMultiplicacao        picture '@e 9999999.99'
@ 09,02 say 'Operecao com "/": '
@ 09,20 say nDivisao              picture '@e 9999999.99'
@ 10,02 say ''
