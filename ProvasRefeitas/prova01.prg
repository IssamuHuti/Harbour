//Boletim

set epoch to 1940
set Date brit

clear

cColegio         := 'Adaile Maria Leite'
cEnderecoColegio := Space(40)
nNumeroEndereco  := 0
nTelefone1       := 0
nTelefone2       := 0
nTelefoneDDD     := 0
cBairro          := Space(20)
cCidade          := Space(20)
cAluno           := Space(40)
dNascimento      := CToD('')
nSerie           := 0
cPeriodo         := Space(1)
nNota            := 0
nFaltas          := 0
nMensalidade     := 0
nQtdDisciplina   := 1
cAprovado        := ''
cReprovado       := ''
nReprovado       := 0

@ 01,01 say 'BOLETIM ESCOLAR'
@ 02,01 say '________________________________________________________________________________'
@ 03,01 say cColegio
@ 06,01 say '(  ) xxxx-xxxx'

@ 04,01 get cEnderecoColegio    picture '@!'    valid !Empty(cEnderecoColegio)
@ 04,42 get nNumeroEndereco     picture '9999'  valid !Empty(nNumeroEndereco)
@ 05,01 get cBairro             picture '@!'    valid !Empty(cBairro)
@ 05,22 get cCidade             picture '@!'    valid !Empty(cCidade)
@ 06,02 get nTelefoneDDD        picture '99'    valid !Empty(nTelefoneDDD)
@ 06,06 get nTelefone1          picture '9999'  valid !Empty(nTelefone1)
@ 06,11 get nTelefone2          picture '9999'  valid !Empty(nTelefone2)
read

Inkey(0)
clear

