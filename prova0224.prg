// Lucas Issamu Morino Yamahuti

set scoreboard off
set epoch to 1940
set date british
SetMode (25,80)

clear

cNomeVendedor   := Space(30)
dAtual          := Date()
dCotacao        := CToD('17/09/25')
cNomeCliente    := Space(30)
nIdadeCliente   := 0
cSexoCliente    := Space(1)
nPesoCliente    := 0
nAlturaCliente  := 0
nDescontoPerc1  := 0
nDescontoPerc2  := 0
nValorSaude     := 300
nValorVida      := 320
cClienteFumante := Space(1)
cTipoPlano      := Space(1)
cAbrangencia    := Space(1)
cCorBarata      := 'w/g'
cCorCara        := 'w/r'
cCorSaude       := ''
cCorVida        := ''

@ 00,00 to 02,79
@ 00,29 say 'cotacao de planos de saude'    picture '@!'
@ 01,01 say 'Vendedor:'
@ 01,54 say 'Data da cotacao:'

@ 01,11 get cNomeVendedor                   picture '@!'    valid !Empty(cNomeVendedor)
@ 01,71 get dCotacao                                        valid !Empty(dCotacao)
read 

@ 03,00 to 09,79
@ 03,35 say 'dados pessoais'                picture '@!'
@ 04,01 say 'Nome.........:'
@ 04,57 say 'Idade:'
@ 05,01 say 'Sexo.........:'
@ 05,18 say '[M]asculino [F]eminino'
@ 06,01 say 'Peso (kg)....:'
@ 07,01 say 'Altura (m)...:'
@ 08,01 say 'Fumante?.....:'
@ 08,18 say '[S]im [N]ao'

// lOpcaoSexo      := (cSexoCliente = 'M' .or. cSexoCliente = 'F')
// lOpcaoFumante   := (cClienteFumante = 'S' .or. cClienteFumante = 'N')
@ 04,16 get cNomeCliente    picture '@!'        valid !Empty(cNomeCliente)
@ 04,64 get nIdadeCliente   picture '999'       valid !Empty(nIdadeCliente) .and. nIdadeCliente >= 0 .and. nIdadeCliente <= 150
@ 05,16 get cSexoCliente    picture '@!'        valid !Empty(cSexoCliente) .and. (cSexoCliente = 'M' .or. cSexoCliente = 'F')
@ 06,16 get nPesoCliente    picture '@E 999.9'  valid !Empty(nPesoCliente) .and. nPesoCliente > 0
@ 07,16 get nAlturaCliente  picture '@E 9.99'   valid !Empty(nAlturaCliente) .and. nAlturaCliente > 0
@ 08,16 get cClienteFumante picture '@!'        valid !Empty(cClienteFumante) .and. (cClienteFumante = 'S' .or. cClienteFumante = 'N')
read 
 
@ 10,00 to 13,79
@ 10,34 say 'dados do plano'    picture '@!'
@ 11,01 say 'Tipo de plano....:'
@ 11,22 say '[E]nf [A]part [V]ip'
@ 12,01 say 'Abrangencia......:'
@ 12,22 say '[R]egional [N]acional'

// lOpcaoPlano         := (cTipoPlano = 'E' .or. cTipoPlano = 'A' .or. cTipoPlano = 'V')
// lOpcaoAbrangencia   := (cAbrangencia = 'S' .or. cAbrangencia = 'N')
@ 11,20 get cTipoPlano          picture '@!'    valid !Empty(cTipoPlano) .and. (cTipoPlano = 'E' .or. cTipoPlano = 'A' .or. cTipoPlano = 'V')
@ 12,20 get cAbrangencia        picture '@!'    valid !Empty(cAbrangencia) .and. (cAbrangencia = 'R' .or. cAbrangencia = 'N')
read 

//Desconto idade
if nIdadeCliente < 30
    nDescontoPerc1 -= 10  
