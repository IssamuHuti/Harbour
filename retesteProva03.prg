set scoreboard off
set epoch to 1940
set date british
SetMode (25,80)

clear

nQtdEmpregados          := 0
cNomeColaborador        := 0
cSexo                   := Space(1)
dDataAtual              := Date()
dNascimento             := CToD('')
dAdmissao               := CToD('')
dDemissao               := CToD('')
nSalario                := 0
nAdicionalNoturno       := 0
nAdicionalInsalubridade := 0
nIdadeAposentadoriaH    := 59
nTempoTrabalhoH         := 27
nIdadeAposentadoriaM    := 55
nTempoTrabalhoM         := 22
nAnoLimiteBaixo1        := 2010
nAnoLimiteAcima1        := 2015
nAlteracaoPercentual1   := 6
nAnoLimiteBaixo2        := 2012
nAnoLimiteAcima2        := 2020
nAlteracaoPercentual2   := 2
nQtdMulheres85          := 0
nQtdHomens85            := 0
nQtdMulheres2006        := 0
nQtdHomens2006          := 0
nQtdMulheresAdicional   := 0
nQtdHomensAdicional     := 0
nQtdMulheresReducao     := 0
nQtdHomensReducao       := 0
nContadorColaborador    := 1
nQtdHomensAposentados   := 0
nQtdMulheresAposentados := 0

@ 00,00 to 24,70 double 
@ 01,01 say 'Pesquisa IBGE'
@ 02,01 say Replicate('-', 69)
@ 03,01 say 'Quantos colaboradores ja passaram pela empresa:'

@ 03,64 get nQtdEmpregados  picture '999'   valid !Empty(nQtdEmpregados) .and. nQtdEmpregados > 0
read 

do while nContadorColaborador <= nQtdEmpregados
    nIdadeColaborador   := Year(dDataAtual) - Year(dNascimento)
    nTempoServico       := Year(dDemissao) - Year(dAdmissao)

    if cSexo == 'M'
        if nIdadeColaborador <= nIdadeAposentadoriaH .and. nTempoServico >= nTempoTrabalhoH
            nQtdHomensAposentados++
        endif
    elseif cSexo == 'F'
        if nIdadeColaborador <= nIdadeAposentadoriaM .and. nTempoServico >= nTempoTrabalhoM
            nQtdMulheresAposentados++
        endif
    endif

    nContadorColaborador++
enddo
