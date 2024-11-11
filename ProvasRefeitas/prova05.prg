//Cotacao frutaria

set epoch to 1940
set Date brit
set wrap on
set message to 08 center

clear 

cLoja            := 'Frutaria'
n5500            := 5500
n7744            := 7744
n4445            := 4445
n6565            := 6565
cDescricao5500   := 'Amora preta'
cDescricao7744   := 'Uva Rubi'
cDescricao4445   := 'Pepino'
cDescricao6565   := 'Morango'
nPreco5500       := 1.50
nPreco7744       := 8
nPreco4445       := 3.99
nPreco6565       := 15.49
nDescont5500     := 12
nDescont7744     := 11
nDescont4445     := 2
nDescont6565     := 6
nEstoque5500     := 110
nEstoque7744     := 198.5
nEstoque4445     := 445
nEstoque6565     := 200
nPedidoCliente   := 1
nSenhaConfirmada := 1234
nTentativas      := 1
nPedidoTotal     := 0

do while .t.
    @ 01,01 say cLoja   picture '@!'
    @ 03,01 say 'Login:'
    @ 04,01 say 'Senha:'

    do while nTentativas <= 3
        cUsuario         := Space(10)
        nSenha           := 0

        @ 03,08 get cUsuario    picture '@!'    valid !Empty(cUsuario)
        @ 04,08 get nSenha      picture '9999'  valid !Empty(nSenha)
        read

        if nSenhaConfirmada == nSenha
            exit
        else
            nTentativas++
            loop
        endif
    enddo

    if nTentativas == 3
        Alert('Numero de tentativas excedidas, espere 1 hora pra tentar novamente')
        exit
    endif

    do while .t.
        clear

        nOpcaoMenu     := 0
        cCliente       := Space(20)
        nLimite        := 0
        dPedido        := CToD('')

        @ 01,01 prompt 'Efetuar pedidos'
        @ 02,01 prompt 'Sair'
        menu to nOpcaoMenu

        if nOpcaoMenu == 2
            exit
        endif
        clear 

        @ 01,01 say 'Numero Pedido    :'
        @ 01,20 say nPedidoCliente
        @ 02,01 say 'Nome Cliente     :'
        @ 03,01 say 'Limite de credito:'
        @ 04,01 say 'Data do Pedido   :'

        @ 02,20 get cCliente    picture '@!'            valid !Empty(cCliente)
        @ 03,20 get nLimite     picture '@e 99999.99'   valid !Empty(nLimite)
        @ 04,20 get dPedido                             valid !Empty(dPedido)
        read

        if LastKey() == 27
            nOpcaoPreencher := Alert('Deseja cancelar o pedido?', {'Sim', 'Nao'})
            if nOpcaoPreencher == 1
                exit
            else
                loop
            endif
        endif 

        Inkey(0)
        clear
       
        @ 01,01 say 'Codigo'
        @ 01,09 say 'Produto'
        @ 01,22 say 'Preco Unit'
        @ 01,34 say 'Max Desconto'
        @ 01,48 say 'Estoque'
        @ 02,01 say AllTrim(Str(n5500))
        @ 02,09 say cDescricao5500
        @ 02,24 say nPreco5500      picture '@e 99.99'
        @ 02,38 say nDescont5500    picture '@e 99.99'
        @ 02,50 say nEstoque5500    picture '@e 999.99'
        @ 03,01 say AllTrim(Str(n7744))
        @ 03,09 say cDescricao7744
        @ 03,24 say nPreco7744      picture '@e 99.99'
        @ 03,38 say nDescont7744    picture '@e 99.99'
        @ 03,50 say nEstoque7744    picture '@e 999.99'
        @ 04,01 say AllTrim(Str(n4445))
        @ 04,09 say cDescricao4445
        @ 04,24 say nPreco4445      picture '@e 99.99'
        @ 04,38 say nDescont4445    picture '@e 99.99'
        @ 04,50 say nEstoque4445    picture '@e 999.99'
        @ 05,01 say AllTrim(Str(n6565))
        @ 05,09 say cDescricao6565
        @ 05,24 say nPreco6565      picture '@e 99.99'
        @ 05,38 say nDescont6565    picture '@e 99.99'
        @ 05,50 say nEstoque6565    picture '@e 999.99'

        Inkey(0)

        @ 07,01 say 'No'
        @ 07,04 say 'Codigo'
        @ 07,11 say 'Descricao'
        @ 07,23 say 'Qtd'
        @ 07,30 say 'P. Unico'
        @ 07,40 say 'Desc'
        @ 07,46 say 'TOTAL'

        nLinha      := 8
        nLinha1     := nLinha + 2
        nLinha2     := nLinha + 3
        nNovoLimite := nLimite
        do while nPedidoTotal <= nLimite
            nCodigo         := 0
            nQtd            := 0
            nPreco          := 0
            nLimiteDesconto := 0
            nDesconto       := 0
            nTotal          := 0

            @ nLinha,01 say nPedidoCliente

            @ nLinha,04 get nCodigo     picture '9999'      valid (nCodigo == 5500) .or. (nCodigo == 7744) .or. (nCodigo == 4445) .or. (nCodigo == 6565)
            @ nLinha,23 get nQtd        picture '999.99'    valid nQtd > 0
            @ nLinha,40 get nDesconto   picture '@e 999.99' valid nDesconto <= nLimiteDesconto
            read 

            if LastKey() == 27
                nOpcaoParar := Alert('Parar de cadastrar', {'Sim', 'Nao'})
                if nOpcaoParar == 1
                    exit
                else
                    loop
                endif
            endif

            if nCodigo == 5500
                @ nLinha,11 say cDescricao5500
                @ nLinha,25 say nPreco5500
                nPreco          := nPreco5500
                nLimiteDesconto := nDescont5500
                nEstoque5500    -= nQtd
            endif
            if nCodigo == 7744
                @ nLinha,11 say cDescricao7744
                @ nLinha,25 say nPreco7744
                nPreco := nPreco7744
                nLimiteDesconto := nDescont7744
                nEstoque7744    -= nQtd
            endif
            if nCodigo == 4445
                @ nLinha,11 say cDescricao4445
                @ nLinha,25 say nPreco4445
                nPreco := nPreco4445
                nLimiteDesconto := nDescont4445
                nEstoque4445    -= nQtd
            endif
            if nCodigo == 6565
                @ nLinha,11 say cDescricao6565
                @ nLinha,25 say nPreco6565
                nPreco := nPreco6565
                nLimiteDesconto := nDescont6565
                nEstoque6565    -= nQtd
            endif

            nTotal := nPreco * nQtd
            nPedidoTotal += nTotal

            @ nLinha,46  say nTotal                 picture '@e 99999.99'
            @ nLinha1,46 say nPedidoTotal           picture '@e 99999.99'
            @ nLinha2,46 say nNovoLimite - nTotal   picture '@e 99999.99'

            Inkey(0)

            @ 02,48 say nEstoque5500
            @ 03,48 say nEstoque7744
            @ 04,48 say nEstoque4445
            @ 05,48 say nEstoque6565

            nLinha++
        enddo  

        Inkey(0)
        nPedidoCliente++
    enddo

    if LastKey() == 27
        nOpcaoSair := Alert('Encerrar o programa?', {'Sim', 'Nao'})
        if nOpcaoSair == 1
            exit
        else
            loop
        endif
    endif

enddo
