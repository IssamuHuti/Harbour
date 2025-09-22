// Lucas Issamu Morino Yamahuti

set scoreboard off
set epoch to 1940
set date british
SetMode (25,80)

clear

cInstituicaoEstudo  := 'Instituto SG'
cRuaInstituicao     := 'Rua Parana, 1556'
cCidadeInstituicao  := 'Maringa'
cEstadoInstituicao  := 'Parana'
cTelefone           := '(44) 3213-4573'
cNomeAluno          := Space(40)
dNascimentoAluno    := CToD('')
dDataBoletim        := Date()
nSerieAluno         := 0
nMensalidadeAluno   := 0
cPeriodo            := Space(1)
cDisciplina1        := Space(10)
cDisciplina2        := Space(10)
cDisciplina3        := Space(10)
nNotaBi11           := 0
nNotaBi12           := 0
nNotaBi13           := 0
nNotaBi14           := 0
nNotaBi21           := 0
nNotaBi22           := 0
nNotaBi23           := 0
nNotaBi24           := 0
nNotaBi31           := 0
nNotaBi32           := 0
nNotaBi33           := 0
nNotaBi34           := 0
nFaltaBi11          := 0
nFaltaBi12          := 0
nFaltaBi13          := 0
nFaltaBi14          := 0
nFaltaBi21          := 0
nFaltaBi22          := 0
nFaltaBi23          := 0
nFaltaBi24          := 0
nFaltaBi31          := 0
nFaltaBi32          := 0
nFaltaBi33          := 0
nFaltaBi34          := 0
lAprovadoDisc1      := .t.
lAprovadoDisc2      := .t.
lAprovadoDisc3      := .t.
lAprovadoAno        := .t.
cAprovadoDiscp1     := ''
cAprovadoDiscp2     := ''
cAprovadoDiscp3     := ''
cCorAprovado1       := 'g/'
cCorAprovado2       := 'g/'
cCorAprovado3       := 'g/'
nDependencias       := 0

@ 00,00 to 24,74
@ 01,01 say 'Instituicao:'          picture '@!'
@ 01,13 say cInstituicaoEstudo      picture '@!'
@ 02,01 say 'Rua:'                  picture '@!'
@ 02,05 say cRuaInstituicao         picture '@!'
@ 03,01 say 'Cidade:'               picture '@!'
@ 03,08 say cCidadeInstituicao      picture '@!'
@ 03,20 say 'Estado:'               picture '@!'
@ 03,28 say cEstadoInstituicao
@ 04,01 say Replicate('-', 73)
@ 05,01 say 'Aluno:'                picture '@!'
@ 06,01 say 'Data de nascimento:'   picture '@!'
@ 07,01 say 'Serie:'                picture '@!'
@ 07,10 say 'Periodo:'              picture '@!'
@ 08,01 say 'Mensalidade:'          picture '@!'
@ 09,01 say Replicate('-', 73)

@ 05,08 get cNomeAluno              picture '@!'            valid !Empty(cNomeAluno)
@ 06,20 get dNascimentoAluno                                valid !Empty(dNascimentoAluno)
@ 07,07 get nSerieAluno             picture '9'             valid !Empty(nSerieAluno) .and. nSerieAluno > 0 .and. nSerieAluno <= 8
@ 07,20 get cPeriodo                picture '@!'            valid !Empty(cPeriodo)
@ 08,14 get nMensalidadeAluno       picture '@E 99,999.99'  valid !Empty(nMensalidadeAluno) .and. nMensalidadeAluno > 0
read 

@ 10,01 say '            |1 Bimestre|2 Bimestre|3 Bimestre|4 Bimestre| media |aprovado'   picture '@!'
@ 11,01 say ' disciplina |nota|falta|nota|falta|nota|falta|nota|falta| nota  |        '   picture '@!'
@ 12,01 say '            |    |     |    |     |    |     |    |     |       |        '   picture '@!'
@ 13,01 say '            |    |     |    |     |    |     |    |     |       |        '   picture '@!'
@ 14,01 say '            |    |     |    |     |    |     |    |     |       |        '   picture '@!'
@ 15,01 say Replicate('-', 73)