do while .t.
    @ 01,01 say 'Aluno:'
    @ 01,50 say 'Data de Nascimento:'
    @ 02,01 say 'Periodo:'
    @ 02,13 say 'Serie:'
    @ 03,01 say 'Mensalidade:'

    @ 01,08 get cAluno       picture '@!'           valid !Empty(cAluno)
    @ 01,70 get dNascimento                         valid !Empty(dNascimento) .and. dNascimento < Date()
    @ 02,10 get cPeriodo     picture '@!'           valid !Empty(cPeriodo) .and. ((cPeriodo == 'M') .or. (cPeriodo == 'V') .or. (cPeriodo == 'N'))
    @ 02,20 get nSerie       picture '9'            valid !Empty(nSerie)
    @ 03,14 get nMensalidade picture '@e 99999.99'  valid !Empty(nMensalidade) .and. (nMensalidade > 0)
    read 

    @ 04,01 say '________________________________________________________________________________'
    @ 05,01 say 'DISCIPLINA'
    @ 05,15 say '1 BIMESTRE'
    @ 05,27 say '2 BIMESTRE'
    @ 05,39 say '3 BIMESTRE'
    @ 05,51 say '4 BIMESTRE'
    @ 05,67 say 'RESULTADO'
    @ 06,15 say 'NOTA|FALTA'
    @ 06,27 say 'NOTA|FALTA'
    @ 06,39 say 'NOTA|FALTA'
    @ 06,51 say 'NOTA|FALTA'
    @ 06,66 say 'NOTA|FALTA'

    nLinha := 7
    do while nQtdDisciplina <= 6
        nQtdDisciplina++
        nNota1           := 0
        nNota2           := 0
        nNota3           := 0
        nNota4           := 0
        nFaltas1         := 0
        nFaltas2         := 0
        nFaltas3         := 0
        nFaltas4         := 0
        cDisciplina      := Space(10)

        @ nLinha,01 get cDisciplina     picture '@!'        valid !Empty(cDisciplina)
        @ nLinha,15 get nNota1          picture '@e 999'    valid (nNota1 >= 0) .and. (nNota1 <= 100)
        @ nLinha,23 get nFaltas1        picture '99'        valid (nFaltas1 >= 0) .and. (nFaltas1 < 60) 
        @ nLinha,27 get nNota2          picture '@e 999'    valid (nNota2 >= 0) .and. (nNota2 <= 100)
        @ nLinha,35 get nFaltas2        picture '99'        valid (nFaltas2 >= 0) .and. (nFaltas2 < 60) 
        @ nLinha,39 get nNota3          picture '@e 999'    valid (nNota3 >= 0) .and. (nNota3 <= 100)
        @ nLinha,47 get nFaltas3        picture '99'        valid (nFaltas3 >= 0) .and. (nFaltas3 < 60) 
        @ nLinha,51 get nNota4          picture '@e 999'    valid (nNota4 >= 0) .and. (nNota4 <= 100)
        @ nLinha,59 get nFaltas4        picture '99'        valid (nFaltas4 >= 0) .and. (nFaltas4 < 60) 
        read 

        if LastKey() == 27
            nOpcaoParar := Alert('Deseja parar de cadastrar materia?', {'Sim', 'Nao'})
            if nOpcaoParar == 1
                exit
            else
                loop
            endif
        endif

        nMediaNota  := (nNota1 + nNota2 + nNota3 + nNota4) / 4
        nMediaFalta := (nFaltas1 + nFaltas2 + nFaltas3 + nFaltas4) / 4
        @ nLinha,63 say '|'

        if nSerie <= 3
            if nMediaNota >= 60 .and. nMediaFalta <= 6
                cAprovado += cDisciplina
                @ nLinha,66 say nMediaNota  picture '999'       color 'g/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'g/'
            elseif nMediaNota < 60 .and. nMediaFalta <= 6
                cReprovado += cDisciplina
                nReprovado++
                @ nLinha,66 say nMediaNota  picture '999'       color 'r/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'g/'
            elseif nMediaNota >= 60 .and. nMediaFalta > 6
                cReprovado += cDisciplina
                nReprovado++
                @ nLinha,66 say nMediaNota  picture '999'       color 'g/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'r/'
            else
                cReprovado += cDisciplina
                nReprovado++
                @ nLinha,66 say nMediaNota  picture '999'       color 'r/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'r/'
            endif
        elseif nSerie <= 4
            if nMediaNota >= 60 .and. nMediaFalta <= 8
                cAprovado += cDisciplina
                @ nLinha,66 say nMediaNota  picture '999'       color 'g/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'g/'
            elseif nMediaNota < 60 .and. nMediaFalta <= 8
                cReprovado += cDisciplina
                nReprovado++
                @ nLinha,66 say nMediaNota  picture '999'       color 'r/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'g/'
            elseif nMediaNota >= 60 .and. nMediaFalta > 8
                cReprovado += cDisciplina
                nReprovado++
                @ nLinha,66 say nMediaNota  picture '999'       color 'g/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'r/'
            else
                cReprovado += cDisciplina
                nReprovado++
                @ nLinha,66 say nMediaNota  picture '999'       color 'r/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'r/'
            endif
        else
            if nMediaNota >= 70 .and. nMediaFalta <= 8
                cAprovado += cDisciplina
                @ nLinha,66 say nMediaNota  picture '999'       color 'g/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'g/'
            elseif nMediaNota < 70 .and. nMediaFalta <= 8
                cReprovado += cDisciplina
                nReprovado++
                @ nLinha,66 say nMediaNota  picture '999'       color 'r/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'g/'
            elseif nMediaNota >= 70 .and. nMediaFalta > 8
                cReprovado += cDisciplina
                nReprovado++
                @ nLinha,66 say nMediaNota  picture '999'       color 'g/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'r/'
            else
                cReprovado += cDisciplina
                nReprovado++
                @ nLinha,66 say nMediaNota  picture '999'       color 'r/'
                @ nLinha,72 say nMediaFalta picture '99'        color 'r/'
            endif
        endif 
        nLinha++
    enddo

    @ 13,01 say '________________________________________________________________________________'
    if nReprovado == 0
        @ 14,01 say 'O ' + AllTrim(cAluno) + ' foi apovado sem nenhuma reprovacao!'
        @ 15,01 say 'A mensalidade para o próximo ano permanecera:'
        @ 15,47 say nMensalidade    picture '@e 99999.99'
    else
        @ 14,01 say 'O ' + AllTrim(cAluno) + ' foi reprovado nas seguintes materias:'
        nLinha2 := 15
        nCont   := 0
        do while nCont <= nReprovado
            @ nLinha2++,01 say SubStr(cReprovado, 1 + (10 * nCont), 10)
            nCont++
        enddo

        @ nLinha2++,01 say 'E a mensalidade para o proximo ana subira para:'
        @ nLinha2,45 say nMensalidade + (nMensalidade * nReprovado * 2 / 10)
    endif

    Inkey(0)

    nOpcaoSair := Alert('Deseja cadastrar mais aluno?', {'Sim', 'Nao'})
    if nOpcaoSair == 1
        loop
    else
        exit
    endif
enddo
