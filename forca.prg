clear 

cADescobrir  := Space(20)
cTestada     := ''
cConfirmacao := ''
cRejeitada   := ''

@ 01,01 say 'Digite a palavra a procurar:'
@ 01,30 get cADescobrir     picture '@!'    valid !Empty(cADescobrir)
read

do while Len(cConfirmacao) < Len(AllTrim(cADescobrir))  
    cConfirmacao += '*'
enddo

@ 03,01 say 'Descubra a palavra'
@ 03,20 say cConfirmacao

do while cConfirmacao != AllTrim(cADescobrir)
    cLetra := ' '
    @ 05,01 say 'Digite uma letra:'

    @ 05,19 get cLetra  picture '@!'    valid !Empty(cLetra)
    read

    count := 1
    do while count <= Len(cADescobrir)
        if cLetra == SubStr(cADescobrir, count, 1)
            cConfirmacao += cLetra 
        else
            cRejeitada += cLetra
        endif

    

enddo