@ 12,02 get cDisciplina1    picture '@!'    valid !Empty(cDisciplina1)
@ 12,15 get nNotaBi11       picture '999'   valid nNotaBi11 >= 0 .and. nNotaBi11 <= 100
@ 12,20 get nFaltaBi11      picture '99'    valid nFaltaBi11 >= 0 .and. nFaltaBi11 <= 60
@ 12,26 get nNotaBi12       picture '999'   valid nNotaBi12 >= 0 .and. nNotaBi12 <= 100
@ 12,31 get nFaltaBi12      picture '99'    valid nFaltaBi12 >= 0 .and. nFaltaBi12 <= 60
@ 12,37 get nNotaBi13       picture '999'   valid nNotaBi13 >= 0 .and. nNotaBi13 <= 100
@ 12,42 get nFaltaBi13      picture '99'    valid nFaltaBi13 >= 0 .and. nFaltaBi13 <= 60
@ 12,48 get nNotaBi14       picture '999'   valid nNotaBi14 >= 0 .and. nNotaBi14 <= 100
@ 12,53 get nFaltaBi14      picture '99'    valid nFaltaBi14 >= 0 .and. nFaltaBi14 <= 60
read 

nNotaMedia1 := (nNotaBi11 + nNotaBi12 + nNotaBi13 + nNotaBi14) / 4

if (nSerieAluno <= 4 .and. nNotaMedia1 < 60) .or. (nSerieAluno >= 5 .and. nNotaMedia1 < 70)
   cCorAprovado1   := 'r/'
   lAprovadoDisc1 :=.f.
endif

@ 12,60 say nNotaMedia1     picture '99'    color cCorAprovado1

if nSerieAluno <= 3
   if nFaltaBi11 > 6 .or. nFaltaBi12 > 6 .or. nFaltaBi13 > 6 .or. nFaltaBi14 > 6
      lAprovadoDisc1 :=.f.
   endif
else 
   if nFaltaBi11 > 8 .or. nFaltaBi12 > 8 .or. nFaltaBi13 > 8 .or. nFaltaBi14 > 8
      lAprovadoDisc1 :=.f.
   endif
endif

if lAprovadoDisc1 == .t.
   cAprovadoDiscp1 := '-'
else
   cAprovadoDiscp1 := 'DP'
   nDependencias++
endif

@ 12,67 say cAprovadoDiscp1

@ 13,02 get cDisciplina2    picture '@!'    valid !Empty(cDisciplina2)
@ 13,15 get nNotaBi21       picture '999'   valid nNotaBi21 >= 0 .and. nNotaBi21 <= 100
@ 13,20 get nFaltaBi21      picture '99'    valid nFaltaBi21 >= 0 .and. nFaltaBi21 <= 60
@ 13,26 get nNotaBi22       picture '999'   valid nNotaBi22 >= 0 .and. nNotaBi22 <= 100
@ 13,31 get nFaltaBi22      picture '99'    valid nFaltaBi22 >= 0 .and. nFaltaBi22 <= 60
@ 13,37 get nNotaBi23       picture '999'   valid nNotaBi23 >= 0 .and. nNotaBi23 <= 100
@ 13,42 get nFaltaBi23      picture '99'    valid nFaltaBi23 >= 0 .and. nFaltaBi23 <= 60
@ 13,48 get nNotaBi24       picture '999'   valid nNotaBi24 >= 0 .and. nNotaBi24 <= 100
@ 13,53 get nFaltaBi24      picture '99'    valid nFaltaBi24 >= 0 .and. nFaltaBi24 <= 60
read 

nNotaMedia2 := (nNotaBi21 + nNotaBi22 + nNotaBi23 + nNotaBi24) / 4

if (nSerieAluno <= 4 .and. nNotaMedia2 < 60) .or. (nSerieAluno >= 5 .and. nNotaMedia2 < 70)
   cCorAprovado2   := 'r/'
   lAprovadoDisc2  :=.f.
endif

@ 13,60 say nNotaMedia2     picture '99'    color cCorAprovado2

