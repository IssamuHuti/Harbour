clear 

nCodigo := 0

@ 01,01 say 'CODIGO'
@ 01,08 say '| CLASSIFICACAO'
@ 02,01 say '----------------------------------------'

@ 03,01 say '1'
@ 03,08 say '| Alimentacao nao-perecivel'
@ 04,01 say '2 a 4'
@ 04,08 say '| Alimentacao perecivel'
@ 05,01 say '5 a 6'
@ 05,08 say '| Vestuario'
@ 06,01 say '7'
@ 06,08 say '| Higiene pessoal'
@ 07,01 say '8 a 15'
@ 07,08 say '| Limpeza e utensilios domesticos'

@ 09,01 say 'Digite o codigo do produto:'
@ 09,28 get nCodigo     picture '99'    valid !Empty(nCodigo) .and. nCodigo >= 1 .and. nCodigo <=15
read

@ 11,01 say 'Qual a classificacao do produto:'
if nCodigo == 1
    @ 11,34 say 'Alimentacao nao-perecivel'
elseif nCodigo <= 4
    @ 11,34 say 'Alimentacao perecivel'
elseif nCodigo <= 6
    @ 11,34 say 'Vestuario'
elseif nCodigo <= 7
    @ 11,34 say 'Higiene pessoal'
elseif nCodigo <= 15
    @ 11,34 say 'Limpeza e utensilios domesticos'
endif 
