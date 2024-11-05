clear

cPalavra := Space(20)

@ 01,01 say 'Digite uma palavra:'
@ 01,21 get cPalavra    picture '@!'    valid !Empty(cPalavra)
read

@ 03,01 say SubStr(cPalavra, 2, 5)
@ 04,01 say Len(AllTrim(cPalavra))
