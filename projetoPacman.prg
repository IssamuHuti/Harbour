set scoreboard off // retira da lateral algumas teclas clicadas
clear 

@ 00,00 to 20,20 double 

nPositionX   := hb_RandomInt(1,19)
nPositionY   := hb_RandomInt(1,19)
nDestinoX    := hb_RandomInt(1,19)
nDestinoY    := hb_RandomInt(1,19)
if nDestinoX == nPositionX .and. nDestinoY == nPositionY
   nDestinoX    := hb_RandomInt(1,19)
   nDestinoY    := hb_RandomInt(1,19)
endif 
nObstaculoX1 := hb_RandomInt(1,19)
nObstaculoY1 := hb_RandomInt(1,19)
if (nPositionX == nObstaculoX1 .and. nPositionY == nObstaculoY1) .or. (nObstaculoX1 == nPositionX .and. nObstaculoY1 == nPositionY)
   nObstaculoX1 := hb_RandomInt(1,19)
   nObstaculoY1 := hb_RandomInt(1,19)
endif 
nObstaculoX2 := hb_RandomInt(1,19)
nObstaculoY2 := hb_RandomInt(1,19)
nObstaculoX3 := hb_RandomInt(1,19)
nObstaculoY3 := hb_RandomInt(1,19)
nObstaculoX4 := hb_RandomInt(1,19)
nObstaculoY4 := hb_RandomInt(1,19)
lObstaculo2  := .f.
lObstaculo3  := .f.
lObstaculo4  := .f.
nQuadradoX1  := hb_RandomInt(1,19)
nQuadradoY1  := hb_RandomInt(1,19)
if nQuadradoX1 >= nPositionX .and. nQuadradoY1 >= nPositionY .and. nQuadradoX2 <= nPositionX .and. nQuadradoY2 <= nPositionY
   nQuadradoX1  := hb_RandomInt(1,19)
   nQuadradoY1  := hb_RandomInt(1,19)
endif 

cPersonagem := 'O'
cDestino    := 'X'
cObstaculo  := '*'
nAcertos    := 0
@ nPositionX,nPositionY     say cPersonagem
@ nDestinoX,nDestinoY       say cDestino
@ nObstaculoX1,nObstaculoY1 say cObstaculo

Inkey(0)

