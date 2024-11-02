clear

@ 00,00 to 08,31 double 

@ 01,01 say 'CATEGORIA'
@ 02,01 say '------------------------------'
@ 03,01 say 'INFANTIL A'
@ 03,13 say '5 - 7 anos'
@ 04,01 say 'INFANTIL B'
@ 04,13 say '8 - 10 anos'
@ 05,01 say 'JUVENIL A'
@ 05,13 say '11 - 13 anos'
@ 06,01 say 'JUVENIL B'
@ 06,13 say '14 - 17 anos'
@ 07,01 say 'SENIOR'
@ 07,13 say 'Maiores de 18 anos'

cNadador    := Space(20)
nIdade      := 0
cCategoria  := Space(10)

@ 01,34 say 'Atleta:'
@ 02,34 say 'Idade :'

@ 01,41 get cNadador    picture '@!'    valid !Empty(cNadador)
@ 02,41 get nIdade      picture '999'   valid nIdade >= 0
read

@ 00,33 clear to 08,66

if nIdade < 5
    cCategoria := 'nao sabe nadar'
elseif nIdade <= 7
    cCategoria := 'infantil A'
elseif nIdade <= 10
    cCategoria := 'infantil B'
elseif nIdade <= 13
    cCategoria := 'juvenil A'
elseif nIdade <= 17
    cCategoria := 'juvenil B'
else
    cCategoria := 'senior'
endif

@ 01,34 say 'Atleta:'
@ 02,34 say 'Idade :'

@ 01,42 say AllTrim( cNadador )
@ 02,42 say AllTrim( str( nIdade ) )
if nIdade < 5
    @ 04,34 say AllTrim( cNadador ) + ' ' +AllTrim( cCategoria )
else
    @ 04,34 say AllTrim( cNadador ) + ' esta na categoria ' + cCategoria
endif 

@ 09,01 say ''