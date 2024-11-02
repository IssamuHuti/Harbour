clear 

nNumero1 := 0
nNumero2 := 0
nNumero3 := 0

@ 01,01 say 'Valor 1: '
@ 02,01 say 'Valor 2: '
@ 03,01 say 'Valor 3: '

@ 01,10 get nNumero1    picture '9'     valid   nNumero1 >= 1 .and. nNumero1 <= 5 .and. !Empty( nNumero1 )
@ 02,10 get nNumero2    picture '9'     valid   nNumero2 >= 1 .and. nNumero2 <= 5 .and. !Empty( nNumero2 )
@ 03,10 get nNumero3    picture '9'     valid   nNumero3 >= 1 .and. nNumero3 <= 5 .and. !Empty( nNumero3 )

@ 05,01 say 'Inclua somente valores de 1 a 5'
read

@ 06,01 say ''
