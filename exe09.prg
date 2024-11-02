set epoch to 1940
set date brit

clear 

cNome       := Space(1) // quantidade de dígitos que vai ser inclusa
dAleatorio  := CToD('')
nInteiro    := 0
nDecimal    := 0
cString     := Space(10)

@ 01,01 say 'Nome:'
@ 02,01 say 'Data:'
@ 03,01 say 'Numero inteiro:'
@ 04,01 say 'Numero decimal:'
@ 05,01 say 'Digite aqui:'

@ 01,08 get cNome       picture '@!'        valid !Empty(cNome) // '@!' deixa os caracteres maiúsculos
                                                            // valid !Empty(cNome) não deixa passar se deixar o campo vazio
@ 02,08 get dAleatorio                      valid dAleatorio <= Date()
@ 03,16 get nInteiro    picture '99'        valid nInteiro >= 0
@ 04,16 get nDecimal    picture '@e 99.99'  
@ 05,13 get cString     picture '@!'        valid !Empty(cString)
read 

clear

@ 01,01 say 'Letra:'
@ 02,01 say 'Data:'
@ 03,01 say 'Numero inteiro:'
@ 04,01 say 'Numero decimal:'
@ 05,01 say 'Digite aqui:'

@ 01,16 say cNome
@ 02,16 say dAleatorio 
@ 03,16 say nInteiro 
@ 04,16 say nDecimal
@ 05,16 say cString 

@ 06,01 say ''