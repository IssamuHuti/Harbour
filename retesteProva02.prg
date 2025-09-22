set scoreboard off
set epoch to 1940
set date british
SetMode (25,80)

clear

cNomeVendedor           := Space(30)
dCotacao                := CToD('')
cNomeCliente            := Space(30)
nIdadeCliente           := 0
cSexoCliente            := Space(1)
nPrimeiroCnh            := 0
cMarcaVeiculo           := Space(20)
nAnoFabricacao          := 0
cTipoVeiculo            := Space(1)
nPotenciaMotor          := 0
nValorVeiculo           := 0
cTipoUso                := Space(1)
nIdadeAbaixo1           := 25
nIdadeAcima1            := 65
nIdadeAbaixo2           := 23
nIdadeAcima2            := 60
nIdadeAuteracao1        := 10
nIdadeauteracao2        := 8
nAuteracaoMasculino1    := 10
nAuteracaoFeminino1     := 5
nAuteracaoMasculino2    := 6
nAuteracaoFeminino2     := 12
nHabilitacaoAte1        := 15
nHabilitacaoAcima1      := 10
nHabilitacaoAte2        := 20
nHabilitacaoAcima2      := 8
nAuteracaoTipoE1        := 10
nAuteracaoTipoL1        := 20
nAuteracaoTipoE2        := 15
nAuteracaoTipoL2        := 18
nLimiteMotor1           := 2
nLimiteMotor2           := 1.5
nAuteracaoMotor1        := 15
nAuteracaoMotor2        := 15
nFabricacaoGradual1     := 0.5
nFabricacaoLimite1      := 10
nFabricacaoGradual2     := 0.8
nFabricacaoLimite2      := 8
nUsoProfissional1       := 10
nUsoProfissional2       := 12
nDescontoMarco1         := 10
nDescontoSetembro1      := 8
nAliquotaSeguro1        := 0
nAliquotaSeguro2        := 0
cMelhorCotacao          := 'g/'
nAliquotaBase1          := 0.06
nAliquotaBase2          := 0.07

@ 00,00 to 24,60
@ 01,01 say 'Cotacao Seguros'   picture '@!'
@ 02,01 say Replicate('-', 59)
@ 03,01 say 'dados cadastrais'  picture '@!'
@ 04,01 say 'Data cotacao:'     picture '@!'
@ 05,01 say 'Vendedor:'         picture '@!'
@ 07,01 say 'Cliente :'         picture '@!'
@ 08,01 say 'Idade   :'         picture '@!'
@ 08,20 say 'Sexo    :'         picture '@!' 
@ 08,37 say 'Ano primeira CNH:' picture '@!'
@ 09,01 say Replicate('-', 59)

@ 04,15 get dCotacao                        valid   !Empty(dCotacao)
@ 05,11 get cNomeVendedor   picture '@!'    valid   !Empty(cNomeVendedor)
read 

@ 07,11 get cNomeCliente    picture '@!'    valid   !Empty(cNomeCliente)
@ 08,11 get nIdadeCliente   picture '999'   valid   !Empty(nIdadeCliente)
@ 08,30 get cSexoCliente    picture '@!'    valid   !Empty(cSexoCliente) .and. (cSexoCliente == 'F' .or. cSexoCliente == 'M')
@ 08,54 get nPrimeiroCnh    picture '9999'  valid   !Empty(nPrimeiroCnh) .and. nPrimeiroCnh <= Year(dCotacao) .and. nPrimeiroCnh > 1970
read 

@ 10,01 say 'dados do veiculo'  picture '@!'
@ 12,01 say 'Uso particular ou profissional:'
@ 13,01 say 'Marca do veiculo:' picture '@!'
@ 14,01 say 'Tipo de veiculo :' picture '@!'
@ 15,01 say 'Ano de fabricao :' picture '@!'
@ 16,01 say 'Motor           :' picture '@!'
@ 17,01 say 'Valor fipe      :' picture '@!'
@ 18,01 say Replicate('-', 59)

@ 12,33 get cTipoUso        picture '@!'            valid !Empty(cTipoUso) .and. (cTipoUso == 'P' .or. cTipoUso == 'O')
@ 13,19 get cMarcaVeiculo   picture '@!'            valid !Empty(cMarcaVeiculo)
@ 14,19 get cTipoVeiculo    picture '@!'            valid !Empty(cTipoVeiculo) .and. (cTipoVeiculo == 'P' .or. cTipoVeiculo == 'E' .or. cTipoVeiculo == 'L')
@ 15,19 get nAnoFabricacao  picture '9999'          valid !Empty(nAnoFabricacao) .and. nAnoFabricacao <= Year(dCotacao) .and. nAnoFabricacao > 1940 
@ 16,19 get nPotenciaMotor  picture '@E 9,9'        valid !Empty(nPotenciaMotor) .and. nPotenciaMotor >= 1
@ 17,19 get nValorVeiculo   picture '@E 9999999.99' valid !Empty(nValorVeiculo) .and. nValorVeiculo >= 10000
read

