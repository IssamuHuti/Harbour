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

    if cLetra !$ cTestada
        cTestada += cLetra
    endif

    if cLetra $ cADescobrir
        
    else
        cRejeitada += cLetra
    endif

    

enddo
