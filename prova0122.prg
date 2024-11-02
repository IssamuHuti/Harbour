// Lucas Issamu Morino Yamahuti

set epoch to 1940
set date brit 

clear 

cEscola          := Space(20)
cEndereco        := Space(30)
nNumEndereco     := 0

cDiciplina1      := Space(15)
cDiciplina2      := Space(15)
cDiciplina3      := Space(15)
cNomeAluno       := Space(40)
dNascimento      := CToD('')
cCurso           := Space(20)
nSerie           := 0
nMensalidade     := 0
nNota11          := 0
nNota12          := 0
nNota13          := 0
nNota14          := 0
nNota21          := 0
nNota22          := 0
nNota23          := 0
nNota24          := 0
nNota31          := 0
nNota32          := 0
nNota33          := 0
nNota34          := 0
nFrequencia11    := 0
nFrequencia12    := 0
nFrequencia13    := 0
nFrequencia14    := 0
nFrequencia21    := 0
nFrequencia22    := 0
nFrequencia23    := 0
nFrequencia24    := 0
nFrequencia31    := 0
nFrequencia32    := 0
nFrequencia33    := 0
nFrequencia34    := 0
lAprovado1       := .t.
lAprovado2       := .t.
lAprovado3       := .t.
// cPeriodo         := ' '


@ 01,01 say 'Escola: '
@ 02,01 say 'Endereco:'
@ 03,01 say 'Numero endereco:'
@ 05,01 say 'Nome aluno:'
@ 06,01 say 'Data de nascimento:'
@ 07,01 say 'Curso:'
@ 08,01 say 'Serie:'
@ 09,01 say 'Mensalidade:'
// @ 10,01 say 'Periodo:'

@ 01,08 get cEscola         picture '@!'            valid !Empty( cEscola )
@ 02,10 get cEndereco       picture '@!'            valid !Empty( cEndereco )
@ 03,17 get nNumEndereco    picture '9999'          valid !Empty( nNumEndereco ) .and. nNota11 >= 0
@ 05,12 get cNomeAluno      picture '@!'            valid !Empty( cNomeAluno )
@ 06,20 get dNascimento                             valid !Empty( dNascimento )
@ 07,07 get cCurso          picture '@!'            valid !Empty( cCurso )
@ 08,07 get nSerie          picture '9'             valid !Empty( nSerie ) .and. nNota11 >= 0
@ 09,13 get nMensalidade    picture '@e 9999.99'    valid !Empty( nMensalidade ) .and. nMensalidade >= 0
// @ 10,09 get cPeriodo        picture '@!'            valid !Empty( cPeriodo ) .and. (cPeriodo == 'M') .and. (cPeriodo == 'V') .and. (cPeriodo == 'N')
read 

@ 12,01 say 'MATERIA'
@ 11,17 say '1 BIMESTRE'
@ 11,30 say '2 BIMESTRE'
@ 11,43 say '3 BIMESTRE'
@ 11,56 say '4 BIMESTRE'
@ 12,17 say 'NOTA'
@ 12,22 say 'FALTAS'
@ 12,30 say 'NOTA'
@ 12,35 say 'FALTAS'
@ 12,43 say 'NOTA'
@ 12,48 say 'FALTAS'
@ 12,56 say 'NOTA'
@ 12,61 say 'FALTAS'
@ 12,70 say 'MEDIA'

@ 13,01 get cDiciplina1     picture '@!'    valid !Empty( cDiciplina1 )
@ 13,17 get nNota11         picture '999'   valid (nNota11 >= 0) .and. (nNota11 <= 100)
@ 13,22 get nFrequencia11   picture '99'    valid (nFrequencia11 >= 0) .and. (nFrequencia11 <= 60)
@ 13,30 get nNota12         picture '999'   valid (nNota12 >= 0) .and. (nNota12 <= 100)
@ 13,35 get nFrequencia12   picture '99'    valid (nFrequencia12 >= 0) .and. (nFrequencia12 <= 60)
@ 13,43 get nNota13         picture '999'   valid (nNota13 >= 0) .and. (nNota13 <= 100)
@ 13,48 get nFrequencia13   picture '99'    valid (nFrequencia13 >= 0) .and. (nFrequencia13 <= 60)
@ 13,56 get nNota14         picture '999'   valid (nNota14 >= 0) .and. (nNota14 <= 100)
@ 13,61 get nFrequencia14   picture '99'    valid (nFrequencia14 >= 0) .and. (nFrequencia14 <= 60)
read
nMedia1 := (nNota11 + nNota12 + nNota13 + nNota14) / 4  color 'g/'
if nMedia1 < 60 .and. nSerie <= 4
    @ 13,65 say nMedia1 color 'r/'
endif

if nMedia1 < 70 .and. nSerie >= 5
    @ 13,65 say nMedia1 color 'r/'
