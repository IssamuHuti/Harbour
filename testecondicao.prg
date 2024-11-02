set color to 'r/w'

clear 

@ 00,00 to 03,10
nNumero := 0
cReposta := Space(10)

@ 01,01 get nNumero     picture '999'   color 'r/w'
read 

if nNumero < 0
    cReposta := 'negativo'
elseif nNumero == 0
    cReposta := 'zerado'
else
    cReposta := 'positivo'
    if nNumero >= 100
        cReposta := 'acima de 100'
    endif
endif

@ 02,01 say cReposta    color 'w/'
@ 04,01 say ''

set color to 'b/w'

inkey(0)

clear

@ 00,00 to 02,10    color 'g/'
@ 01,01 say 'terminado'