set date brit
set epoch to 1940

clear 

@ 00,00 to 20,40
inkey(0)
@ 02,20 say 'ola mundo'
inkey(0)
@ 01,01 clear to 03,39
inkey(0)
@ 20,01 say ''

dAtual      := Date()
dAtualA     := Date() + 5
dNascimento := CToD('')
dFixa       := CToD('01/01/12')

@ 01,01 say dAtual
@ 02,01 say dAtualA
@ 03,01 say dFixa

@ 04,01 get dNascimento    valid dNascimento <= dAtual
read