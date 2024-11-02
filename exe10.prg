clear 

cPessoa := Space(20)
nIdade := 0

@ 01,01 say 'Nome :'
@ 02,01 say 'Idade:'
@ 01,07 get nIdade  picture '999'   valid nIdade >= 0
@ 02,07 get cPessoa picture '@!'    valid !Empty(cPessoa)
read 

if nIdade >= 21
    @ 03,01 say 'Nos EUA esta liberado beber alcool'
elseif nIdade < 21 
    @ 03,01 say 'Nos EUA esta proibido beber alcool'
endif

if nIdade >= 18
    @ 04,01 say 'No Brasil esta liberado beber alcool'
elseif nIdade < 21 
    @ 04,01 say 'No Brasil esta proibido beber alcool'
endif
