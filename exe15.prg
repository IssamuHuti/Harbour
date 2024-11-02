clear

cNome       := Space(10)
nContador   := 0
nLinha      := 3

@ 01,01 say 'Digite o nome:'    picture '@!'
@ 01,15 get cNome               picture '@!'    valid !Empty(cNome)
read 

@ 02,01 say 'Contagem ='        picture '@!'
@ 02,12 say AllTrim(str(nContador))

cNome2 := cNome

do while nContador < 10
    nContador++
    nLinha++
    @ 04,01     say 'Nome:'                 picture '@!'
    @ nLinha,07 say cNome                   picture '@!' // @ nLinha++,07 faz a mesma função de atribuir +1 na variavel nLinha
    @ nLinha,18 say 'Contagem ='            picture '@!'
    @ nLinha,29 say AllTrim(str(nContador)) picture '@!'
enddo 
