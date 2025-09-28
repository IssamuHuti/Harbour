clear 
set scoreboard off
SetMode (25,80)

@ 09,00 to 15,06


do while .t.
   cJogadorO   := 'O'
   cJogadorX   := 'X'
   cJogadasO   := Space(5)
   cJogadasX   := Space(5)
   lRodadaO    := .t.
   lRodadaX    := .f.
   nJogadas    := 0
   cVencedor   := ''

   @ 10,01 say ' | | '
   @ 11,01 say '-----'
   @ 12,01 say ' | | '
   @ 13,01 say '-----'
   @ 14,01 say ' | | '

   do while nJogadas < 9
      Inkey(0)
      cTeclaDigitada := ''
      cJogadorRodada := ''
      nPosicaoX      := 0
      nPosicaoY      := 0
      
      if LastKey() == 49
         cTeclaDigitada := cTeclaDigitada + '1'

         if lRodadaO == .t.
            cJogadasO := cJogadasO + cTeclaDigitada
            nPosicaoX := 14
            nPosciaoY := 01
         else
            cJogadasX := cJogadasX + cTeclaDigitada
            nPosicaoX := 14
            nPosciaoY := 01
         endif
      endif
      
      if LastKey() == 50
         cTeclaDigitada := cTeclaDigitada + '2'

         if lRodadaO == .t.
            cJogadasO := cJogadasO + cTeclaDigitada
            nPosicaoX := 14
            nPosciaoY := 03
         else
            cJogadasX := cJogadasX + cTeclaDigitada
            nPosicaoX := 14
            nPosciaoY := 03
         endif
      endif
      
      if LastKey() == 51
         cTeclaDigitada := cTeclaDigitada + '3'

         if lRodadaO == .t.
            cJogadasO := cJogadasO + cTeclaDigitada
            nPosicaoX := 14
            nPosciaoY := 05
         else
            cJogadasX := cJogadasX + cTeclaDigitada
            nPosicaoX := 14
            nPosciaoY := 05
         endif
      endif
      
      if LastKey() == 52
         cTeclaDigitada := cTeclaDigitada + '4'

         if lRodadaO == .t.
            cJogadasO := cJogadasO + cTeclaDigitada
            nPosicaoX := 12
            nPosciaoY := 01
         else
            cJogadasX := cJogadasX + cTeclaDigitada
            nPosicaoX := 12
            nPosciaoY := 01
         endif
      endif
      
      if LastKey() == 53
         cTeclaDigitada := cTeclaDigitada + '5'

         if lRodadaO == .t.
            cJogadasO := cJogadasO + cTeclaDigitada
            nPosicaoX := 12
            nPosciaoY := 03
         else
            cJogadasX := cJogadasX + cTeclaDigitada
            nPosicaoX := 12
            nPosciaoY := 03
         endif
      endif
      
      if LastKey() == 54
         cTeclaDigitada := cTeclaDigitada + '6'

         if lRodadaO == .t.
            cJogadasO := cJogadasO + cTeclaDigitada
            nPosicaoX := 12
            nPosciaoY := 05
         else
            cJogadasX := cJogadasX + cTeclaDigitada
            nPosicaoX := 12
            nPosciaoY := 05
         endif
      endif
      
      if LastKey() == 55
         cTeclaDigitada := cTeclaDigitada + '7'

         if lRodadaO == .t.
            cJogadasO := cJogadasO + cTeclaDigitada
            nPosicaoX := 10
            nPosciaoY := 01
         else
            cJogadasX := cJogadasX + cTeclaDigitada
            nPosicaoX := 10
            nPosciaoY := 01
         endif
      endif
      
      if LastKey() == 56
         cTeclaDigitada := cTeclaDigitada + '8'

         if lRodadaO == .t.
            cJogadasO := cJogadasO + cTeclaDigitada
            nPosicaoX := 10
            nPosciaoY := 03
         else
            cJogadasX := cJogadasX + cTeclaDigitada
            nPosicaoX := 10
            nPosciaoY := 03
         endif
      endif
      
      if LastKey() == 57
         cTeclaDigitada := cTeclaDigitada + '9'

         if lRodadaO == .t.
            cJogadasO := cJogadasO + cTeclaDigitada
            nPosicaoX := 10
            nPosciaoY := 05
         else
            cJogadasX := cJogadasX + cTeclaDigitada
            nPosicaoX := 10
            nPosciaoY := 05
         endif
      endif

      if (cTeclaDigitada $ cJogadasX) .or. (cTeclaDigitada $ cJogadasO)
         Alert('Campo Preenchido')
         loop
      endif

      if lRodadaO == .t.
         cJogadorRodada := 'O'
         lRodadaO := .f.
         lRodadaX := .t.
      else
         cJogadorRodada := 'X'
         lRodadaX := .f.
         lRodadaO := .t.
      endif 
      
      @ nPosicaoX,nPosciaoY say cJogadorRodada

      if lRodadaO == .f.
         if ('1' $ cJogadasO) .and. ('2' $ cJogadasO) .and. ('3' $ cJogadasO)
            cVencedor := cJogadorRodada
         elseif ('4' $ cJogadasO) .and. ('5' $ cJogadasO) .and. ('6' $ cJogadasO)
            cVencedor := cJogadorRodada
         elseif ('7' $ cJogadasO) .and. ('8' $ cJogadasO) .and. ('9' $ cJogadasO)
            cVencedor := cJogadorRodada
         elseif ('1' $ cJogadasO) .and. ('4' $ cJogadasO) .and. ('7' $ cJogadasO)
            cVencedor := cJogadorRodada
         elseif ('2' $ cJogadasO) .and. ('5' $ cJogadasO) .and. ('8' $ cJogadasO)
            cVencedor := cJogadorRodada
         elseif ('3' $ cJogadasO) .and. ('6' $ cJogadasO) .and. ('9' $ cJogadasO)
            cVencedor := cJogadorRodada
         elseif ('1' $ cJogadasO) .and. ('5' $ cJogadasO) .and. ('9' $ cJogadasO)
            cVencedor := cJogadorRodada
         elseif ('7' $ cJogadasO) .and. ('5' $ cJogadasO) .and. ('3' $ cJogadasO)
            cVencedor := cJogadorRodada
         endif
      else
         if ('1' $ cJogadasX) .and. ('2' $ cJogadasX) .and. ('3' $ cJogadasX)
            cVencedor := cJogadorRodada
         elseif ('4' $ cJogadasX) .and. ('5' $ cJogadasX) .and. ('6' $ cJogadasX)
            cVencedor := cJogadorRodada
         elseif ('7' $ cJogadasX) .and. ('8' $ cJogadasX) .and. ('9' $ cJogadasX)
            cVencedor := cJogadorRodada
         elseif ('1' $ cJogadasX) .and. ('4' $ cJogadasX) .and. ('7' $ cJogadasX)
            cVencedor := cJogadorRodada
         elseif ('2' $ cJogadasX) .and. ('5' $ cJogadasX) .and. ('8' $ cJogadasX)
            cVencedor := cJogadorRodada
         elseif ('3' $ cJogadasX) .and. ('6' $ cJogadasX) .and. ('9' $ cJogadasX)
            cVencedor := cJogadorRodada
         elseif ('1' $ cJogadasX) .and. ('5' $ cJogadasX) .and. ('9' $ cJogadasX)
            cVencedor := cJogadorRodada
         elseif ('7' $ cJogadasX) .and. ('5' $ cJogadasX) .and. ('3' $ cJogadasX)
            cVencedor := cJogadorRodada
         endif
      endif

      if Len(cVencedor) == 1
         @ 05,05 say 'Vencedor: ' + cVencedor   color 'r/w'
         exit
      endif

      nJogadas++
   enddo

   nOpcao := Alert('Deseja Sair do jogo?', {'Sim', 'Nao'})
   if nOpcao == 1
      exit
   else 
      @ 10,01 clear to 14,05
      @ 05,01 clear to 05,80
      loop
   endif

   Inkey(0)
enddo