endif
// if nSerie <= 4
//     if nMedia1 >= 60
//         @ 13,65 say nMedia1 color 'g/'
//     else
//         @ 13,65 say nMedia1 color 'r/'
//     endif
// else
//     if nMedia1 >= 70
//         @ 13,65 say nMedia1 color 'g/'
//     else
//         @ 13,65 say nMedia1 color 'r/'     
//     endif 
// endif
lValidacaoFalta13 := (nFrequencia11 <= 6) .and. (nFrequencia12 <= 6) .and. (nFrequencia13 <= 6) .and. (nFrequencia14 <= 6)
lValidacaoFalta14 := (nFrequencia11 <= 8) .and. (nFrequencia12 <= 8) .and. (nFrequencia13 <= 8) .and. (nFrequencia14 <= 8)

if nSerie <= 3 .and. lValidacaoFalta13 .and. (nMedia1 >= 60)
    lAprovado1 := .f.
endif
if nSerie <= 4 .and. lValidacaoFalta14 .and. (nMedia1 >= 60)
    lAprovado1 := .f.
endif
if nSerie <= 4 .and. lValidacaoFalta14 .and. (nMedia1 >= 70)
    lAprovado1 := .f.
endif

@ 14,01 get cDiciplina2     picture '@!'    valid !Empty( cDiciplina2 )
@ 14,17 get nNota21         picture '999'   valid (nNota21 >= 0) .and. (nNota21 <= 100)
@ 14,22 get nFrequencia21   picture '99'    valid (nFrequencia21 >= 0) .and. (nFrequencia21 <= 60)
@ 14,30 get nNota22         picture '999'   valid (nNota22 >= 0) .and. (nNota22 <= 100)
@ 14,35 get nFrequencia22   picture '99'    valid (nFrequencia22 >= 0) .and. (nFrequencia22 <= 60)
@ 14,43 get nNota23         picture '999'   valid (nNota23 >= 0) .and. (nNota23 <= 100)
@ 14,48 get nFrequencia23   picture '99'    valid (nFrequencia23 >= 0) .and. (nFrequencia23 <= 60)
@ 14,56 get nNota24         picture '999'   valid (nNota24 >= 0) .and. (nNota24 <= 100)
@ 14,61 get nFrequencia24   picture '99'    valid (nFrequencia24 >= 0) .and. (nFrequencia24 <= 60)
read 
nMedia2 := (nNota21 + nNota22 + nNota23 + nNota24) / 4  color 'g/'
@ 14,65 say nMedia2
if nMedia2 < 60 .and. nSerie <= 4
    @ 14,65 say nMedia2 color 'r/'
endif

if nMedia2 < 70 .and. nSerie >= 5
    @ 14,65 say nMedia2 color 'r/'
endif

lValidacaoFalta13 := (nFrequencia11 <= 6) .and. (nFrequencia12 <= 6) .and. (nFrequencia13 <= 6) .and. (nFrequencia14 <= 6)
lValidacaoFalta14 := (nFrequencia11 <= 8) .and. (nFrequencia12 <= 8) .and. (nFrequencia13 <= 8) .and. (nFrequencia14 <= 8)

if nSerie <= 3 .and. lValidacaoFalta13 .and. (nMedia1 >= 60)
    lAprovado1 := .f.
endif
if nSerie <= 4 .and. lValidacaoFalta14 .and. (nMedia1 >= 60)
    lAprovado1 := .f.
endif
if nSerie <= 4 .and. lValidacaoFalta14 .and. (nMedia1 >= 70)
    lAprovado1 := .f.
endif

// if nSerie <= 3
//     if (nFrequencia21 <= 6) .and. (nFrequencia22 <= 6) .and. (nFrequencia23 <= 6) .and. (nFrequencia24 <= 6) .and. (nMedia2 >= 60)
//         lAprovado2 := .t.
//     else
//         lAprovado2 := .f.
//     endif
// elseif nSerie <= 4
//     if (nFrequencia21 <= 8) .and. (nFrequencia22 <= 8) .and. (nFrequencia23 <= 8) .and. (nFrequencia24 <= 8) .and. (nMedia2 >= 60)
//         lAprovado2 := .t.
//     else
//         lAprovado2 := .f.
//     endif
// else
//     if (nFrequencia21 <= 8) .and. (nFrequencia22 <= 8) .and. (nFrequencia23 <= 8) .and. (nFrequencia24 <= 8) .and. (nMedia2 >= 70)
//         lAprovado2 := .t.
//     else
//         lAprovado2 := .f.
//     endif
// endif

@ 15,01 get cDiciplina3     picture '@!'    valid !Empty( cDiciplina3 )
@ 15,17 get nNota31         picture '999'   valid (nNota31 >= 0) .and. (nNota31 <= 100)
@ 15,22 get nFrequencia31   picture '99'    valid (nFrequencia31 >= 0) .and. (nFrequencia31 <= 60)
@ 15,30 get nNota32         picture '999'   valid (nNota32 >= 0) .and. (nNota32 <= 100)
@ 15,35 get nFrequencia32   picture '99'    valid (nFrequencia32 >= 0) .and. (nFrequencia32 <= 60)
@ 15,43 get nNota33         picture '999'   valid (nNota33 >= 0) .and. (nNota33 <= 100)
@ 15,48 get nFrequencia33   picture '99'    valid (nFrequencia33 >= 0) .and. (nFrequencia33 <= 60)
@ 15,56 get nNota34         picture '999'   valid (nNota34 >= 0) .and. (nNota34 <= 100)
@ 15,61 get nFrequencia34   picture '99'    valid (nFrequencia34 >= 0) .and. (nFrequencia34 <= 60)
read
nMedia3 := (nNota31 + nNota32 + nNota33 + nNota34) / 4
@ 15,65 say nMedia3
if nMedia3 < 60 .and. nSerie <= 4
    @ 15,65 say nMedia3 color 'r/'
