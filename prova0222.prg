// Lucas Issamu Morino Yamahuti

set date brit 
set epoch to 1940

clear 

cCliente       := Space(30)
nIdade         := 0
cSexo          := Space(1)
nAnoCnh        := 0
cVendedor      := Space(30)
dCotacao       := CToD('')
cMarca         := Space(20)
nAnoFabricacao := 0
cTipoVeiculo   := Space(1)
nMotor         := 0
nValorFipe     := 0
cUsoVeiculo    := Space(1)
nPercBase1     := 6
nPercBase2     := 7
nBaseTotal1    := 0
nBaseTotal2    := 0
nSegurototal1  := 0 
nSegurototal2  := 0 
nMaxAumento1   := 0 
nMaxAumento2   := 0 

@ 01,01 say 'COTACAO DE SEGUROS'
@ 02,01 say 'Vendedor'
@ 03,01 say 'Data da cotacao'
@ 05,01 say 'CLIENTE'
@ 06,01 say 'Nome:'
@ 07,01 say 'Idade:'
@ 08,01 say 'Sexo:'
@ 09,01 say 'Ano da primeira CNH:'
@ 11,01 say 'DADOS DO VEICULO'
@ 12,01 say 'Marca:'
@ 13,01 say 'Ano fabricacao:'
@ 14,01 say 'Tipo veiculo:'
@ 15,01 say 'Motor:'
@ 16,01 say 'Valor (Tabela Fipe):'
@ 17,01 say 'Uso do veiculo:'

@ 02,10 get cVendedor       picture '@!'                valid !Empty( cVendedor )
@ 03,17 get dCotacao                                    valid !Empty( dCotacao ) .and. dCotacao <= Date()
@ 06,07 get cCliente        picture '@!'                valid !Empty( cCliente )
@ 07,08 get nIdade          picture '999'               valid !Empty( nIdade ) .and. ( nIdade >= 18 ) .and. ( nIdade <= 100 )
@ 08,07 get cSexo           picture '@!'                valid !Empty( cSexo ) .and. ( cSexo == 'M' .or. cSexo == 'F')
@ 09,22 get nAnoCnh         picture '9999'              valid !Empty( cSexo ) .and. ( nAnoCnh >= 1960 ) .and. ( nAnoCnh <= Year( dCotacao ) )
@ 12,08 get cMarca          picture '@!'                valid !Empty( cMarca )
@ 13,17 get nAnoFabricacao  picture '9999'              valid !Empty( nAnoFabricacao ) .and. ( nAnoCnh <= Year( dCotacao ) )
@ 14,15 get cTipoVeiculo    picture '@!'                valid !Empty( cTipoVeiculo ) .and. ( cTipoVeiculo == 'P' .or. cTipoVeiculo == 'E' .or. cTipoVeiculo == 'L' )
@ 15,08 get nMotor          picture '9.9'               valid !Empty( nMotor ) .and. ( nMotor >= 1)
@ 16,22 get nValorFipe      picture '@e 9999999.99'     valid !Empty( nValorFipe )
@ 17,17 get cUsoVeiculo     picture '@!'                valid !Empty( cUsoVeiculo ) .and. ( cUsoVeiculo == 'P' .or. cUsoVeiculo == 'O' )
read 

//Seguradora 1

nBaseTotal1 += nValorFipe * nPercBase1 / 100
nSegurototal1 += nBaseTotal1
nMaxAumento1 = ( Year( dCotacao ) - nAnoFabricacao ) * 0.5
if nMaxAumento1 < 10
    nSegurototal1 += nBaseTotal1 * nMaxAumento1 / 100
else
    nSegurototal1 += nBaseTotal1 * 10 / 100
endif

if ( nIdade < 25 ) .or. ( nIdade > 65 )
    nSegurototal1 += nBaseTotal1 * 0.1
endif 

if cSexo == 'M'
    nSegurototal1 += nBaseTotal1 * 0.1
else
    nSegurototal1 -= nBaseTotal1 * 0.05
endif 

if ( Year( dCotacao ) - nAnoCnh ) <= 3
    nSegurototal1 += nBaseTotal1 * 0.15
elseif ( Year( dCotacao ) - nAnoCnh ) > 8
    nSegurototal1 -= nBaseTotal1 * 0.1
endif 

if cTipoVeiculo == 'E'
    nSegurototal1 += nBaseTotal1 * 0.1
elseif cTipoVeiculo == 'L'
    nSegurototal1 += nBaseTotal1 * 0.2
endif 

if nMotor > 2
    nSegurototal1 += nBaseTotal1 * 0.15
endif

if cUsoVeiculo == 'O'
    nSegurototal1 += nBaseTotal1 * 0.1
endif 

if Month( dCotacao ) == 3
    nSegurototal1 *= 0.9
endif 

@ 19,01 say 'COTACAO ANUAL SEGURADO 1:'
@ 19,27 say str( nSegurototal1 * 1000 )   picture '@e 9999999.99'