if nSerieAluno <= 3
   if nFaltaBi21 > 6 .or. nFaltaBi22 > 6 .or. nFaltaBi23 > 6 .or. nFaltaBi24 > 6
      lAprovadoDisc2 :=.f.
   endif
else 
   if nFaltaBi21 > 8 .or. nFaltaBi22 > 8 .or. nFaltaBi23 > 8 .or. nFaltaBi24 > 8
      lAprovadoDisc2 :=.f.
   endif
endif

if lAprovadoDisc2 == .t.
   cAprovadoDiscp2 := '-'
else
   cAprovadoDiscp2 := 'DP'
   nDependencias++
endif

@ 13,67 say cAprovadoDiscp2

@ 14,02 get cDisciplina3    picture '@!'    valid !Empty(cDisciplina3)
@ 14,15 get nNotaBi31       picture '999'   valid nNotaBi31 >= 0 .and. nNotaBi31 <= 100
@ 14,20 get nFaltaBi31      picture '99'    valid nFaltaBi31 >= 0 .and. nFaltaBi31 <= 60
@ 14,26 get nNotaBi32       picture '999'   valid nNotaBi32 >= 0 .and. nNotaBi32 <= 100
@ 14,31 get nFaltaBi32      picture '99'    valid nFaltaBi32 >= 0 .and. nFaltaBi32 <= 60
@ 14,37 get nNotaBi33       picture '999'   valid nNotaBi33 >= 0 .and. nNotaBi33 <= 100
@ 14,42 get nFaltaBi33      picture '99'    valid nFaltaBi33 >= 0 .and. nFaltaBi33 <= 60
@ 14,48 get nNotaBi34       picture '999'   valid nNotaBi34 >= 0 .and. nNotaBi34 <= 100
@ 14,53 get nFaltaBi34      picture '99'    valid nFaltaBi34 >= 0 .and. nFaltaBi34 <= 60
read 

nNotaMedia3 := (nNotaBi31 + nNotaBi32 + nNotaBi33 + nNotaBi34) / 4

if (nSerieAluno <= 4 .and. nNotaMedia3 < 60) .or. (nSerieAluno >= 5 .and. nNotaMedia3 < 70)
   cCorAprovado3   := 'r/'
   lAprovadoDisc3 :=.f.
endif

@ 14,60 say nNotaMedia3     picture '99'    color cCorAprovado3

if nSerieAluno <= 3
   if nFaltaBi31 > 6 .or. nFaltaBi32 > 6 .or. nFaltaBi33 > 6 .or. nFaltaBi34 > 6
      lAprovadoDisc3 :=.f.
   endif
else 
   if nFaltaBi31 > 8 .or. nFaltaBi32 > 8 .or. nFaltaBi33 > 8 .or. nFaltaBi34 > 8
      lAprovadoDisc3 :=.f.
   endif
endif

if lAprovadoDisc3 == .t.
   cAprovadoDiscp3 := '-'
else
   cAprovadoDiscp3 := 'DP'
   nDependencias++
endif

@ 14,67 say cAprovadoDiscp3

@ 15,01 say Replicate('-', 73)

Inkey(0)
clear

