set scoreboard off // retira da lateral algumas teclas clicadas
clear 

@ 00,00 to 20,20 double 

nPositionX   := 13
nPositionY   := 07
nDestinoX    := 13
nDestinoY    := 10
nObstaculoX1 := 15
nObstaculoY1 := 01
nObstaculoX2 := hb_RandomInt(1,19)
nObstaculoY2 := hb_RandomInt(1,19)
nObstaculoX3 := hb_RandomInt(1,19)
nObstaculoY3 := hb_RandomInt(1,19)
nObstaculoX4 := hb_RandomInt(1,19)
nObstaculoY4 := hb_RandomInt(1,19)
nListaCodigo := {119, 87, 97, 65, 115, 83, 100, 68}
lObstaculo2  := .f.
lObstaculo3  := .f.
lObstaculo4  := .f.

cPersonagem := 'O'
cDestino    := 'X'
cObstaculo  := '*'
nAcertos    := 0
@ nPositionX,nPositionY   say cPersonagem
@ nDestinoX,nDestinoY     say cDestino
@ nObstaculoX1,nObstaculoY1 say cObstaculo

Inkey(0)
do while nAcertos < 10

   if lObstaculo2 == .t.
      if nObstaculoY2 == 0
         nObstaculoY2 := 19
      endif
   
      @ nObstaculoX2,nObstaculoY2 say '*'
   endif
   
   if lObstaculo3 == .t.
      if nObstaculoX3 == 20
         nObstaculoX3 := 01
      endif
   
      @ nObstaculoX3,nObstaculoY3 say '*'
   endif
   
   if lObstaculo4 == .t.
      if nObstaculoX4 == 0
         nObstaculoX4 := 19
      endif
   
      @ nObstaculoX4,nObstaculoY4 say '*'
   endif

   @ nObstaculoX1,nObstaculoY1 clear to nObstaculoX1,nObstaculoY1
   @ 02,25 say nAcertos

   if LastKey() == 119 .or. LastKey() == 87
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionX--
      nObstaculoY1++
      
      if nPositionX == 00
         nPositionX := 19
         @ nPositionX,nPositionY say cPersonagem
      endif

      if lObstaculo2 == .t.
         @ nObstaculoX2,nObstaculoY2 clear to nObstaculoX2,nObstaculoY2
         nObstaculoY2-- 
      endif
      
      if lObstaculo3 == .t.
         @ nObstaculoX3,nObstaculoY3 clear to nObstaculoX3,nObstaculoY3
         nObstaculoX3++ 
      endif
      
      if lObstaculo4 == .t.
         @ nObstaculoX4,nObstaculoY4 clear to nObstaculoX4,nObstaculoY4
         nObstaculoX4-- 
      endif
      
      @ nPositionX,nPositionY say cPersonagem
      
   elseif LastKey() == 97 .or. LastKey() == 65
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionY--
      nObstaculoY1++
      
      if nPositionY == 00
         nPositionY := 19
         @ nPositionX,nPositionY say cPersonagem
      endif
      
      if lObstaculo2 == .t.
         @ nObstaculoX2,nObstaculoY2 clear to nObstaculoX2,nObstaculoY2
         nObstaculoY2-- 
      endif
      
      if lObstaculo3 == .t.
         @ nObstaculoX3,nObstaculoY3 clear to nObstaculoX3,nObstaculoY3
         nObstaculoX3++ 
      endif
      
      if lObstaculo4 == .t.
         @ nObstaculoX4,nObstaculoY4 clear to nObstaculoX4,nObstaculoY4
         nObstaculoX4-- 
      endif
      
      @ nPositionX,nPositionY say cPersonagem
      
   elseif LastKey() == 115 .or. LastKey() == 83
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionX++
      nObstaculoY1++
      
      if nPositionX == 20
         nPositionX := 01
         @ nPositionX,nPositionY say cPersonagem
      endif
      
      if lObstaculo2 == .t.
         @ nObstaculoX2,nObstaculoY2 clear to nObstaculoX2,nObstaculoY2
         nObstaculoY2-- 
      endif
      
      if lObstaculo3 == .t.
         @ nObstaculoX3,nObstaculoY3 clear to nObstaculoX3,nObstaculoY3
         nObstaculoX3++ 
      endif
      
      if lObstaculo4 == .t.
         @ nObstaculoX4,nObstaculoY4 clear to nObstaculoX4,nObstaculoY4
         nObstaculoX4-- 
      endif
      
      @ nPositionX,nPositionY say cPersonagem
      
   elseif LastKey() == 100 .or. LastKey() == 68
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionY++
      nObstaculoY1++
      
      if nPositionY == 20
         nPositionY := 01
         @ nPositionX,nPositionY say cPersonagem
      endif

      if lObstaculo2 == .t.
         nObstaculoY2-- 
      endif

      if lObstaculo3 == .t.
         nObstaculoX3++ 
      endif

      if lObstaculo4 == .t.
         nObstaculoX4-- 
      endif
      
      @ nPositionX,nPositionY say cPersonagem
      
   endif
   
   if nObstaculoY1 == 20
      nObstaculoY1 := 01
   endif

   @ nObstaculoX1,nObstaculoY1 say cObstaculo


   if nPositionX == nDestinoX .and. nPositionY == nDestinoY
      Alert('Objetivo alcancado!')
      
      nAcertos++
      nDestinoX := hb_RandomInt(1,19)
      nDestinoY := hb_RandomInt(1,19)
      
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
   
   if nPositionX == nObstaculoX1 .and. nPositionY == nObstaculoY1
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
      
      @ 02,25 say nAcertos
   endif
   
   if LastKey() == 27
      nOpcao := Alert('Deseja Sair do jogo?', {'Sim', 'Nao'})
      if nOpcao == 1
         exit
      else 
         loop
      endif
   endif
   
   Inkey(0)
enddo
