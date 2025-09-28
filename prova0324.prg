// Lucas Issamu Morino Yamahuti

set scoreboard off
set epoch to 1940
set date british
SetMode (25,80)

clear

dDataAtual              := Date()
nNumeroColaboradores    := 0
nQtdColaboradoresM      := 0
nQtdColaboradoresF      := 0
nQtdAposentadosM        := 0
nQtdAposentadosF        := 0
nQtdTotalAposentados    := 0
nQtd80MaisM             := 0
nQtd80MaisF             := 0
nQtdAdmissao2003M       := 0
nQtdAdmissao2003F       := 0
nQtdDemissao2015M       := 0
nQtdDemissao2015F       := 0
nIdadeMinimoM           := 65
nContribMinimoM         := 30
nIdadeMinimoF           := 60
nContribMinimoF         := 25
nContadorColaborador    := 1
nSalarioTotalM          := 0
nSalarioTotalF          := 0
nAposentadoriaPagarM    := 0
nAposentadoriaPagarF    := 0
nProporcaoAposentadosM  := 0
nProporcaoAposentadosF  := 0
nAposentadoriaMediaM    := 0
nAposentadoriaMediaF    := 0

@ 00,23 say 'Pesquisa Controle INSS'
@ 02,00 to 04,65
@ 03,01 say 'Quantidade empregados:'

@ 03,23 get nNumeroColaboradores    picture '999'   valid !Empty(nNumeroColaboradores) .and. nNumeroColaboradores > 0
read 

@ 05,00 to 15,65
@ 05,22 say 'Dados colaboradores'   picture '@!'    color 'g/'

