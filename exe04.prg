set epoch to 1940
set date brit

clear

@ 05,05 say'********************************************************'
@ 06,05 say'|*                    SUPER SISTEMA                   *|'
@ 07,05 say'|**************(A P R E S E N T A C A O)***************|'
@ 08,05 say'|*                                                    *|'
@ 09,05 say'|*       Sistema desenvolvido pelos alunos do         *|'
@ 10,05 say'|*Curso de Programacao da SG Sistemas-Proj. SGTrainee *|'
@ 11,05 say'|*                                                    *|'
@ 12,05 say'|*Aluno:                                              *|'
@ 13,05 say'|*Linguagem de Programacao:                           *|'
@ 14,05 say'|*Data:                                               *|'
@ 15,05 say'|******************************************************|'
@ 16,05 say''

cAluno := Space(40)
cLinguagem := Space(10)
dAtual := Date()
@ 12,14 get cAluno      picture '@!'    Valid !Empty(cAluno)
@ 13,33 get cLinguagem  picture '@!'    Valid !Empty(cLinguagem)
@ 14,12 get dAtual 
read
