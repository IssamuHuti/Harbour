set scoreboard off
set epoch to 1940
set date british
SetMode (25,80)

clear

dDataAtual      := Date()
dMesDescricao   := ''

@ 01,01 say 'Data:'

@ 01,06 get dDataAtual  valid !Empty(dDataAtual) 
read 

do while .t.

   nDia            := Day(dDataAtual)
   nMes            := Month(dDataAtual)
   nAno            := Year(dDataAtual)
   nDiaSemana      := DoW(dDataAtual)
   nUltimoDiaMes   := CToD('01/' + str(nMes + 1) + '/' + str(nAno)) - 1
   nUltimoDia      := Day(nUltimoDiaMes)
   if nMes == 12
      nUltimoDiaMes   := CToD('01/01/' + str(nAno + 1)) - 1
      nUltimoDia      := Day(nUltimoDiaMes)
   endif
   
   if nMes == 1
      cDescricaoMes := 'Janeiro'
   elseif nMes == 2
      cDescricaoMes := 'Fevereiro'
   elseif nMes == 3
      cDescricaoMes := 'Marco'
   elseif nMes == 4
      cDescricaoMes := 'Abril'
   elseif nMes == 5
      cDescricaoMes := 'Maio'
   elseif nMes == 6
      cDescricaoMes := 'Junho'
   elseif nMes == 7
      cDescricaoMes := 'Julho'
   elseif nMes == 8
      cDescricaoMes := 'Agosto'
   elseif nMes == 9
      cDescricaoMes := 'Setembro'
   elseif nMes == 10
      cDescricaoMes := 'Outubro'
   elseif nMes == 11
      cDescricaoMes := 'Novembro'
   elseif nMes == 12
      cDescricaoMes := 'Dezembro'
   endif
   
   nPrimeiroDia         := CToD('01/' + str(nMes) + '/' + str(nAno))
   nPrimeiroDiaMes      := DoW(nPrimeiroDia)
   
   nColunaPrimeiroDia   := 0
   if nPrimeiroDiaMes == 1
      nColunaPrimeiroDia := 2
   elseif nPrimeiroDiaMes == 2
      nColunaPrimeiroDia := 6
   elseif nPrimeiroDiaMes == 3
      nColunaPrimeiroDia := 10
   elseif nPrimeiroDiaMes == 4
      nColunaPrimeiroDia := 14
   elseif nPrimeiroDiaMes == 5
      nColunaPrimeiroDia := 18
   elseif nPrimeiroDiaMes == 6
      nColunaPrimeiroDia := 22
   elseif nPrimeiroDiaMes == 7
      nColunaPrimeiroDia := 26
   endif
   
   @ 02,01 say nPrimeiroDiaMes
   
   nDiaLoop     := 1
   nLinhaMes    := 04
   nLinhaSemana := 05
   nLinhaDia    := 06
   @ nLinhaMes,11    say cDescricaoMes
   @ nLinhaSemana,01 say ' D   S   T   Q   Q   S   S '
   nColunaDia  := nColunaPrimeiroDia
   do while nDiaLoop <= nUltimoDia
      if nColunaDia == 30
         nColunaDia := 2
         nLinhaDia += 1
      endif
      
      if nDiaLoop == nDia
         @ nLinhaDia,nColunaDia say AllTrim(Str(nDiaLoop)) color 'r/'
      else
         @ nLinhaDia,nColunaDia say AllTrim(Str(nDiaLoop))
      endif
      
      nColunaDia += 4
      nDiaLoop++
   enddo

   Inkey(0)

   if LastKey() == 102
      nMes++
   endif
   
enddo