@ 00,00 to 24,74
@ 01,01 to 03,10
@ 01,50 say 'Data da entrega boletim'  picture '@!'
@ 02,57 say dDataBoletim
@ 02,04 say 'logo'                     picture '@!'
@ 01,12 say 'Instituicao:'             picture '@!'
@ 01,24 say cInstituicaoEstudo         picture '@!'
@ 02,12 say 'Rua:'                     picture '@!'
@ 02,17 say cRuaInstituicao            picture '@!'
@ 03,12 say 'Cidade:'                  picture '@!'
@ 03,21 say cCidadeInstituicao         picture '@!'
@ 03,32 say 'Estado:'                  picture '@!'
@ 03,40 say cEstadoInstituicao
@ 04,01 say Replicate('-', 73)
@ 05,01 say 'Aluno:'                   picture '@!'
@ 05,08 say cNomeAluno                 picture '@!'          
@ 06,01 say 'Data de nascimento:'      picture '@!'
@ 06,20 say dNascimentoAluno                              
@ 07,01 say 'Serie:'                   picture '@!'
@ 07,07 say nSerieAluno                picture '9'           
@ 07,10 say 'Periodo:'                 picture '@!'
@ 07,20 say cPeriodo                   picture '@!'          
@ 08,01 say 'Mensalidade:'             picture '@!'
@ 08,14 say nMensalidadeAluno          picture '@E 99,999.99'
@ 09,01 say Replicate('-', 73)
@ 10,01 say '            |1 Bimestre|2 Bimestre|3 Bimestre|4 Bimestre| media |aprovado'   picture '@!'
@ 11,01 say ' disciplina |nota|falta|nota|falta|nota|falta|nota|falta| nota  |        '   picture '@!'
@ 12,01 say '            |    |     |    |     |    |     |    |     |       |        '   picture '@!'
@ 13,01 say '            |    |     |    |     |    |     |    |     |       |        '   picture '@!'
@ 14,01 say '            |    |     |    |     |    |     |    |     |       |        '   picture '@!'
@ 15,01 say Replicate('-', 73)
@ 12,02 say cDisciplina1    picture '@!' 
@ 12,15 say nNotaBi11       picture '999'
@ 12,20 say nFaltaBi11      picture '99' 
@ 12,26 say nNotaBi12       picture '999'
@ 12,31 say nFaltaBi12      picture '99' 
@ 12,37 say nNotaBi13       picture '999'
@ 12,42 say nFaltaBi13      picture '99' 
@ 12,48 say nNotaBi14       picture '999'
@ 12,53 say nFaltaBi14      picture '99' 
@ 12,60 say nNotaMedia1     picture '99'    color cCorAprovado1
@ 12,67 say cAprovadoDiscp1
@ 13,02 say cDisciplina2    picture '@!' 
@ 13,15 say nNotaBi21       picture '999'
@ 13,20 say nFaltaBi21      picture '99' 
@ 13,26 say nNotaBi22       picture '999'
@ 13,31 say nFaltaBi22      picture '99' 
@ 13,37 say nNotaBi23       picture '999'
@ 13,42 say nFaltaBi23      picture '99' 
@ 13,48 say nNotaBi24       picture '999'
@ 13,53 say nFaltaBi24      picture '99' 
@ 13,60 say nNotaMedia2     picture '99'    color cCorAprovado2
@ 13,67 say cAprovadoDiscp2
@ 14,02 say cDisciplina3    picture '@!' 
@ 14,15 say nNotaBi31       picture '999'
@ 14,20 say nFaltaBi31      picture '99' 
@ 14,26 say nNotaBi32       picture '999'
@ 14,31 say nFaltaBi32      picture '99' 
@ 14,37 say nNotaBi33       picture '999'
@ 14,42 say nFaltaBi33      picture '99' 
@ 14,48 say nNotaBi34       picture '999'
@ 14,53 say nFaltaBi34      picture '99' 
@ 14,60 say nNotaMedia3     picture '99'    color cCorAprovado3
@ 14,67 say cAprovadoDiscp3
@ 15,01 say Replicate('-', 73)

if nDependencias <= 2
   cConfirmacao := 'Aprovado'
else
   cConfirmacao := 'Reprovado'
endif

nAcrescMensalidade := (nDependencias * 20 / 100) * nMensalidadeAluno
nNovaMensalidade   := nMensalidadeAluno + nAcrescMensalidade

@ 16,01 say 'Aprovado/Reprovado    :'
@ 16,25 say cConfirmacao   picture '@!'
@ 17,01 say 'Numero de dependencias:'
@ 17,25 say nDependencias
@ 18,01 say 'Materias com dependencia'

nLinhaDp := 19
if lAprovadoDisc1 == .f.
   @ nLinhaDp,03 say cDisciplina1
   nLinhaDp++
endif
if lAprovadoDisc2 == .f.
   @ nLinhaDp,03 say cDisciplina2
   nLinhaDp++
endif
if lAprovadoDisc3 == .f.
   @ nLinhaDp,03 say cDisciplina3
   nLinhaDp++
endif

nLinhaDp++
@ nLinhaDp,01 say 'Nova mensalidade para o proximo ano: R$'
@ nLinhaDp,41 say nNovaMensalidade  picture '@E 99,999.99'
