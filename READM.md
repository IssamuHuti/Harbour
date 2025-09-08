Atalhos
ctrl + "'" - abre terminal de comando
ctrl + "B" - abre/fecha aba esquerda
ctrl + "D" - seleciona palavras semelhantes
ctrl + ";" - comenta uma linha
ctrl + "L" - seleciona toda a linha
Alt + seta pra cima/baixo - movimenta a linha
Alt + seta pra lado = altera as janelas
ctrl + "+/-" - aumenta e diminui zoom
ctrl + shift + "P" = abre um cursor de comando
ctrl + shift + alt = seleciona a mesma coluna da linha acima ou abaixo

roda pé
"Spaces:" - informa a quantidade de linhas que serão puladas com "tab"
"UTF-8" - informa a linguagem utilizada 


get
* permite a insersao de informação pelo usuário
* para get funcionar, precisa mandar read para rodar
* para cada get, se da uma parada
* se o read for informado depois de um print que está abaixo da linha do get, o programa irá informar o local para digitar e a informação que foi apresentada depois do get que está acima do read
* para incluir caracter criar uma variavel com:
    - sLetra := Space(10) // informa até 10 caracteres
    - sLetra := '          ' // informa até 10 caracteres
* exemplo:
    - @ 01,01 get nIdade
    - @ 02,01 get nQuantidade
    - @ 03,01 get nPreco
    - @ 04,01 get nTemperatura
read

data
* dAtual := Date() -> variavel recebe a data atual da maquina
    - se somar/subtrair um número altera por dia
* dNascimento := CToD('') -> permite digitar uma data qualquer, transforma string em data
* dFixa := CToD('01/01/12') - > a variavel recebe uma data fixa
* DToC (dData) // transforma um dado de data em string
* se quiser extrair um dado especifico da data
    - dExemplo      := Date()
    - nAno          := Year(dExemplo)
    - nMes          := Month(dExemplo)
    - nDia          := Day(dExemplo)
    - nDiaSemana    := DoW(dExemplo) (1 - domingo, 2 - segunda, ... 7 - sabado)
* não tem picture
* tem valid
* configuração antes do clear:
    - set date to british // converte o padrão de data americano de mm/dd/aa para britanico dd/mm/aa
    - set epach to 1940 // começa a contagem de data a partir de 1940 até 2039
* exemplo:
    - @ 01,01 get dNascimento valid dNascimento <= dAtual


valid
* pode ser usada somente tiver get na mesma linha
* ela demonstra valor lógico, .t. ou .f.
* se o valor incluido pelo get não for válido, precisa apagar o conteúdo errado e informar o correto para continuar o programa
* exemplo:
    - @ 01,01 get nIdade       picture '999'      valid nIdade >= 0
    - @ 02,01 get nQuantidade  picture '999.99'   valid nQuantidade > 0
    - @ 03,01 get nPreco       picture '@e 999.99 valid nPreco >= 0
    - @ 04,01 get nTemperatura picture '999.99'   valid nTemperatura >= -10 .and. nTemperatura <= 50 // o valor negativo conta como caracter
      read
* !Empty(variavel) valida se o variável está vazio ou não

margens
* @ 00,00 to 20,50 -> cria uma margem 
* @ 00,00 to 20,50 double-> cria uma margem com linha dupla 
* @ 01,01 clear to 19,49 -> limpa a tela da área determinada


parada
* inkey() // pausa o programa
    - se informar 0 pausa o programa ate digitar qualquer tecla
    - se informar qualquer dígito acima do 0 será um temporizador em segundos


if/elseif/else/endif
* if     // inicia condicional
* elseif // se tiver mais condições especificas
* else   // qualquer outra informação que não foi integrada nas condições anteriores
* endif  // finaliza cada indentação de if


cores
* troca de cor da letra e fundo
    - set color to 'b/g' // configura toda a janela 
    - @ 02,01 say 'alguma coisa' colocar 'r/gr' // configura somente a linha que foi digitada o 'color'
    - primeiro argumento antes do '/' configura cor da letra e o segundo o fundo
    - se deixar de informar um dos dois argumentos, utiliza a configuração padrão
* cores:
    - 'n'  = preto
    - 'w'  = branco
    - 'b'  = azul
    - 'g'  = verde
    - 'r'  = vermelho
    - 'gr' = amarelo

set
* são configurações que irão alterar as configurações padrões
* exemplos:
    - set date brit
    - set epoch to 1940
    - set color to 'b/g'


operadores de comparacao
* o operador '$' informa se um número está dentro do outro
    - 'a' $ 'bca' - o 'a' está contido no 'bca'
    - 'a' $ 'BCA' - o 'a' não está contido no 'BCA'
    - 'ca' $ 'bca' - o 'ca' está contido no 'bca', o 'ca' tem que estar exatamente do jeito que foi comparada, não por letra
    - 'aBc' $ 'abc' - o 'aBa' não está contido no 'abc'

'a' = 'A' certo
'a' != 'A' diferente
'a' == 'A' diferente
!('a' == 'A') certo

do while
* expressão:
    do while <condição>
    ...<codigo>
    enddo
* <exit> força a saida da repetição
* <loop> força a voltar a repetição do começo

LastKey()
* ultima tecla pressionada pelo usuário
* informar sempre após informar um read, é possível de utilizar ela quando recebe a tecla pelo Inkey(0)
* padrão usada no SG, 'ESC'
    LastKey() == 27
* usada bastante para finalizar um loop
    if LastKey() == 27
        exit

pastry
Ctrl + Shift + P -> Patry
* coloca em sequencia nos lugares que selecionar em sequencia em numero ou em alfabeto

alert
* sintaxe = Alert(<cMenagem>, <nOpcao>)
* geralmente usa dentro do LastKey
* pode colocar Alert durante o programa para informar alguma coisa
* se informar 'Esc' na validação das opções, ela vai ter um valor nulo, que no caso equivaleria a valor '0'
* exemplo:
    do while .t.
        @ 01,01 get nIdade picture '99' valid nIdade > 0
        read

        if LastKey() == 27
            nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'})
            if nOpcao == 1
                exit
            endif
        endif

    enddo

SubStr()
* estrutura 
    SubStr(<string>, <posicao inical da qual vai comecar>, <numero de caracteres que vai ser extraido>)
* a SubStr funciona sem a opção da quantidade de caracteres a ser extraido

message
* configuração: set message to <linha da chamada do message>
* prompt permite navegar entre opções
* set wrap on = permite retornar na primeira opcao assim que chegar no ultimo
* exemplo:
    nOpcao := 0
    @ 01,01 prompt 'Cadastrar ' message 'Cadastra Senhas'
    @ 02,01 prompt 'Consultar ' message 'Consulta Senhas'
    @ 03,01 prompt 'Sair      ' message 'Sai do programa'
    menu to nOpcao
