clear 

cNome       := Space(10)
nContador   := 0
nLimite     := 0
nLinha      := 4

@ 01,01 say 'Digite um nome:'
@ 02,01 say 'Repetir quantas vezes:'
@ 01,17 get cNome       picture '@!'    valid !Empty(cNome)
@ 02,24 get nLimite     picture '9'     valid !Empty(nLimite) .and. nLimite <= 5
read 

do while !(nContador == nLimite)
    nContador++
    @ nLinha++,01 say cNome
enddo 