do while nContadorColaborador <= nNumeroColaboradores
   cNomeColaborador        := Space(30)
   cSexoColaborador        := Space(1)
   dDataNascimento         := CToD('')
   dDataAdmissao           := CToD('')
   dDataDemissao           := CToD('')
   nSalarioBase            := 0
   nAdicNoturno            := 0
   nAdicInsalubridade      := 0
   nPercAdicionais         := 0
   nSalarioTotal           := 0
    
   @ 06,01 say 'Nome..............:'
   @ 07,01 say 'Sexo..............:'
   @ 07,30 say 'Data de nascimento:'
   @ 08,01 say 'Data de admissao..:'
   @ 08,30 say 'Data de demissao..:'
   @ 09,01 say 'Salario...........:'
   @ 10,01 say 'Adicional Noturno.:'
   @ 10,30 say 'Adic Insalubridade:'
    
   @ 06,21 get cNomeColaborador    picture '@!'            valid !Empty(cNomeColaborador)
   @ 07,21 get cSexoColaborador    picture '@!'            valid !Empty(cSexoColaborador) .and. cSexoColaborador $ 'MF'
   @ 07,50 get dDataNascimento                             valid !Empty(dDataNascimento)
   @ 08,21 get dDataAdmissao                               valid !Empty(dDataAdmissao) .and. dDataAdmissao > dDataNascimento
   @ 08,50 get dDataDemissao                               valid !Empty(dDataDemissao) .and. dDataAdmissao > dDataNascimento .and. dDataDemissao > dDataAdmissao
   @ 09,21 get nSalarioBase        picture '@E 9999.99'    valid !Empty(nSalarioBase) .and. nSalarioBase > 0
   @ 10,21 get nAdicNoturno        picture '@E 999.99'     valid nAdicNoturno >= 0
   @ 10,50 get nAdicInsalubridade  picture '@E 999.99'     valid nAdicInsalubridade >= 0
   read 
    
   if LastKey() == 27
      cOpcao := Space(1)
      @ 16,01 say 'Selecione um dos seguintes opcoes [C]ancelar [R]etornar [P]rocessar:'  color 'r/w'
        
      @ 16,65 get cOpcao  picture '@!'    valid !Empty(cOpcao) .and. cOpcao $ 'CRP'
      read 
        
      if cOpcao == 'C'
         exit
      elseif cOpcao == 'R'
         @ 16,01 clear to 16,71
         loop
      elseif cOpcao == 'P'
         @ 06,01 clear to 14,64

         if nQtdAposentadosM != 0
            nAposentadoriaMediaM   := nAposentadoriaPagarM / nQtdAposentadosM
         elseif nQtdAposentadosF != 0
            nAposentadoriaMediaF   := nAposentadoriaPagarF / nQtdAposentadosF
         endif 
         if nQtdTotalAposentados != 0
            nProporcaoAposentadosM := nQtdAposentadosM / nQtdTotalAposentados
            nProporcaoAposentadosF := nQtdAposentadosF / nQtdTotalAposentados
         endif
            
         @ 06,01 say 'Observacao                                   |  homem |  mulher'     picture '@!'
         @ 07,01 say Replicate('-', 64)
         @ 08,01 say 'Quantidade de colaboradores..................|        |'
         @ 09,01 say 'Quantidade de aposentados....................|        |'
         @ 10,01 say 'Proporcao aposentados (%)....................|        |'
         @ 11,01 say 'Quantidade de colaboradores acima dos 80 anos|        |'
         @ 12,01 say 'Quantidade de admissoes antes de 2003........|        |'
         @ 13,01 say 'Quantidade de demissoes antes de 2015........|        |'
         @ 14,01 say 'Aposentadoria a pagar medio (R$).............|        |'
         @ 08,50 say nQtdColaboradoresM
         @ 08,59 say nQtdColaboradoresF
         @ 09,50 say nQtdAposentadosM
         @ 09,59 say nQtdAposentadosF
         @ 10,50 say nProporcaoAposentadosM
         @ 10,59 say nProporcaoAposentadosF
         @ 11,50 say nQtd80MaisM
         @ 11,59 say nQtd80MaisF
         @ 12,50 say nQtdAdmissao2003M
         @ 12,59 say nQtdAdmissao2003F
         @ 13,50 say nQtdDemissao2015M
         @ 13,59 say nQtdDemissao2015F
         @ 14,47 say nAposentadoriaMediaM    picture '@E 9,999.99'
         @ 14,56 say nAposentadoriaMediaF    picture '@E 9,999.99'
            
         @ 16,01 clear to 16,71
      endif 
   endif
    
   nAnoAtual               := Year(dDataAtual)
   nMesAtual               := Month(dDataAtual)
   nDiaAtual               := Day(dDataAtual)
   nAnoNascimento          := Year(dDataNascimento)
   nMesNascimento          := Month(dDataNascimento)
   nDiaNascimento          := Day(dDataNascimento)
   nAnoDemissao            := Year(dDataDemissao)
   nMesDemissao            := Month(dDataDemissao)
   nDiaDemissao            := Day(dDataDemissao)
   nAnoAdmissao            := Year(dDataAdmissao)
   nMesAdmissao            := Month(dDataAdmissao)
   nDiaAdmissao            := Day(dDataAdmissao)

   nIdadeColaborador       := nAnoAtual - nAnoNascimento
   if (nMesAtual < nMesNascimento) .or. ((nMesAtual == nMesNascimento) .and. (nDiaAtual < nDiaNascimento))
      nIdadeColaborador--
   endif 

   nPercAdicionais += nAdicNoturno
   nPercAdicionais += nAdicInsalubridade
    
   if nAnoAdmissao <= 2005 .and. nAnoDemissao >= 2009
      nPercAdicionais += 8
   endif
   if nAnoAdmissao <= 2012 .and. nAnoDemissao >= 2014
      nPercAdicionais -= 3
   endif
    
   nSalarioTotal := nSalarioBase * (1 + (nPercAdicionais / 100))
    
   @ 12,01 say 'A aposentadoria para ' + AllTrim(cNomeColaborador) + ' sera de R$ ' + AllTrim(str(nSalarioTotal)) + ' mensais'
        
   if cSexoColaborador == 'M'
      nQtdColaboradoresM++
      nSalarioTotalM += nSalarioTotal
        
      if nIdadeColaborador >= nIdadeMinimoM .and. nAnoDemissao - nAnoAdmissao >= nContribMinimoM
         nQtdAposentadosM++
         nQtdTotalAposentados++
         nAposentadoriaPagarM += nSalarioTotal
      endif

      if nIdadeColaborador > 80
         nQtd80MaisM++
      endif

      if nAnoAdmissao < 2003
         nQtdAdmissao2003M++
      endif

      if nAnoDemissao == 2015
         nQtdDemissao2015M++
      endif
   endif
    
   if cSexoColaborador == 'F'
      nQtdColaboradoresF++
      nSalarioTotalF += nSalarioTotal
        
      if nIdadeColaborador >= nIdadeMinimoF .and. nAnoDemissao - nAnoAdmissao >= nContribMinimoF
         nQtdAposentadosF++
         nQtdTotalAposentados++
         nAposentadoriaPagarF += nSalarioTotal
      endif

      if nIdadeColaborador > 80
         nQtd80MaisF++
      endif

      if nAnoAdmissao < 2003
         nQtdAdmissao2003F++
      endif

      if nAnoDemissao == 2015
         nQtdDemissao2015F++
      endif
   endif
    
   Inkey(0)
   @ 06,01 clear to 14,64
   nContadorColaborador++
enddo

@ 06,01 say 'Observacao                                   |  homem |  mulher'     picture '@!'
@ 07,01 say Replicate('-', 64)
@ 08,01 say 'Quantidade de colaboradores..................|        |'
@ 09,01 say 'Quantidade de aposentados....................|        |'
@ 10,01 say 'Proporcao aposentados (%)....................|        |'
@ 11,01 say 'Quantidade de colaboradores acima dos 80 anos|        |'
@ 12,01 say 'Quantidade de admissoes antes de 2003........|        |'
@ 13,01 say 'Quantidade de demissoes antes de 2015........|        |'
@ 14,01 say 'Aposentadoria a pagar medio (R$).............|        |'
@ 08,50 say nQtdColaboradoresM
@ 08,59 say nQtdColaboradoresF
@ 09,50 say nQtdAposentadosM
@ 09,59 say nQtdAposentadosF
@ 10,50 say nProporcaoAposentadosM  picture '@E 999.99'
@ 10,59 say nProporcaoAposentadosF  picture '@E 999.99'
@ 11,50 say nQtd80MaisM
@ 11,59 say nQtd80MaisF
@ 12,50 say nQtdAdmissao2003M
@ 12,59 say nQtdAdmissao2003F
@ 13,50 say nQtdDemissao2015M
@ 13,59 say nQtdDemissao2015F
@ 14,47 say nAposentadoriaMediaM    picture '@E 9,999.99'
@ 14,56 say nAposentadoriaMediaF    picture '@E 9,999.99'
