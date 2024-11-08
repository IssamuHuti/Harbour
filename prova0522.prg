// Lucas Issamu Morino Yamahuti

set Date brit 
set epoch to 1940
set message to 12 center
set wrap on 

clear 

cUsuario       := Space(10)
cSenha         := Space(4)
nPedido        := 1
cCliente       := Space(20)
nLimiteCredito := 0
dPedido        := CToD('')
nCodAmoraPreta := 5500
nCodUvaRubi    := 7744
nCodPepino     := 4445
nCodMorango    := 6565
cCod5500       := 'Amora preta'
cCod7744       := 'Uva Rubi'
cCod4445       := 'Pepino'
cCod6565       := 'Morango'
nPreco5500     := 1.5
nPreco7744     := 8
nPreco4445     := 3.99
nPreco6565     := 15.49
nEstoque5500   := 110
nEstoque7744   := 198.5
nEstoque4445   := 445
nEstoque6565   := 200
nDesc5500      := 12
nDesc7744      := 11
nDesc4445      := 2
nDesc6565      := 6
nTotal5500     := 0
nTotal7744     := 0
nTotal4445     := 0
nTotal6565     := 0
cPermicaoSenha := '0123456789'
lDigito        := .f.
nDigito        := 1

do while .t.
    clear

    @ 01,01 say 'FRUTARIA LUCAS'
    @ 03,01 say 'Login:'
    @ 04,01 say 'Senha:'

    do while .t.
        @ 03,08 get cUsuario    picture '@!'      valid !Empty(cUsuario)
        @ 04,08 get cSenha      picture '@!'      valid !Empty(cSenha)
        read

        cConfirmacaoSenha := ''
        if Len(cSenha) == 4
            do while nDigito < Len(cSenha) 
                if SubStr(cSenha, nDigito, 1) $ cPermicaoSenha
                    nDigito++
                    cConfirmacaoSenha += SubStr(cSenha, nDigito, 1)
                endif
            enddo
            exit
        else
            loop
        endif

        if cSenha == cConfirmacaoSenha
            exit
        else
            loop
        endif
    enddo        

    clear

    nOpcaoMenu  := 0
    @ 01,01 say 'FRUTARIA LUCAS'
    @ 03,01 prompt 'Efetuar pedidos'    message 'Solicitacao de pedidos'
    @ 04,01 prompt 'Sair'               message 'Sair do programa'
    menu to nOpcaoMenu

    if nOpcaoMenu == 2
        exit
    elseif nOpcaoMenu == 0
        exit
    else
        clear 
        @ 01,01 say 'Numero Pedido :'
        @ 01,17 say nPedido
        @ 02,01 say 'Cliente       :'
        @ 03,01 say 'Limite Credito:'
        @ 04,01 say 'Data Pedido   :'

        @ 02,17 get cCliente        picture '@!'            valid !Empty(cCliente)
        @ 03,17 get nLimiteCredito  picture '@e 99999.99'   valid !Empty(nLimiteCredito) .and. nLimiteCredito > 0
        @ 04,17 get dPedido                                 valid !Empty(dPedido) .and. dPedido <= Date()
        read 

        nPedido++

        clear 

        nLinha  := 9
        do while .t.
            @ 01,01 say 'FRUTAS A VENDA'
            @ 02,01 say 'Codigo'
            @ 02,08 say 'Descricao do produto'
            @ 02,30 say 'Preco Unit.'
            @ 02,43 say '% Max Desconto'
            @ 02,59 say 'Estoque'
            @ 03,01 say AllTrim(Str(nCodAmoraPreta))
            @ 03,08 say cCod5500
            @ 03,25 say nPreco5500  picture '@e 99.99'
            @ 03,40 say nDesc5500
            @ 03,54 say nEstoque5500
            @ 04,01 say AllTrim(Str(nCodUvaRubi))
            @ 04,08 say cCod7744
            @ 04,25 say nPreco7744  picture '@e 99.99'
            @ 04,40 say nDesc7744
            @ 04,54 say nEstoque7744
            @ 05,01 say AllTrim(Str(nCodPepino))
            @ 05,08 say cCod4445
            @ 05,25 say nPreco4445  picture '@e 99.99'
            @ 05,40 say nDesc4445
            @ 05,54 say nEstoque4445
            @ 06,01 say AllTrim(Str(nCodMorango))
            @ 06,08 say cCod6565
            @ 06,25 say nPreco6565  picture '@e 99.99'
            @ 06,40 say nDesc6565
            @ 06,54 say nEstoque6565

            nPedidoProduto := 1
            nCodigo        := 0
            nQtd           := 0
            nDesc          := 0
            nTotal         := 0
            cPedido        := ''
            nLinha2        := nLinha + 2
            nLinha3        := nLinha + 3
            @ 08,01 say 'FRUTAS A VENDA'
            @ 08,01 say 'Pedido'
            @ 08,08 say 'Descricao do produto'
            @ 08,30 say 'Preco Unit.'
            @ 08,43 say '% Max Desconto'
            @ 08,59 say 'Quantidade'
            @ 08,70 say 'Total'

            @ nLinha,01 get nCodigo     picture '9999'    valid (nCodigo == nCodAmoraPreta) .or. (nCodigo == nCodMorango) .or. (nCodigo == nCodPepino) .or. (nCodigo == nCodUvaRubi)
            read 

            if LastKey() == 27
                nOpcao = Alert('Parar de incluir produtos?', {'Sim', 'Nao'})
                if nOpcao == 2
                    loop
                else
                    exit
                endif
            endif

            if nCodigo == nCodAmoraPreta
                @ nLinha,08 say cCod5500
                @ nLinha,30 say nPreco5500  picture '@e 99.99'

                do while .t.
                    @ nLinha,43 get nDesc       picture '@e 99.99'  valid (nDesc >= 0)
                    read
                    if nDesc > nDesc5500
                        Alert('Forneca um desconto menor do que o limite estabelecido')
                        loop
                    else
                        exit
                    endif
                enddo
            
                @ nLinha,59 get nQtd        picture '999.99'    valid (nQtd <= nEstoque5500) .and. !Empty(nQtd)
                read

                nEstoque5500 -= nQtd
                if nEstoque5500 >= 0
                    nTotal5500 := nPreco5500 * nQtd - (nPreco5500 * nQtd * nDesc5500 / 100)
                else
                    Alert('Quantidade acima do estoque, limitamos a quantidade para o estoque atual da loja')
                    nTotal5500   := nPreco5500 * nEstoque5500 - (nPreco5500 * nQtd * nDesc5500 / 100)
                    nEstoque5500 := 0
                    nQtd         := nEstoque5500
                endif
                @ nLinha,70 say AllTrim(Str(nTotal5500))
                nTotal += nTotal5500
            elseif nCodigo == nCodMorango
                @ nLinha,08 say cCod6565
                @ nLinha,30 say nPreco6565  picture '@e 99.99'

                do while .t.
                    @ nLinha,43 get nDesc       picture '@e 99.99'  valid (nDesc >= 0)
                    read
                    if nDesc > nDesc6565
                        Alert('Forneca um desconto menor do que o limite estabelecido')
                        loop
                    else
                        exit
                    endif
                enddo

                @ nLinha,59 get nQtd        picture '999.99'    valid (nQtd <= nEstoque6565) .and. !Empty(nQtd)
                read
                
                nEstoque6565 -= nQtd
                if nEstoque6565 >= 0
                    nTotal6565 := nPreco6565 * nQtd - (nPreco6565 * nQtd * nDesc6565 / 100)
                else
                    Alert('Quantidade acima do estoque, limitamos a quantidade para o estoque atual da loja')
                    nTotal6565   := nPreco6565 * nEstoque6565 - (nPreco6565 * nQtd * nDesc6565 / 100)
                    nEstoque6565 := 0
                    nQtd         := nEstoque6565
                endif
                @ nLinha,70 say AllTrim(Str(nTotal6565))
                nTotal += nTotal6565
            elseif nCodigo == nCodPepino
                @ nLinha,08 say cCod4445
                @ nLinha,30 say nPreco4445  picture '@e 99.99'

                do while .t.
                    @ nLinha,43 get nDesc       picture '@e 99.99'  valid (nDesc >= 0)
                    read
                    if nDesc > nDesc4445
                        Alert('Forneca um desconto menor do que o limite estabelecido')
                        loop
                    else
                        exit
                    endif
                enddo

                @ nLinha,59 get nQtd        picture '999.99'    valid (nQtd <= nEstoque4445) .and. !Empty(nQtd)
                read
                
                nEstoque4445 -= nQtd
                if nEstoque4445 >= 0
                    nTotal4445 := nPreco4445 * nQtd - (nPreco4445 * nQtd * nDesc4445 / 100)
                else
                    Alert('Quantidade acima do estoque, limitamos a quantidade para o estoque atual da loja')
                    nTotal4445   := nPreco4445 * nEstoque4445 - (nPreco4445 * nQtd * nDesc4445 / 100)
                    nEstoque4445 := 0
                    nQtd         := nEstoque4445
                endif
                @ nLinha,70 say AllTrim(Str(nTotal4445))
                nTotal += nTotal4445
            elseif nCodigo == nCodUvaRubi
                @ nLinha,08 say cCod7744
                @ nLinha,30 say nPreco7744  picture '@e 99.99'

                do while .t.
                    @ nLinha,43 get nDesc       picture '@e 99.99'  valid (nDesc >= 0)
                    read
                    if nDesc > nDesc7744
                        Alert('Forneca um desconto menor do que o limite estabelecido')
                        loop
                    else
                        exit
                    endif
                enddo

                @ nLinha,59 get nQtd        picture '999.99'    valid (nQtd <= nEstoque7744) .and. !Empty(nQtd)
                read
                
                nEstoque7744 -= nQtd
                if nEstoque7744 >= 0
                    nTotal7744 := nPreco7744 * nQtd - (nPreco7744 * nQtd * nDesc7744 / 100)
                else
                    Alert('Quantidade acima do estoque, limitamos a quantidade para o estoque atual da loja')
                    nTotal7744   := nPreco7744 * nEstoque7744 - (nPreco7744 * nQtd * nDesc7744 / 100)
                    nEstoque7744 := 0
                    nQtd         := nEstoque7744
                endif
                @ nLinha,70 say AllTrim(Str(nTotal7744))
                nTotal += nTotal7744
            endif

            nLimiteCredito -= nTotal

            if nLimiteCredito < 0 
                Alert('Ultrapassou o limite de crédito, finalize os pedidos ou peça menos quantidade')
                nLimiteCredito += nTotal
                loop
            endif

            @ nLinha,01 clear to 10,13
            
            @ nLinha2,60 say 'TOTAL'
            @ nLinha2,70 say AllTrim(Str(nTotal))           picture '@e 9999.99'
            @ nLinha3,60 say 'LIMITE'
            @ nLinha3,70 say AllTrim(Str(nLimiteCredito))   picture '@e 9999.99'

            Inkey(0)
            if nLinha3 == 25
                @ 09,01 clear to 25,80
            endif

            @ nLinha2,01 clear to nLinha3,80
            nPedidoProduto++
            nLinha++
        enddo

    endif

enddo