nValorBase1 := nValorVeiculo * nAliquotaBase1

if nIdadeCliente < nIdadeAbaixo1 .or. nIdadeCliente > nIdadeAcima1
     nAliquotaSeguro1 := nAliquotaSeguro1 + nIdadeAuteracao1
endif

if cSexoCliente == 'M'
    nAliquotaBase1 := nAliquotaBase1 + nAuteracaoMasculino1
elseif cSexoCliente == 'F'
    nAliquotaBase1 := nAliquotaBase1 - nAuteracaoFeminino1
endif

if (Year(dCotacao) - nPrimeiroCnh) <= 3
    nAliquotaBase1 := nAliquotaBase1 + nHabilitacaoAcima1
elseif (Year(dCotacao) - nPrimeiroCnh) > 8
    nAliquotaBase1 := nAliquotaBase1 - nHabilitacaoAcima1
endif

if cTipoVeiculo == 'E'
    nAliquotaBase1 := nAliquotaBase1 + nAuteracaoTipoE1
elseif cTipoVeiculo == 'L'
    nAliquotaBase1 := nAliquotaBase1 + nAuteracaoTipoL1
endif

if nPotenciaMotor > nLimiteMotor1
    nAliquotaBase1 := nAliquotaBase1 + nAuteracaoMotor1
endif

nDiferencaoFabricacao   := Year(dCotacao) - nAnoFabricacao 
nAliquotaDiferenca      := nDiferencaoFabricacao * nFabricacaoGradual1

if nAliquotaDiferenca <= nFabricacaoLimite1
    nAliquotaBase1 := nAliquotaBase1 + nAliquotaDiferenca
else
    nAliquotaBase1 := nAliquotaBase1 + nFabricacaoLimite1
endif

if cTipoUso == 'O'
    nAliquotaBase1 := nAliquotaBase1 + nUsoProfissional1
endif

if Month(dCotacao) == 3
    nAliquotaBase1 := nAliquotaBase1 - nDescontoMarco1
endif

nAnualSeguradora1 := nValorBase1 * nAliquotaBase1 / 100

@ 19,01 say 'Valor anual Seguradora 1:'
@ 19,27 say nAnualSeguradora1           picture '@E 99,999.99'

nValorBase2 := nValorVeiculo * nAliquotaBase2

if nIdadeCliente < nIdadeAbaixo2 .or. nIdadeCliente > nIdadeAcima2
     nAliquotaSeguro2 := nAliquotaSeguro2 + nIdadeAuteracao2
endif

if cSexoCliente == 'M'
    nAliquotaBase2 := nAliquotaBase2 + nAuteracaoMasculino2
elseif cSexoCliente == 'F'
    nAliquotaBase2 := nAliquotaBase2 - nAuteracaoFeminino2
endif

if (Year(dCotacao) - nPrimeiroCnh) <= 3
    nAliquotaBase2 := nAliquotaBase2 + nHabilitacaoAcima2
elseif (Year(dCotacao) - nPrimeiroCnh) > 8
    nAliquotaBase2 := nAliquotaBase2 - nHabilitacaoAcima2
endif

if cTipoVeiculo == 'E'
    nAliquotaBase2 := nAliquotaBase2 + nAuteracaoTipoE2
elseif cTipoVeiculo == 'L'
    nAliquotaBase2 := nAliquotaBase2 + nAuteracaoTipoL2
endif

if nPotenciaMotor > nLimiteMotor2
    nAliquotaBase2 := nAliquotaBase2 + nAuteracaoMotor2
endif

nDiferencaoFabricacao   := Year(dCotacao) - nAnoFabricacao 
nAliquotaDiferenca      := nDiferencaoFabricacao * nFabricacaoGradual2

if nAliquotaDiferenca <= nFabricacaoLimite2
    nAliquotaBase2 := nAliquotaBase2 + nAliquotaDiferenca
else
    nAliquotaBase2 := nAliquotaBase2 + nFabricacaoLimite2
endif

if cTipoUso == 'O'
    nAliquotaBase2 := nAliquotaBase2 + nUsoProfissional2
endif

if Month(dCotacao) == 3
    nAliquotaBase2 := nAliquotaBase2 - nDescontoMarco2
endif

nAnualSeguradora2 := nValorBase2 * nAliquotaBase2 / 100

@ 20,01 say 'Valor anual Seguradora 2:'
@ 20,27 say nAnualSeguradora2           picture '@E 99,999.99'