do while nAcertos < 10
   nQuadradoX2  := nQuadradoX1 + 2
   nQuadradoY2  := nQuadradoY1 + 2
   if nQuadradoX2 >= 20
      nQuadradoX1 := 17
      nQuadradoX2 := 19
   endif
   if nQuadradoY2 >= 20
      nQuadradoY1 := 17
      nQuadradoY2 := 19
   endif
   @ nQuadradoX1,nQuadradoY1 to nQuadradoX2,nQuadradoY2
   if LastKey() == 27
      nOpcao := Alert('Deseja Sair do jogo?', {'Sim', 'Nao'})
      if nOpcao == 1
         exit
      else 
         loop
      endif
   endif
   
   @ 02,25 say nAcertos
   
   // transfere o objeto para outro lado do quadrado
   @ nObstaculoX1,nObstaculoY1 clear to nObstaculoX1,nObstaculoY1
   if nObstaculoX1 == nDestinoX .and. nObstaculoY1 == nDestinoY
      @ nObstaculoX1,nObstaculoY1 say cDestino
   endif 
   if nObstaculoY1 == 20
      nObstaculoY1 := 01
   endif   
   if lObstaculo2
      @ nObstaculoX2,nObstaculoY2 clear to nObstaculoX2,nObstaculoY2
      if nObstaculoX2 == nDestinoX .and. nObstaculoY2 == nDestinoY
         @ nObstaculoX2,nObstaculoY2 say cDestino
      endif 
      if nObstaculoY2 == 0
         nObstaculoY2 := 19
      endif
   endif
   if lObstaculo3
      @ nObstaculoX3,nObstaculoY3 clear to nObstaculoX3,nObstaculoY3
      if nObstaculoX3 == nDestinoX .and. nObstaculoY3 == nDestinoY
         @ nObstaculoX3,nObstaculoY3 say cDestino
      endif 
      if nObstaculoX3 == 20
         nObstaculoX3 := 01
      endif
   endif
   if lObstaculo4
      @ nObstaculoX4,nObstaculoY4 clear to nObstaculoX4,nObstaculoY4
      if nObstaculoX4 == nDestinoX .and. nObstaculoY4 == nDestinoY
         @ nObstaculoX4,nObstaculoY4 say cDestino
      endif 
      if nObstaculoX4 == 0
         nObstaculoX4 := 19
      endif
   endif
   
   // Tecla A
   if LastKey() == 119 .or. LastKey() == 87
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionX--
      nObstaculoY1++
      
      if nPositionX == nQuadradoX1 .and. (nPositionY == nQuadradoY1 .or. nPositionY == nQuadradoY1 + 1 .or. nPositionY == nQuadradoY2)
         nPositionX := nQuadradoX2 + 1
      endif
      if nPositionX == nQuadradoX2 .and. (nPositionY == nQuadradoY1 .or. nPositionY == nQuadradoY1 + 1 .or. nPositionY == nQuadradoY2)
         nPositionX := nQuadradoX1 - 1
      endif
      if nPositionX == 00
         nPositionX := 19
         @ nPositionX,nPositionY say cPersonagem
      endif
      @ nPositionX,nPositionY say cPersonagem
      
      // Tecla S
   elseif LastKey() == 97 .or. LastKey() == 65
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionY--
      nObstaculoY1++
      
      if nPositionY == nQuadradoY1 .and. (nPositionX == nQuadradoX1 .or. nPositionX == nQuadradoX1 + 1 .or. nPositionX == nQuadradoX2)
         nPositionY := nQuadradoY2 + 1
      endif
      if nPositionY == nQuadradoY2 .and. (nPositionX == nQuadradoX1 .or. nPositionX == nQuadradoX1 + 1 .or. nPositionX == nQuadradoX2)
         nPositionY := nQuadradoY1 - 1
      endif
      if nPositionY == 00
         nPositionY := 19
         @ nPositionX,nPositionY say cPersonagem
      endif
      @ nPositionX,nPositionY say cPersonagem
      
      // Tecla D
   elseif LastKey() == 115 .or. LastKey() == 83
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionX++
      nObstaculoY1++
      
      if nPositionX == nQuadradoX1 .and. (nPositionY == nQuadradoY1 .or. nPositionY == nQuadradoY1 + 1 .or. nPositionY == nQuadradoY2)
         nPositionX := nQuadradoX2 + 1
      endif
      if nPositionX == nQuadradoX2 .and. (nPositionY == nQuadradoY1 .or. nPositionY == nQuadradoY1 + 1 .or. nPositionY == nQuadradoY2)
         nPositionX := nQuadradoX1 - 1
      endif
      if nPositionX == 20
         nPositionX := 01
         @ nPositionX,nPositionY say cPersonagem
      endif
      @ nPositionX,nPositionY say cPersonagem
      
      // Tecla W
   elseif LastKey() == 100 .or. LastKey() == 68
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionY++
      nObstaculoY1++
      
      if nPositionY == nQuadradoY1 .and. (nPositionX == nQuadradoX1 .or. nPositionX == nQuadradoX1 + 1 .or. nPositionX == nQuadradoX2)
         nPositionY := nQuadradoY2 + 1
      endif
      if nPositionY == nQuadradoY2 .and. (nPositionX == nQuadradoX1 .or. nPositionX == nQuadradoX1 + 1 .or. nPositionX == nQuadradoX2)
         nPositionY := nQuadradoY1 - 1
      endif
      if nPositionY == 20
         nPositionY := 01
         @ nPositionX,nPositionY say cPersonagem
      endif
      @ nPositionX,nPositionY say cPersonagem
   endif
   
   @ nObstaculoX1,nObstaculoY1 say cObstaculo
   
   if lObstaculo2
      nObstaculoY2-- 
      @ nObstaculoX2,nObstaculoY2 say cObstaculo
   endif
   if lObstaculo3
      nObstaculoX3++ 
      @ nObstaculoX3,nObstaculoY3 say cObstaculo
   endif
   if lObstaculo4
      nObstaculoX4-- 
      @ nObstaculoX4,nObstaculoY4 say cObstaculo
   endif
   
   // Coincidencia entre objeto e destino
   if nPositionX == nDestinoX .and. nPositionY == nDestinoY
      Alert('Objetivo alcancado!')
      
      nAcertos++
      nDestinoX := hb_RandomInt(1,19)
      nDestinoY := hb_RandomInt(1,19)
      if nDestinoX >= nQuadradoX1 .and. nDestinoY >= nQuadradoY1 .and. nDestinoX <= nQuadradoX2 .and. nDestinoY <= nQuadradoY2
         nDestinoX := hb_RandomInt(1,19)
         nDestinoY := hb_RandomInt(1,19)
      endif 

      @ nDestinoX,nDestinoY say cDestino
      @ 02,25 say nAcertos
      
      if nAcertos == 3
         lObstaculo2:= .t.
      endif
      if nAcertos == 6
         lObstaculo3:= .t.
      endif
      if nAcertos == 9
         lObstaculo4:= .t.
      endif
      
   endif
   
   lConfirmacaoObstaculo1 := (nPositionX == nObstaculoX1) .and. (nPositionY == nObstaculoY1)
   lConfirmacaoObstaculo2 := (nPositionX == nObstaculoX2) .and. (nPositionY == nObstaculoY2)
   lConfirmacaoObstaculo3 := (nPositionX == nObstaculoX3) .and. (nPositionY == nObstaculoY3)
   lConfirmacaoObstaculo4 := (nPositionX == nObstaculoX4) .and. (nPositionY == nObstaculoY4)
   
   if lConfirmacaoObstaculo1 .or. lConfirmacaoObstaculo2 .or. lConfirmacaoObstaculo3 .or. lConfirmacaoObstaculo4
      Alert('Alvo obstruido!')
      nAcertos--
      
      if nAcertos == 2
         lObstaculo2:= .f.
      endif
      if nAcertos == 5
         lObstaculo3:= .f.
      endif
      if nAcertos == 8
         lObstaculo4:= .f.
      endif

      if nAcertos < 0
         Alert('Perdeu')
         exit 
      endif 
            
      @ 02,25 say nAcertos
   endif
   
   Inkey(0)
   @ 00,00 to 20,20 double 
   @ nQuadradoX1,nQuadradoY1 clear to nQuadradoX2,nQuadradoY2
enddo