endif

if nMedia3 < 70 .and. nSerie >= 5
    @ 15,65 say nMedia3 color 'r/'
endif

if nSerie <= 3
    if (nFrequencia31 <= 6) .and. (nFrequencia32 <= 6) .and. (nFrequencia33 <= 6) .and. (nFrequencia34 <= 6) .and. (nMedia3 >= 60)
        lAprovado3 := .t.
    else
        lAprovado3 := .f.
    endif
elseif nSerie <= 4
    if (nFrequencia31 <= 8) .and. (nFrequencia32 <= 8) .and. (nFrequencia33 <= 8) .and. (nFrequencia34 <= 8) .and. (nMedia3 >= 60)
        lAprovado3 := .t.
    else
        lAprovado3 := .f.
    endif
else
    if (nFrequencia31 <= 8) .and. (nFrequencia32 <= 8) .and. (nFrequencia33 <= 8) .and. (nFrequencia34 <= 8) .and. (nMedia3 >= 70)
        lAprovado3 := .t.
    else
        lAprovado3 := .f.
    endif
endif

nAcrescimo := 0
if lAprovado1
    @ 17,01 say 'Na materia ' + AllTrim(cDiciplina1) + ' foi aprovado'
else
    @ 17,01 say 'Na materia ' + AllTrim(cDiciplina1) + ' foi Reprovado'
    nAcrescimo := nAcrescimo + 20
endif
if lAprovado2
    @ 18,01 say 'Na materia ' + AllTrim(cDiciplina2) + ' foi aprovado'
else
    @ 18,01 say 'Na materia ' + AllTrim(cDiciplina2) + ' foi Reprovado'
    nAcrescimo := nAcrescimo + 20
endif
if lAprovado3
    @ 19,01 say 'Na materia ' + AllTrim(cDiciplina3) + ' foi aprovado'
else
    @ 19,01 say 'Na materia ' + AllTrim(cDiciplina3) + ' foi Reprovado'
    nAcrescimo := nAcrescimo + 20
endif

nNovaMensalidade := 0
nNovaMensalidade := nMensalidade * (100 + nAcrescimo) / 100

@ 21,01 say 'A partir do proximo ano' + AllTrim(cNomeAluno) + ' sera aluno do ' + str(nSerie + 1) + ' Serie'
if nNovaMensalidade == nMensalidade
    @ 22,01 say 'A mensalidade para o proximo ano sera o mesmo desse ano de ' + str(nMensalidade) + ' reais'
else
    @ 22,01 say 'A mensalidade para o proximo ano sera de' + str(nNovaMensalidade) + ' reais'
endif
if (lAprovado1 == .t.) .and. (lAprovado2 == .t.) .and. (lAprovado3 == .t.)
    @ 23,01 say 'Aprovado sem nenhuma reprovacao no ano'
elseif (lAprovado1 == .t.) .and. (lAprovado2 == .t.) .and. (lAprovado3 == .f.)
    @ 23,01 say 'Aprovado com dependencia na materia ' + AllTrim(cDiciplina3)
elseif (lAprovado1 == .t.) .and. (lAprovado2 == .f.) .and. (lAprovado3 == .t.)
    @ 23,01 say 'Aprovado com dependencia na materia ' + AllTrim(cDiciplina2)
elseif (lAprovado1 == .f.) .and. (lAprovado2 == .t.) .and. (lAprovado3 == .t.)
    @ 23,01 say 'Aprovado com dependencia na materia ' + AllTrim(cDiciplina1)
elseif (lAprovado1 == .f.) .and. (lAprovado2 == .f.) .and. (lAprovado3 == .t.)
    @ 23,01 say 'Aprovado com dependencia na materia ' + AllTrim(cDiciplina1) + ' e ' + AllTrim(cDiciplina2)
elseif (lAprovado1 == .f.) .and. (lAprovado2 == .t.) .and. (lAprovado3 == .f.)
    @ 23,01 say 'Aprovado com dependencia na materia ' + AllTrim(cDiciplina1) + ' e ' + AllTrim(cDiciplina3)
elseif (lAprovado1 == .t.) .and. (lAprovado2 == .f.) .and. (lAprovado3 == .f.)
    @ 23,01 say 'Aprovado com dependencia na materia ' + AllTrim(cDiciplina2) + ' e ' + AllTrim(cDiciplina3)
else
    @ 23,01 say 'Reprovado de serie, repetira a serie no proximo ano'
endif

// criar uma variaval que conta quantidade de dependencias
