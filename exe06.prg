clear

@ 00,01 to 05,30

nNumero1 := 0
nNumero2 := 0
nNumero3 := 0

@ 01,02 say "O primeiro numero: " // + AllTrim( str( nNumero1 ) )
@ 02,02 say "O segundo numero: " // + AllTrim( str( nNumero2 ) )
@ 03,02 say "O terceiro numero: " // + AllTrim( str( nNumero3 ) )

@ 01,20 get nNumero1
@ 02,20 get nNumero2
@ 03,20 get nNumero3
read

nMedia   := ( nNumero1 + nNumero2 + nNumero3 ) / 3

@ 04,02 say "A media e " + AllTrim( str( nMedia ) )

@ 06,01 say ""