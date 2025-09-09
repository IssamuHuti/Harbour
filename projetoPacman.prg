set scoreboard off // retira da lateral algumas teclas clicadas
clear 

@ 00,00 to 20,20 double 

nPositionX  := 13
nPositionY  := 07
nDestinoX   := 13
nDestinoY   := 10
nObstaculoX := 15
nObstaculoY := 01
nListaCodigo:= {119, 87, 97, 65, 115, 83, 100, 68}
cObstaculos := '1501'

cPersonagem := 'O'
cDestino    := 'X'
cObstaculo  := '*'
nAcertos    := 0
@ nPositionX,nPositionY   say cPersonagem
@ nDestinoX,nDestinoY     say cDestino
@ nObstaculoX,nObstaculoY say cObstaculo

Inkey(0)
do while .t.
   @ nObstaculoX,nObstaculoY clear to nObstaculoX,nObstaculoY
   @ 02,25 say nAcertos

   if LastKey() == 119 .or. LastKey() == 87
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionX--
      nObstaculoY++
      
      if nPositionX == 00
         nPositionX := 19
         @ nPositionX,nPositionY say cPersonagem
      endif
      
      @ nPositionX,nPositionY say cPersonagem
      
   elseif LastKey() == 97 .or. LastKey() == 65
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionY--
      nObstaculoY++
      
      if nPositionY == 00
         nPositionY := 19
         @ nPositionX,nPositionY say cPersonagem
      endif
      
      @ nPositionX,nPositionY say cPersonagem
      
   elseif LastKey() == 115 .or. LastKey() == 83
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionX++
      nObstaculoY++
      
      if nPositionX == 20
         nPositionX := 01
         @ nPositionX,nPositionY say cPersonagem
      endif
      
      @ nPositionX,nPositionY say cPersonagem
      
   elseif LastKey() == 100 .or. LastKey() == 68
      @ nPositionX,nPositionY clear to nPositionX,nPositionY
      nPositionY++
      nObstaculoY++
      
      if nPositionY == 20
         nPositionY := 01
         @ nPositionX,nPositionY say cPersonagem
      endif
      
      @ nPositionX,nPositionY say cPersonagem
      
   endif
   
   if nObstaculoY == 20
      nObstaculoY := 01
   endif

   @ nObstaculoX,nObstaculoY say cObstaculo

   if nPositionX == nDestinoX .and. nPositionY == nDestinoY
      Alert('Objetivo alcancado!')
      
      nAcertos++
      nDestinoX := hb_RandomInt(1,19)
      nDestinoY := hb_RandomInt(1,19)
      
      @ nDestinoX,nDestinoY say cDestino
      @ 02,25 say nAcertos
   endif

   if nPositionX == nObstaculoX .and. nPositionY == nObstaculoY
      Alert('Alvo obstruido!')
      
      nAcertos--
      
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

