// Lucas Issamu Morino Yamahuti

set date brit 
set epoch to 1940

do while .t.
    clear 

    nEmpregados                 := 0
    nContador                   := 0
    nPercentualHomemAposentado  := 0
    nPercentualMulherAposentado := 0
    nValorTotalRemuneracao      := 0
    nQtdHomem                   := 0
    nQtdMulher                  := 0
    nQtdHomemAposentado         := 0
    nQtdMulherAposentada        := 0
    nQtdMulherAcima85           := 0
    nQtdHomemAdmitido2006       := 0
    nQtdHomemAdicional          := 0
    nQtdMulherReducao           := 0
    dHoje                       := Date()
    nSalarioAposentadoriaTotal  := 0
    
    @ 01,01 say 'PROGRAMA CONTROLE INSS'
    @ 02,01 say 'Quantidade de empregados a ser analisado:'

    @ 02,43 get nEmpregados     picture '999'   valid !Empty(nEmpregados)
    read

    if LastKey() == 27
        nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'})
        if nOpcao == 1
            exit
        else
            loop
        endif
    endif

    do while nContador < nEmpregados
        
        clear
        nContador++

        cColaborador                := Space(40)
        cSexo                       := ' '
        dNascimento                 := CToD('')
        dAdmissao                   := CToD('')
        dDemissao                   := CToD('')
        nSalario                    := 0
        nAdicionalNoturno           := 0
        nAdicionalInsalub           := 0
        nSalarioAposentadoria       := 0

        @ 04,01 say 'Colaborador:'
        @ 05,01 say 'Sexo (M/F):'
        @ 06,01 say 'Data de nascimento:'
        @ 07,01 say 'Data de admissao:'
        @ 08,01 say 'Data de demissao:'
        @ 09,01 say 'Salario:'
        @ 10,01 say 'Adicional noturno (%):'
        @ 11,01 say 'Adicional insalubridade (%):'

        @ 04,14 get cColaborador        picture '@!'            valid !Empty(cColaborador)
        @ 05,13 get cSexo               picture '@!'            valid !Empty(cSexo) .and. (cSexo == 'M') .or. (cSexo == 'F')
        @ 06,21 get dNascimento                                 valid !Empty(dNascimento)
        @ 07,21 get dAdmissao                                   valid !Empty(dAdmissao) .and. (dAdmissao > dNascimento)
        @ 08,21 get dDemissao                                   valid !Empty(dDemissao) .and. (dDemissao > dAdmissao)
        @ 09,10 get nSalario            picture '@e 99999.99'   valid !Empty(nSalario)
        @ 10,24 get nAdicionalNoturno   picture '@e 999.99'     valid nAdicionalNoturno >= 0
        @ 11,30 get nAdicionalInsalub   picture '@e 999.99'     valid nAdicionalInsalub >= 0
        read

        if cSexo == 'M'
            nQtdHomem++
            if (Year(dHoje) - Year(dNascimento) >= 59) .and. (Year(dDemissao) - Year(dAdmissao) >= 27)
                nQtdHomemAposentado++
            endif
            if Year(dAdmissao) < 2006
                nQtdHomemAdmitido2006++
            endif
        else
            nQtdMulher++
            if (Year(dHoje) - Year(dNascimento) >= 55) .and. (Year(dDemissao) - Year(dAdmissao) >= 22)
                nQtdMulherAposentada++
            endif
            if (Year(dHoje) - Year(dNascimento) > 85)
                nQtdMulherAcima85++
            endif
        endif

        nSalarioAdicional := 0
        nSalarioAdicional += nSalario + (nSalario * nAdicionalNoturno / 100) + (nSalario * nAdicionalInsalub / 100)

        if (Year(dAdmissao) <= 2010 .and. Year(dDemissao) >= 2010) .and. (Year(dAdmissao) <= 2010 .and. Year(dDemissao) >= 2010)
            nSalarioAposentadoria += nSalarioAdicional + (nSalarioAdicional * 0.06)
            if cSexo == 'M'
                nQtdHomemAdicional++
            endif
        endif

        if (Year(dAdmissao) <= 2012) .and. (Year(dDemissao) >= 2020)
            if nSalarioAposentadoria == 0
                nSalarioAposentadoria += nSalarioAdicional - (nSalarioAdicional * 0.02)
            else
                nSalarioAposentadoria := nSalarioAposentadoria - (nSalarioAdicional * 0.02)
            endif
            if cSexo == 'F'
                nQtdMulherReducao++
            endif
        endif

        nPercentualHomemAposentado = nQtdHomemAposentado / nQtdHomem * 100
        nPercentualMulherAposentada = nQtdMulherAposentada / nQtdMulher * 100

        nSalarioAposentadoriaTotal += nSalarioAposentadoria

        if LastKey() == 27
            nOpcao2 := Alert('Escolha uma opcao', {'Processar', 'Cancelar', 'Retornar'})
            if nOpcao2 == 1
                @ 13,01 say 'Quantidade de homens aposentados            :'
                @ 14,01 say 'Quantidade de Mulheres aposentadas          :'
                @ 15,01 say 'Porcentagem de homens aposentados           :'
                @ 16,01 say 'Porcentagem de mulheres aposentadas         :'
                @ 17,01 say 'Valor a pagar para os aposentados           :'
                @ 18,01 say 'Quantidade de mulheres com mais de 85 anos  :'
                @ 19,01 say 'Quantidade de homens admitidos antes de 2006:'
                @ 20,01 say 'Quantidade de homens que recebeu adicional  :'
                @ 21,01 say 'Quantidade de mulheres que recebeu reducao  :'
                @ 13,47 say str(nQtdHomemAposentado)
                @ 14,47 say str(nQtdMulherAposentada)
                @ 15,47 say str(nPercentualHomemAposentado)
                @ 16,47 say str(nPercentualMulherAposentada)
                @ 18,47 say str(nQtdMulherAcima85)
                @ 19,47 say str(nQtdHomemAdmitido2006)
                @ 20,47 say str(nQtdHomemAdicional)
                @ 21,47 say str(nQtdMulherReducao)
                if nSalarioAposentadoriaTotal == 0
                    @ 17,47 say 'Nao a aposentados para pagar'
                else
                    @ 17,47 say nSalarioAposentadoriaTotal  picture '@e 99999.99'
                endif

                Inkey(0)
                clear
                loop
            elseif nOpcao2 == 2
                exit
            else
                loop
            endif
        endif

        @ 17,01 say 'Valor a pagar para o aposentado:'
        if nSalarioAposentadoria == 0
            @ 17,34 say 'O colaborador ainda nao esta aposentado'
        else
            @ 17,34 say nSalarioAposentadoria picture '@e 99999.99'
        endif

        Inkey(0)
        @ 17,01 clear to 17,80
    enddo

    @ 13,01 say 'Quantidade de homens aposentados    :'
    @ 14,01 say 'Quantidade de Mulheres aposentadas  :'
    @ 15,01 say 'Porcentagem de homens aposentados   :'
    @ 16,01 say 'Porcentagem de mulheres aposentadas :'
    @ 17,01 say 'Valor a pagar para os aposentados   :'
    @ 18,01 say 'Quantidade de mulheres com mais de 85 anos  :'
    @ 19,01 say 'Quantidade de homens admitidos antes de 2006:'
    @ 20,01 say 'Quantidade de homens que recebeu adicional  :'
    @ 21,01 say 'Quantidade de mulheres que recebeu reducao  :'
    
    @ 13,47 say str(nQtdHomemAposentado)
    @ 14,47 say str(nQtdMulherAposentada)
    @ 15,47 say str(nPercentualHomemAposentado)
    @ 16,47 say str(nPercentualMulherAposentada)
    @ 18,47 say str(nQtdMulherAcima85)
    @ 19,47 say str(nQtdHomemAdmitido2006)
    @ 20,47 say str(nQtdHomemAdicional)
    @ 21,47 say str(nQtdMulherReducao)
    if nSalarioAposentadoriaTotal == 0
        @ 17,47 say 'Nao a aposentados para pagar'
    else
        @ 17,47 say nSalarioAposentadoriaTotal  picture '@e 99999.99'
    endif

    Inkey(0)

enddo
