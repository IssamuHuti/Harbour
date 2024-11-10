//Estatistica Aposentadoria

set epoch to 1940
set Date brit 

clear

nColaboradores      := 0
nPodeAposentarH     := 0
nPodeAposentarM     := 0
nNaoAposentados     := 0
nTotalPagar         := 0
nQtdMulher85        := 0
nQtdHomem85         := 0
nQtdMulher2006      := 0
nQtdHomem2006       := 0
nQtdMulherReducao   := 0
nQtdHomemReducao    := 0
nQtdMulherAdicional := 0
nQtdHomemAdicional  := 0

@ 01,01 say 'Informe a quantidade de empregados:'
@ 01,37 get nColaboradores  picture '9999'  valid !Empty(nColaboradores)
read 

nCount := 1
do while nCount <= nColaboradores
    clear

    cColaborador     := Space(20)
    cSexo            := Space(1)
    dNascimento      := CToD('')
    dAdmissao        := CToD('')
    dDemissao        := CToD('')
    nSalarioBase     := 0
    nAdicionalN      := 0
    nAdicionalI      := 0
    nPercHAposentado := nPodeAposentarH / (nPodeAposentarH + nPodeAposentarM)
    nPercMAposentado := nPodeAposentarM / (nPodeAposentarH + nPodeAposentarM)

    @ 01,01 say 'DADOS DO COLABORADOR'
    @ 02,01 say 'Nome                   :'
    @ 03,01 say 'Sexo                   :'
    @ 04,01 say 'Data nascimento        :'
    @ 05,01 say 'Data admissao          :'
    @ 06,01 say 'Data demissao          :'
    @ 07,01 say 'Salario base           :'
    @ 08,01 say 'Adicional Noturno      :'
    @ 09,01 say 'Adicional Insalubridade:'

    @ 02,26 get cColaborador    picture '@!'          valid !Empty(cColaborador)
    @ 03,26 get cSexo           picture '@!'          valid !Empty(cSexo) .and. ((cSexo == 'M') .or. (cSexo == 'F'))
    @ 04,26 get dNascimento                           valid !Empty(dNascimento) .and. (dNascimento < Date())
    @ 05,26 get dAdmissao                             valid !Empty(dAdmissao) .and. (dAdmissao < Date())
    @ 06,26 get dDemissao                             valid !Empty(dDemissao) .and. (dDemissao < Date())
    @ 07,26 get nSalarioBase    picture '@e 99999.99' valid !Empty(nSalarioBase)   
    @ 08,26 get nAdicionalN     picture '@e 999.99'   valid !Empty(nAdicionalN)   
    @ 09,26 get nAdicionalI     picture '@e 999.99'   valid !Empty(nAdicionalI)
    read 

    if LastKey() == 27
        nOpcaoCadastro := Alert('O que deseja?', {'Cancelar', 'Retornar', 'Processar'})
        if nOpcaoCadastro == 1
            exit
        elseif nOpcaoCadastro == 3
            @ 11,01 say 'INFORMACOES OBTIDAS'
            if nCount == 1
                @ 12,01 say 'Nao possui nenhum cadastro'
                Inkey(0)
                @ 12,01 clear to 12,80
            endif
            @ 12,01 say 'Foram analisadas ' + AllTrim(Str(nCount - 1)) + ' colaboradores'
            @ 13,01 say 'O total a pagar aos aposentados               :' + AllTrim(Str(nTotalPagar))
            @ 14,01 say 'Quantidade de homens aposentados              :' + AllTrim(Str(nPodeAposentarH)) 
            @ 14,60 say AllTrim(Str(nPercHAposentado)) + ' %' picture '999'
            @ 15,01 say 'Quantidade de mulheres aposentados            :' + AllTrim(Str(nPodeAposentarM))
            @ 15,60 say AllTrim(Str(nPercMAposentado)) + ' %' picture '999'
            @ 16,01 say 'A quantidade colaboradores que não aposentaram:' + AllTrim(Str(nNaoAposentados))
            @ 17,01 say 'Quantidade de homens com mais de 85 anos      :' + AllTrim(Str(nQtdHomem85))
            @ 18,01 say 'Quantidade de mulheres com mais de 85 anos    :' + AllTrim(Str(nQtdMulher85))
            @ 19,01 say 'Quantidade de homens admitidos antes de 2006  :' + AllTrim(Str(nQtdHomem2006))
            @ 20,01 say 'Quantidade de mulheres admitidos antes de 2006:' + AllTrim(Str(nQtdMulher2006))
            @ 21,01 say 'Quantidade de homens que receberam adicional  :' + AllTrim(Str(nQtdHomemAdicional))
            @ 22,01 say 'Quantidade de mulheres que receberam adicional:' + AllTrim(Str(nQtdMulherAdicional))
            @ 23,01 say 'Quantidade de homens que tiveram reducao      :' + AllTrim(Str(nQtdHomemReducao))
            @ 24,01 say 'Quantidade de mulheres que tiveram reducao    :' + AllTrim(Str(nQtdMulherReducao))
            Inkey(0)
            loop
        else
            loop
        endif
    endif

    nAdicional := 0
    nReducao   := 0
    if (Year(dAdmissao) <= 2010 .and. Year(dDemissao) >= 2010) .and. (Year(dAdmissao) <= 2015 .and. Year(dDemissao) >= 2015)
        nAdicional += 6
    endif
    if Year(dAdmissao) <= 2012 .and. Year(dDemissao) >= 2020
        nReducao += 2
    endif

    if cSexo == 'M'
        if (Year(Date()) - Year(dNascimento) >= 59) .and. (Year(dDemissao) - Year(dAdmissao) >= 27)
            nPodeAposentarH++
        else
            nNaoAposentados++
        endif
        if (Year(Date()) - Year(dNascimento)) > 85
            nQtdHomem85++
        endif
        if Year(dAdmissao) < 2006
            nQtdHomem2006++
        endif
        if nAdicional == 6
            nQtdHomemAdicional++
        endif
        if nReducao == 2
            nQtdHomemReducao++
        endif
    elseif cSexo == 'F'
        if (Year(Date()) - Year(dNascimento) >= 55) .and. (Year(dDemissao) - Year(dAdmissao) >= 22)
            nPodeAposentarM++
        else
            nNaoAposentados++
        endif
        if (Year(Date()) - Year(dNascimento)) > 85
            nQtdMulher85++
        endif
        if Year(dAdmissao) < 2006
            nQtdMulher2006++
        endif
        if nAdicional == 6
            nQtdMulherAdicional++
        endif
        if nReducao == 2
            nQtdMulherReducao++
        endif
    endif  

    nSalarioAposentadoria := nSalarioBase + (nSalarioBase * nAdicional / 100) - (nSalarioBase * 2 / 100)
    nTotalPagar           += nSalarioAposentadoria

        @ 11,01 say 'INFORMACOES OBTIDAS'
        @ 12,01 say 'Foram analisadas ' + AllTrim(Str(nCount - 1)) + ' colaboradores'
        @ 13,01 say 'O total a pagar aos aposentados               :' + AllTrim(Str(nTotalPagar))
        @ 14,01 say 'Quantidade de homens aposentados              :' + AllTrim(Str(nPodeAposentarH)) + ' - ' + AllTrim(Str(nPercHAposentado))
        @ 15,01 say 'Quantidade de mulheres aposentados            :' + AllTrim(Str(nPodeAposentarM)) + ' - ' + AllTrim(Str(nPercMAposentado))
        @ 16,01 say 'A quantidade colaboradores que não aposentaram:' + AllTrim(Str(nNaoAposentados))
        @ 17,01 say 'Quantidade de homens com mais de 85 anos      :' + AllTrim(Str(nQtdHomem85))
        @ 18,01 say 'Quantidade de mulheres com mais de 85 anos    :' + AllTrim(Str(nQtdMulher85))
        @ 19,01 say 'Quantidade de homens admitidos antes de 2006  :' + AllTrim(Str(nQtdHomem2006))
        @ 20,01 say 'Quantidade de mulheres admitidos antes de 2006:' + AllTrim(Str(nQtdMulher2006))
        @ 21,01 say 'Quantidade de homens que receberam adicional  :' + AllTrim(Str(nQtdHomemAdicional))
        @ 22,01 say 'Quantidade de mulheres que receberam adicional:' + AllTrim(Str(nQtdMulherAdicional))
        @ 23,01 say 'Quantidade de homens que tiveram reducao      :' + AllTrim(Str(nQtdHomemReducao))
        @ 24,01 say 'Quantidade de mulheres que tiveram reducao    :' + AllTrim(Str(nQtdMulherReducao))
    nCount++
enddo