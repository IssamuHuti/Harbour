set epoch to 1940
set date brit

clear

dProva    := CToD('')
nNota1    := 0
nNota2    := 0
nNota3    := 0
cEstudante1 := Space(10)
cEstudante2 := Space(10)
cEstudante3 := Space(10)

@ 01,01 say 'Data da prova:'
@ 03,11 say 'NOME'
@ 03,25 say 'ACERTOS'
@ 04,01 say 'Estudante:'
@ 05,01 say 'Estudante:'
@ 06,01 say 'Estudante:'

@ 01,20 get dProva                         valid dProva <= Date()
@ 04,11 get cEstudante1    picture '@!'    valid !Empty( cEstudante1 )
@ 04,25 get nNota1         picture '999'   valid nNota1 > 0
@ 05,11 get cEstudante2    picture '@!'    valid !Empty( cEstudante2 )
@ 05,25 get nNota2         picture '999'   valid nNota2 > 0
@ 06,11 get cEstudante3    picture '@!'    valid !Empty( cEstudante3 )
@ 06,25 get nNota3         picture '999'   valid nNota3 > 0
read 

cMelhorAluno := Space(10)
nMaiorNota := 0
if nNota1 > nNota2 .and. nNota1 > nNota3
    cMelhorAluno := cEstudante1
    nMaiorNota := nNota1
elseif nNota2 > nNota1 .and. nNota2 > nNota3
    cMelhorAluno := cEstudante2
    nMaiorNota := nNota2
else 
    cMelhorAluno := cEstudante3
    nMaiorNota := nNota3
endif

@ 08,01 say 'O estudante com maior nota e ' + AllTrim( cMelhorAluno ) + ' com ' + AllTrim( str( nMaiorNota ) ) + ' acertos'
