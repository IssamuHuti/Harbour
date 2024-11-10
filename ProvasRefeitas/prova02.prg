//Seguro

set epoch to 1940
set Date brit

clear

do while .t.
    cVendedor   := Space(20)
    dCotacao    := CToD('')
    cCliente    := Space(20)
    nIdade      := 0
    cSexo       := Space(1)
    nAnoCNH     := 0
    cMarca      := Space(10)
    nFabricacao := 0
    cTipoVeic   := Space(1)
    nMotor      := 0
    nValorFipe  := 0
    cUsoVeic    := Space(1)

    @ 01,01 say 'DADOS PARA COTACAO'
    @ 02,01 say 'Vendedor      :'
    @ 03,01 say 'Data cotacao  :'
    @ 05,01 say 'DADOS CLIENTE'
    @ 06,01 say 'Cliente       :'
    @ 07,01 say 'Idade         :'
    @ 08,01 say 'Sexo          :'
    @ 09,01 say 'Ano 1 CNH     :'
    @ 11,01 say 'DADOS VEICULO'
    @ 12,01 say 'Marca         :'
    @ 13,01 say 'Ano fabricacao:'
    @ 14,01 say 'Tipo veiculo  :'
    @ 15,01 say 'Motor         :'
    @ 16,01 say 'Valor FIPE    :'
    @ 17,01 say 'Uso veiculo   :'

    @ 02,17 get cVendedor   picture '@!'            valid !Empty(cVendedor)
    @ 03,17 get dCotacao                            valid !Empty(cVendedor) .and. dCotacao <= Date()
    @ 06,17 get cCliente    picture '@!'            valid !Empty(cCliente)
    @ 07,17 get nIdade      picture '999'           valid !Empty(nIdade) .and. (nIdade >= 18) .and. (nIdade <= 100)
    @ 08,17 get cSexo       picture '@!'            valid !Empty(cSexo) .and. ((cSexo == 'F') .or. (cSexo == 'M'))
    @ 09,17 get nAnoCNH     picture '9999'          valid !Empty(nAnoCNH) .and. (nAnoCNH <= Year(dCotacao)) .and. ((nIdade - (Year(dCotacao) - nAnoCNH)) >= 18)
    @ 12,17 get cMarca      picture '@!'            valid !Empty(cMarca)
    @ 13,17 get nFabricacao picture '9999'          valid !Empty(nFabricacao) .and. (nFabricacao <= Year(dCotacao))
    @ 14,17 get cTipoVeic   picture '@!'            valid !Empty(cTipoVeic) .and. ((cTipoVeic == 'P') .or. (cTipoVeic == 'E') .or. (cTipoVeic == 'L'))
    @ 15,17 get nMotor      picture '9.9'           valid !Empty(nMotor) .and. nMotor >= 1
    @ 16,17 get nValorFipe  picture '9999999.99'    valid !Empty(nValorFipe) .and. nValorFipe > 0
    @ 17,17 get cUsoVeic    picture '@!'            valid !Empty(cUsoVeic) .and. ((cUsoVeic == 'P') .or. (cUsoVeic == 'O'))
    read

    if LastKey() == 27
        nOpcaoSair := Alert('Deseja interromper a cotacao?', {'Sim', 'Nao'})
        if nOpcaoSair == 1
            exit
        else
            loop
        endif
    endif

    // cotacao 1
    nBaseCotacao1 := nValorFipe * 6 /100
    nPercCotacao1 := 0
    if nIdade < 25 .or. nIdade > 65
         nPercCotacao1 += 10
    endif
    if cSexo == 'M'
        nPercCotacao1 += 10
    elseif cSexo == 'F'
        nPercCotacao1 -= 5
    endif
    if (Year(dCotacao) - nAnoCNH) <= 3
        nPercCotacao1 += 15
    elseif (Year(dCotacao) - nAnoCNH) > 8
        nPercCotacao1 -= 10
    endif
    if cTipoVeic == 'E'
        nPercCotacao1 += 10
    elseif cTipoVeic == 'L'
        nPercCotacao1 += 20
    endif
    if nMotor > 2
        nPercCotacao1 += 15
    endif
    nAumentoAno := (Year(dCotacao) - nFabricacao) * 0.5
    if nAumentoAno <= 10
        nPercCotacao1 += nAumentoAno
    else
        nPercCotacao1 += 10
    endif
    if cUsoVeic == 'O'
        nPercCotacao1 += 10
    endif
    if Month(dCotacao) == 3
        nPercCotacao1 *= 90 / 100
    endif

    // cotacao 2
    nBaseCotacao2 := nValorFipe * 7 /100
    nPercCotacao2 := 0
    if nIdade < 23 .or. nIdade > 60
        nPercCotacao2 += 15
    elseif nIdade >= 30 .and. nIdade <= 50
        nPercCotacao2 -= 8
    endif
    if cSexo == 'M'
        nPercCotacao2 -= 6
    elseif cSexo == 'F'
        nPercCotacao2 += 12
    endif
    if (Year(dCotacao) - nAnoCNH) <= 2
        nPercCotacao2 += 20
    elseif (Year(dCotacao) - nAnoCNH) > 5
        nPercCotacao2 -= 8
    endif
    if cTipoVeic == 'E'
        nPercCotacao2 += 15
    elseif cTipoVeic == 'L'
        nPercCotacao2 += 18
    endif
    if nMotor >= 1.5
        nPercCotacao2 += 10
    endif
    nAumentoAno2 := (Year(dCotacao) - nFabricacao) * 0.8
    if nAumentoAno2 <= 8
        nPercCotacao2 += nAumentoAno2
    else
        nPercCotacao2 += 8
    endif
    if cUsoVeic == 'O'
        nPercCotacao2 += 12
    endif
    if Month(dCotacao) == 9
        nPercCotacao2 *= 92 / 100
    endif

    nSeguro1 := nBaseCotacao1 + (nBaseCotacao1 * nPercCotacao1 / 100)
    nSeguro2 := nBaseCotacao2 + (nBaseCotacao2 * nPercCotacao2 / 100)

    @ 19,01 say 'COTACAO'
    @ 19,13 say 'ANUAL'
    @ 19,24 say 'TRIMESTRAL'
    @ 19,35 say 'MENSAL'

    if nSeguro1 < nSeguro2
        @ 20,01 say 'Segurado 1'
        @ 21,01 say 'Segurado 2'
        @ 20,13 say AllTrim(Str(nSeguro1))        color 'g/'
        @ 21,13 say AllTrim(Str(nSeguro2))
        @ 20,24 say AllTrim(Str(nSeguro1 / 4))    color 'g/'
        @ 21,24 say AllTrim(Str(nSeguro2 / 4))
        @ 20,35 say AllTrim(Str(nSeguro1 / 12))   color 'g/'
        @ 21,35 say AllTrim(Str(nSeguro2 / 12))
    elseif nSeguro1 > nSeguro2
        @ 20,01 say 'Segurado 1'
        @ 21,01 say 'Segurado 2'
        @ 20,13 say AllTrim(Str(nSeguro1))        
        @ 21,13 say AllTrim(Str(nSeguro2))        color 'g/'
        @ 20,24 say AllTrim(Str(nSeguro1 / 4))    
        @ 21,24 say AllTrim(Str(nSeguro2 / 4))    color 'g/'
        @ 20,35 say AllTrim(Str(nSeguro1 / 12))   
        @ 21,35 say AllTrim(Str(nSeguro2 / 12))   color 'g/'
    endif

    Inkey(0)
    clear

enddo
