clear

@ 04,01 to 08,50 double

do while .t.

    Alert('Informe os seus dados!')     color 'w/n'

    cNome   := Space(40)
    nIdade  := 0
    nPeso   := 0

    @ 05,02 say 'Nome =  ' // + cNome
    @ 06,02 say 'Idade = ' // + AllTrim( str( nIdade ) )
    @ 07,02 say 'Peso =  ' // + cPeso
    @ 09,02 say ''

    @ 05,10 get cNome   picture '@!'        valid !Empty(cNome)
    @ 06,10 get nIdade  picture '999'       valid nIdade >= 0
    @ 07,10 get nPeso   picture '999.99'    valid nPeso >= 0
    read

    @ 07,17 say 'Kg'
    @ 08,01 say ''

    if LastKey() == 27
        nOpcao := Alert('Deseja sair? ', {'Sim','Nao'})
        if nOpcao == 1
            exit
        endif
        loop
    endif 

    @ 05,02 clear to 07,49 

    Inkey(0)
enddo