elseif nIdadeCliente > 60
    nDescontoPerc1 += 20   
endif
if nIdadeCliente < 25
    nDescontoPerc2 -= 15   
elseif nIdadeCliente > 65
    nDescontoPerc2 += 25  
endif

//Desconto Sexo
if cSexoCliente = 'M'
    nDescontoPerc1 += 5  
    nDescontoPerc2 -= 5   
elseif cSexoCliente = 'F'
    nDescontoPerc1 -= 5   
    nDescontoPerc2 += 10  
endif

//Desconto imc
nImc   := nPesoCliente / (nAlturaCliente * nAlturaCliente)
if nImc > 30
    nDescontoPerc1 += 15  
endif
if nImc > 25
    nDescontoPerc2 += 10     
endif

//Desconto fumante
if cClienteFumante = 's'
    nDescontoPerc1 += 20    
    nDescontoPerc2 += 25    
endif

//Desconto tipo plano
if cTipoPlano = 'a'
    nDescontoPerc1 += 30
    nDescontoPerc2 += 25    
elseif cTipoPlano = 'v'
    nDescontoPerc1 += 50
    nDescontoPerc2 += 45
endif

//Desconto abrangencia
if cClienteFumante = 'n'
    nDescontoPerc1 += 15    
    nDescontoPerc2 += 10    
endif

//Desconto meses especificos
if Month(dCotacao) == 5
    nDescontoPerc1 -= 10
endif
if Month(dCotacao) == 10
    nDescontoPerc1 -= 15
endif

nValorSaudemensal := nValorSaude + (nDescontoPerc1 * nValorSaude / 100)
nValorVidaMensal  := nValorVida + (nDescontoPerc2 * nValorVida / 100)

nValorMaior      := nValorSaudemensal
if nValorMaior < nValorVidaMensal
    cCorVida  := cCorCara
    cCorSaude := cCorBarata
else
    cCorVida  := cCorBarata
    cCorSaude := cCorCara
endif

nSaudeTrimestral := nValorSaudemensal * 3
nVidaTrimestral  := nValorVidaMensal * 3
nSaudeMensal     := nValorSaudemensal * 12
nVidaMensal      := nValorVidaMensal * 12

SetColor(cCorSaude)

@ 16,00 clear to 20,40

@ 16,00 to 20,40                                     
@ 14,00 to 20,40                                     
@ 15,01 say 'saude total '      picture '@!'
@ 17,01 say 'Mensal.....:'
@ 18,01 say 'Trimestral.:'
@ 19,01 say 'Anual......:'
@ 17,13 say nValorSaudemensal   picture '@E 9,999.99'
@ 18,13 say nSaudeTrimestral    picture '@E 9,999.99'
@ 19,13 say nSaudeMensal        picture '@E 9,999.99'

SetColor(cCorVida)

@ 16,41 clear to 20,79

@ 16,41 to 20,79                                     
@ 14,41 to 20,79                                     
@ 15,42 say 'vida pura   '      picture '@!'
@ 17,42 say 'Mensal.....:'  
@ 18,42 say 'Trimestral.:'  
@ 19,42 say 'Anual......:'  
@ 17,55 say nValorVidaMensal    picture '@E 9,999.99'
@ 18,55 say nVidaTrimestral     picture '@E 9,999.99'
@ 19,55 say nVidaMensal         picture '@E 9,999.99'

nAnoCotacoa     := Year(dCotacao)
nMesCotacao1    := Month(dCotacao) + 1
dMesSeguinte    := CToD('01/'+ Str(nMesCotacao1) + '/' + Str(nAnoCotacoa))
dUltimoDiaMes   := dMesSeguinte - 1

if nAnoCotacoa ==12
    dUltimoDiaMes := CToD('31/12/' + Str(nAnoCotacoa))
endif

@ 24,30 say 'Cotacao valida ate '
@ 24,50 say dUltimoDiaMes
