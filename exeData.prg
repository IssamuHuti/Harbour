set epoch to 1940
set date brit

clear 

dDigitado   := CToD('')

@ 01,01 say 'Digite uma data:'
@ 01,17 get dDigitado     valid !Empty( dDigitado )
read

nAno        := Year(dDigitado)
nMes        := Month(dDigitado)
nDia        := Day(dDigitado)
nDiaSemana  := DoW(dDigitado)
cMes        := Space(10)
cDiaSemana  := Space(20)

if nMes == 1
    cMes := 'Janeiro'
elseif nMes == 2
    cMes := 'Fevereiro'
elseif nMes == 3
    cMes := 'Marco'
elseif nMes == 4
    cMes := 'Abril'
elseif nMes == 5
    cMes := 'Maio'
elseif nMes == 6
    cMes := 'Junho'
elseif nMes == 7
    cMes := 'Julho'
elseif nMes == 8
    cMes := 'Agosto'
elseif nMes == 9
    cMes := 'Setembro'
elseif nMes == 10
    cMes := 'Outubro'
elseif nMes == 11
    cMes := 'Novembro'
elseif nMes == 12
    cMes := 'Dezembro'
endif

if nDiaSemana == 1
    cDiaSemana  := 'Domingo'
elseif nDiaSemana == 2
    cDiaSemana  := 'Segunda-feira'
elseif nDiaSemana == 3
    cDiaSemana  := 'Terca-feira'
elseif nDiaSemana == 4
    cDiaSemana  := 'Quarta-feira'
elseif nDiaSemana == 5
    cDiaSemana  := 'Quinta-feira'
elseif nDiaSemana == 6
    cDiaSemana  := 'Sexta-feira'
elseif nDiaSemana == 7
    cDiaSemana  := 'Sabado'
endif

@ 02,01 say 'Maringa, ' + AllTrim(str(nDia)) + ' de ' + cMes + ' de ' + AllTrim(str(nAno)) + '. (' + cDiaSemana + ')'    picture '@!'