//Seguradora 2

nBaseTotal2 += nValorFipe * nPercBase2 / 100
nSegurototal2 += nBaseTotal2

nMaxAumento2 = ( Year( dCotacao ) - nAnoFabricacao ) * 0.5
if nMaxAumento2 < 10
    nSegurototal2 += nBaseTotal2 * nMaxAumento2 / 100
else
    nSegurototal2 += nBaseTotal2 * 10 / 100
endif

if ( nIdade < 23 ) .or. ( nIdade > 60 )
    nSegurototal2 += nBaseTotal2 * 0.15
elseif ( nIdade > 30 ) .and. ( nIdade < 50 )
    nSegurototal2 -= nBaseTotal2 * 0.08
endif 

if cSexo == 'M'
    nSegurototal2 -= nBaseTotal2 * 0.06
else
    nSegurototal2 += nBaseTotal2 * 0.12
endif 

if ( Year( dCotacao ) - nAnoCnh ) <= 2
    nSegurototal2 += nBaseTotal2 * 0.20
elseif ( Year( dCotacao ) - nAnoCnh ) > 5
    nSegurototal2 -= nBaseTotal2 * 0.08
endif 

if cTipoVeiculo == 'E'
    nSegurototal2 += nBaseTotal2 * 0.15
elseif cTipoVeiculo == 'L'
    nSegurototal2 += nBaseTotal2 * 0.18
endif 

if nMotor >= 1.5
    nSegurototal2 += nBaseTotal2 * 0.1
endif

if cUsoVeiculo == 'O'
    nSegurototal2 += nBaseTotal2 * 0.1
endif 

if Month( dCotacao ) == 9
    nSegurototal2 *= 0.9
endif 

@ 20,01 say 'COTACAO ANUAL SEGURADORA 2:'
@ 20,27 say str( nSegurototal2 * 1000 )   picture '@e 9999999.99'

Inkey(0)

clear

@ 01,01 say 'COTACAO 1'
@ 01,15 say 'COTACAO 2'
if nSegurototal1 > nSegurototal2
    @ 02,01 say nSegurototal1   picture '@e 9999999.99'    color 'g/' 
    @ 02,15 say nSegurototal2   picture '@e 9999999.99'
else
    @ 02,01 say nSegurototal1   picture '@e 9999999.99'
    @ 02,15 say nSegurototal2   picture '@e 9999999.99'    color 'g/'
endif 

@ 05,09 say nSegurototal1
@ 06,09 say nSegurototal2
@ 05,20 say nSegurototal1 / 4
@ 06,20 say nSegurototal2 / 4
@ 05,31 say nSegurototal1 / 12
@ 06,31 say nSegurototal2 / 12
@ 04,14 say 'ANUAL'
@ 04,25 say 'TRIMESTRAL'
@ 04,36 say 'MENSAL'
@ 05,01 say 'SEGURADORA 1'
@ 06,01 say 'SEGURADORA 2'

cMes := Space(10)

if Month( dCotacao ) == 1
    cMes := 'Janeiro'
elseif Month( dCotacao ) == 2
    cMes := 'Fevereiro'
elseif Month( dCotacao ) == 3
    cMes := 'Marco'
elseif Month( dCotacao ) == 4
    cMes := 'Abril'
elseif Month( dCotacao ) == 5
    cMes := 'Maio'
elseif Month( dCotacao ) == 6
    cMes := 'Junho'
elseif Month( dCotacao ) == 7
    cMes := 'Julho'
elseif Month( dCotacao ) == 8
    cMes := 'Agosto'
elseif Month( dCotacao ) == 9
    cMes := 'Setembro'
elseif Month( dCotacao ) == 10
    cMes := 'Outubro'
elseif Month( dCotacao ) == 11
    cMes := 'Novembro'
elseif Month( dCotacao ) == 12
    cMes := 'Dezembro'
endif

nMesSeguinteCotacao := Month( dCotacao ) + 1
nAnoSeguinteCotacao := Year( dCotacao ) + 1
cPrimeiroDia        := '01/' + str( nMesSeguinteCotacao ) + '/' + str( Year( dCotacao ) )
cPrimeiroDiaAno     := '01/01/' + str(nAnoSeguinteCotacao)
dMesSeguinteCotacao := CToD( cPrimeiroDia )
dAnoSeguinteCotacao := CToD( cPrimeiroDiaAno )
dUltimoDiaCotacao   := dMesSeguinteCotacao - 1
dUltimoDiaCotacao12 := dAnoSeguinteCotacao - 1

if Month( dCotacao ) == 12  
    @ 08,01 say 'A cotacao e valida ate ' + str(Day(dUltimoDiaCotacao12)) + ' de ' + cMes + ' de ' + str(Year( dCotacao ))
else 
    @ 08,01 say 'A cotacao e valida ate ' + str(Day(dUltimoDiaCotacao)) + ' de ' + cMes + ' de ' + str(Year( dCotacao ))
endif
