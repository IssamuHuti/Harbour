// Lucas Issamu Morino Yamahuti

set scoreboard off
set epoch to 1940
set date british
SetMode (25,80)
set message to 24 center 
set wrap on  

clear

cNomeFrutaria    := 'Frutas do lucas'
cLoginCadastrado := 'LUCAS'
cSenhaCadastrado := 'ABC12345'
cLoginAdmin      := 'ADMIN'
cSenhaAdmin      := 'ADMIN123'
nCodigo1         := 5500
nCodigo2         := 7744
nCodigo3         := 4445
nCodigo4         := 6565
nTodososCodigos  := '5500774444456565'
cDescricao1      := 'Amora Preta'
cDescricao2      := 'Uva Rubi'
cDescricao3      := 'Pepino'
cDescricao4      := 'Morango'
nPrecoUnit1      := 7.5
nPrecoUnit2      := 18
nPrecoUnit3      := 23.99
nPrecoUnit4      := 5.49
nDescMax1        := 14
nDescMax2        := 17
nDescMax3        := 12
nDescMax4        := 4
nEstoque1        := 210
nEstoque2        := 198.5
nEstoque3        := 345
nEstoque4        := 210
nPedido          := 0
dDataAtual       := Date()
cCorNegativo     := 'r/'
cCorLimite       := 'g/'
nOpcaoPrograma   := 0

@ 00,00 to 25,76 double 
@ 00,30 say cNomeFrutaria   picture '@!'

do while .t.
    do while .t.
        cLogin      := Space(10)
        cSenha      := Space(10)
        nOpcaoMenu  := 0
        cAlerta     := ''
        @ 09,29 to 12,47 double 
        
        @ 10,30 say 'Login:'
        @ 11,30 say 'Senha:'
        
        @ 10,37 get cLogin  picture '@!'    valid !Empty(cLogin)
        @ 11,37 get cSenha  picture '@!'    valid !Empty(cSenha)
        read 
        if LastKey() == 27
            nOpcaoPrograma := Alert('Deseja sair?', {'Sim', 'Nao'})
            if nOpcaoPrograma == 1
                exit 
            else 
                loop
            endif 
        endif 

        if AllTrim(cLogin) == cLoginCadastrado .and. AllTrim(cSenha) == cSenhaCadastrado
            exit
        endif 

        if !(AllTrim(cSenha) == cSenhaCadastrado)
            cAlerta += 'Senha '
        endif 
        if !(AllTrim(cLogin) == cLoginCadastrado)
            cAlerta += 'Login '
        endif 
        
        if !(AllTrim(cSenha) == cSenhaCadastrado) .or. !(AllTrim(cLogin) == cLoginCadastrado)
            Alert(cAlerta + 'incorretas, tente novamente!')
            @ 01,01 clear to 24,75
        endif 
    enddo

    if nOpcaoPrograma == 1
        exit 
    endif 
    
    Alert('Bem Vindo ' + cLogin)
    @ 01,01 clear to 24,75

    do while .t. 
        
        @ 10,30 prompt 'Efetuar pedidos'    message 'Efetuar pedidos'
        @ 11,30 prompt 'Sair'               message 'Sair'
        menu to nOpcaoMenu

        @ 01,01 clear to 24,75

        if nOpcaoMenu == 1
            nPedido++
            nLimite  := 0
            cCliente := Space(20)
            dDataPedido := dDataAtual

            @ 01,01 to 04,75
            @ 02,02 say 'Numero pedido:'
            @ 02,17 say AllTrim(Str(nPedido))
            @ 02,40 say 'Cliente:'
            @ 03,02 say 'Data:'
            @ 03,40 say 'Limite de compra:'

            @ 02,49 get cCliente picture '@!'            valid !Empty(cCliente)
            @ 03,08 get dDataPedido                      valid !Empty(dDataPedido) .and. dDataPedido <= dDataAtual
            @ 03,58 get nLimite  picture '@E 99,999.99'  valid !Empty(nLimite) .and. nLimite > 0
            read 
            if LastKey() == 27
                nOpcao := Alert('Deseja sair do programa?', {'Sim', 'Nao'})
                if nOpcao == 1
                    exit 
                else 
                    loop
                endif 
            endif 
            
            nContLinha := 14
            @ 05,01 to 11,75
            @ 05,30 say 'Tabela produtos' picture '@!'
            nLimiteAtualizada   := nLimite
            nValorProdutoTotal  := 0
            nComissao           := 0
            nDesconto           := 0

            @ 06,02 say 'Codigo | descricao do produto | preco unit. | % max. desconto | estoque'   picture '@!'
            @ 07,02 say '       |                      |             |                 |        '
            @ 08,02 say '       |                      |             |                 |        '
            @ 09,02 say '       |                      |             |                 |        '
            @ 10,02 say '       |                      |             |                 |        '
            @ 07,03 say AllTrim(Str(nCodigo1))
            @ 08,03 say AllTrim(Str(nCodigo2))
            @ 09,03 say AllTrim(Str(nCodigo3))
            @ 10,03 say AllTrim(Str(nCodigo4))
            @ 07,11 say cDescricao1
            @ 08,11 say cDescricao2
            @ 09,11 say cDescricao3
            @ 10,11 say cDescricao4
            @ 07,34 say nPrecoUnit1 picture '@E 99.99'
            @ 08,34 say nPrecoUnit2 picture '@E 99.99' 
            @ 09,34 say nPrecoUnit3 picture '@E 99.99'
            @ 10,34 say nPrecoUnit4 picture '@E 99.99'
            @ 07,53 say nDescMax1   picture '99%'
            @ 08,53 say nDescMax2   picture '99%'
            @ 09,53 say nDescMax3   picture '99%'
            @ 10,53 say nDescMax4   picture '99%'

            cLoginLiberacao := Space(10)
            cSenhaLiberacao := Space(10)
            do while .t.
                nCodigo            := 0
                cDescricaoProduto  := ''
                nPrecoProduto      := 0
                nDescontoProduto   := 0
                nQtdProduto        := 0
                nComissaoProduto   := 0
                
                @ 07,66 say nEstoque1   picture '@E 999.99'
                @ 08,66 say nEstoque2   picture '@E 999.99'
                @ 09,66 say nEstoque3   picture '@E 999.99'
                @ 10,66 say nEstoque4   picture '@E 999.99'
                
                @ 12,01 to 24,75
                @ 12,30 say 'Pedido'        picture '@!'
                @ 13,02 say 'Codigo |   descricao   | unit | desc % |  Qtd  | %Comissao | Valor Total'   picture '@!'
                @ 22,02 say Replicate('-', 73)
                
                @ nContLinha,03 get nCodigo     picture '9999'  valid !Empty(nCodigo)
                read 
                if LastKey() == 27
                    nOpcao := Alert('Finalizar compra?', {'Sim', 'Nao'})
                    if nOpcao == 1
                        exit 
                    else 
                        loop
                    endif 
                endif 
                
                if !(nCodigo == nCodigo1) .and. !(nCodigo == nCodigo2) .and. !(nCodigo == nCodigo3) .and. !(nCodigo == nCodigo4)
                    alert('Codigo nao cadastrado')
                    loop  
                endif 
                
                if nCodigo == nCodigo1
                    cDescricaoProduto := cDescricao1
                    nPrecoProduto     := nPrecoUnit1
                    nDescontoProduto  := nDescMax1
                    nQtdProduto       := nEstoque1
                elseif nCodigo == nCodigo2
                    cDescricaoProduto := cDescricao2
                    nPrecoProduto     := nPrecoUnit2
                    nDescontoProduto  := nDescMax2
                    nQtdProduto       := nEstoque2
                elseif nCodigo == nCodigo3
                    cDescricaoProduto := cDescricao3
                    nPrecoProduto     := nPrecoUnit3
                    nDescontoProduto  := nDescMax3
                    nQtdProduto       := nEstoque3
                elseif nCodigo == nCodigo4
                    cDescricaoProduto := cDescricao4
                    nPrecoProduto     := nPrecoUnit4
                    nDescontoProduto  := nDescMax4
                    nQtdProduto       := nEstoque4
                endif 
                
                nDescontoSolicitado   := 0
                nQtdSolicitado        := 0
                
                @ nContLinha,02 say '       |               |      |        |       |            '
                @ nContLinha,03 say nCodigo             picture '9999'
                @ nContLinha,11 say cDescricaoProduto
                @ nContLinha,27 say nPrecoProduto       picture '@E 99.99'
                do while .t. 
                    @ nContLinha,35 get nDescontoSolicitado picture '99%'
                    read 
                    if LastKey() == 27
                        nOpcao := Alert('Parar o cadastro do produto?', {'Sim', 'Nao'})
                        if nOpcao == 1
                            exit 
                        else 
                            loop
                        endif 
                    endif 
                    
                    if nDescontoSolicitado > nDescontoProduto
                        Alert('Desconto para esse produto deve ser menor que ' + nDescontoProduto)
                        loop
                    else
                        exit 
                    endif 
                enddo
                
                do while .t.
                    @ nContLinha,43 get nQtdSolicitado      picture '@E 999.99' valid !Empty(nQtdSolicitado)
                    read 
                    if LastKey() == 27
                        nOpcao := Alert('Parar o cadastro do produto?', {'Sim', 'Nao'})
                        if nOpcao == 1
                            exit 
                        else 
                            loop
                        endif 
                    endif 
                    
                    if nQtdSolicitado > nQtdProduto
                        Alert('Quantidade solicitado maior do que quantidade em estoque!')
                        loop 
                    else
                        exit 
                    endif 
                enddo

                nDescontoValor := nPrecoProduto * nQtdSolicitado * (nDescontoSolicitado / 100)
                nValorProduto := nPrecoProduto * nQtdSolicitado - nDescontoValor
                nDesconto += nDescontoValor
                
                @ nContLinha,51 get nComissaoProduto     picture '@E 999.99'  valid nComissaoProduto >= 0
                read 
                if LastKey() == 27
                    nOpcao := Alert('Parar o cadastro do produto?', {'Sim', 'Nao'})
                    if nOpcao == 1
                        nDesconto -= nDescontoValor
                        exit 
                    else 
                        loop
                    endif 
                endif 

                nComissaoValor := nComissaoProduto * nValorProduto / 100
                nComissao += nComissaoValor
                nValorProduto += nComissaoValor
                nValorProdutoTotal += nValorProduto
                
                @ nContLinha,65 say nValorProduto  picture '@E 99,999.99'
                
                nLimiteAtualizada -= nValorProduto
                if nCodigo == nCodigo1
                    nEstoque1 -= nQtdSolicitado
                elseif nCodigo == nCodigo2
                    nEstoque2 -= nQtdSolicitado
                elseif nCodigo == nCodigo3
                    nEstoque3 -= nQtdSolicitado
                elseif nCodigo == nCodigo4
                    nEstoque4 -= nQtdSolicitado
                endif 

                if nLimite < nValorProdutoTotal
                    Alert('Limite ultrapassado, chamar o supervisor para liberar o limite!')
                    
                    @ 22,05 say 'LIberar Limite' picture '@!'
                    @ 23,03 say 'Login:'   picture '@!'
                    @ 23,35 say 'Senha:'   picture '@!'

                    @ 23,10 get cLoginLiberacao picture '@!'    valid !Empty(cLoginLiberacao)
                    @ 23,42 get cSenhaLiberacao picture '@!'    valid !Empty(cSenhaLiberacao)
                    read
                    if LastKey() == 27
                        nCancelarLiberacao := Alert('Sobre o ultimo pedido?',{'Cancelar', 'Finalizar'})
                        if nCancelarLiberacao == 1
                            nLimiteAtualizada += nValorProduto
                            nValorProdutoTotal -= nValorProduto
                            loop 
                        elseif nCancelarLiberacao == 2
                            exit 
                        endif
                    endif 

                    if !(AllTrim(cLoginLiberacao) == cLoginAdmin) .or. !(AllTrim(cSenhaLiberacao) == cSenhaAdmin)
                        nLimiteAtualizada += nValorProduto
                        nValorProdutoTotal -= nValorProduto
                        Alert('Login ou senha incorretas, ultimo cadastro sera excluido')
                        loop 
                    endif 

                    @ 22,03 clear to 23,74
                endif 

                @ 23,02 say 'credito'           picture '@!'
                @ 23,10 say nLimiteAtualizada   picture '@E 99,999.99'  color cCorLimite
                @ 23,35 say 'valor total'       picture '@!'
                @ 23,47 say nValorProdutoTotal  picture '@E 99,999.99'
                
                nContLinha++
                if nContLinha == 22
                    nContLinha := 14
                    @ nContLinha,02 clear to 22,74 
                endif 
            enddo
            
            @ 05,01 clear to 24,75

            @ 05,01 say 'Descontos fornecidos no pedido R$ ' + Transform(nDesconto, '@E 999999.99')
            @ 06,01 say 'Comissao paga no pedido        R$ ' + Transform(nComissao, '@E 999999.99')
            @ 07,01 say 'Valor total do pedido          R$ ' + Transform(nValorProdutoTotal, '@E 999999.99')

            @ 09,01 to 14,75
            @ 09,03 say 'formas de pagamento'   picture '@!'
            @ 09,48 say 'Valor da compra: ' + Transform(nValorProdutoTotal, '@E 999999.99')
            
            nContPagamentos := 1
            cTipoPagamento1 := '1 - Dinheiro'
            cTipoPagamento2 := '2 - Cheque'
            cTipoPagamento3 := '3 - Cartao de credito'
            cCadastroPgto   := ''
            do while nContPagamentos <= 3
                nOpcaoPagamento := 0

                @ 10,02 say cTipoPagamento1 picture '@!'
                @ 11,02 say cTipoPagamento2 picture '@!'
                @ 12,02 say cTipoPagamento3 picture '@!'
                @ 13,02 say 'Escolha a forma de pagamento:'

                @ 13,31 get nOpcaoPagamento picture '9' valid Str(nOpcaoPagamento) $ '123'
                read 

                if AllTrim(Str(nOpcaoPagamento)) $ cCadastroPgto
                    Alert('Forma de pagamento ja cadastrado!')
                    loop 
                endif 
                cCadastroPgto += AllTrim(Str(nOpcaoPagamento))
                
                nContPagamentos++

                nCadastrarPagamentos := Alert('Deseja informar mais formas de pagamento?', {'Sim', 'Nao'})
                if nCadastrarPagamentos == 1
                    loop 
                else
                    exit 
                endif 
            enddo
            
            cDescricaoPagamento := ''
            if Len(cCadastroPgto) == 1
                cDescricaoPagamento := 'pagamento'
            else
                cDescricaoPagamento := 'Como sera realizada o pagamento'
            endif 
            
            @ 16,02 say cDescricaoPagamento picture '@!'

            nLinhasPagamento := 17
            nTotalPagar      := nValorProdutoTotal
            if '1' $ cCadastroPgto
                nTroco      := 0
                nDinheiro   := 0
                @ nLinhasPagamento,02   say 'dinheiro | R$' picture '@!'

                if Len(cCadastroPgto) == 1
                    @ nLinhasPagamento,15 get nDinheiro picture '@E 999999.99'  valid !Empty(nDinheiro) .and. nDinheiro >= nValorProdutoTotal
                    read 
                    
                    nTroco := nDinheiro - nTotalPagar
                    @ nLinhasPagamento,30 say 'Troco' +  + Transform(nTroco, '@E 999999.99')   picture '@!'

                else
                    @ nLinhasPagamento,15 get nDinheiro picture '@E 999999.99'  valid !Empty(nDinheiro) .and. nDinheiro > 0
                    read 

                    nTotalPagar -= nDinheiro
                endif 
                nLinhasPagamento++
            endif 

            if '2' $ cCadastroPgto
                nPgtoCheque := 0
                nBanco      := 0
                nAgencia    := 0
                nCodConta   := 0
                nNroCheuqe  := 0

                if Len(cCadastroPgto) == 1
                    @ nLinhasPagamento++,02 say 'cheque | R$ ' + Transform(nTotalPagar, '@E 999999.99')   picture '@!'
                else 
                    @ nLinhasPagamento,02   say 'cheque | R$ '   picture '@!'

                    @ nLinhasPagamento++,14 get nPgtoCheque   picture '@E 999999.99'
                    read 
                    
                    nTotalPagar -= nPgtoCheque
                endif 

                @ nLinhasPagamento++,02 say 'informe os seguintes dados para pagamento'
                @ nLinhasPagamento,02   say 'Banco:    Agencia:     Cod. Conta:           Nro Cheque:      '

                @ nLinhasPagamento,08 get nBanco     picture '999'        valid !Empty(nBanco)
                @ nLinhasPagamento,20 get nAgencia   picture '9999'       valid !Empty(nAgencia)
                @ nLinhasPagamento,36 get nCodConta  picture '9999999999' valid !Empty(nCodConta)
                @ nLinhasPagamento,58 get nNroCheuqe picture '999999'     valid !Empty(nNroCheuqe)
                read 

                nLinhasPagamento++
            endif 

            if '3' $ cCadastroPgto
                nQtdParcelas := 0

                @ nLinhasPagamento++,02 say 'cartao | R$ ' + Transform(nTotalPagar, '@E 999999.99')   picture '@!'
                @ nLinhasPagamento,02 say 'Em quantas parcelas sera paga?'

                @ nLinhasPagamento,33 get nQtdParcelas  picture '99'    valid !Empty(nQtdParcelas) .and. nQtdParcelas > 0
                read 

                nValorParcela := nTotalPagar / nQtdParcelas

                nLinhasPagamento++
                @ nLinhasPagamento++,02 say 'Nro Parcela |   Valor   | vencimento'
                
                nContParela     := 1
                dDataVencimento := dDataPedido + 30
                do while nContParela <= nQtdParcelas
                    @ nLinhasPagamento,07 say nContParela
                    @ nLinhasPagamento,15 say nValorParcela     picture '@E 999999.99'
                    @ nLinhasPagamento,28 say dDataVencimento

                    dDataVencimento += 30
                    nContParela++
                enddo

            endif 

            Inkey(0)

            nOpcaoNovoPedido := Alert('Pedido Finalizado! Deseja solicitar um novo pedido?', {'Solicitar', 'Sair'})
            if nOpcaoNovoPedido == 1
                loop
            else
                exit 
            endif 

        elseif nOpcaoMenu == 2
            exit 
        endif 
        
    enddo

    nOpcaoParar := Alert('Deseja parar o programa?', {'Sim', 'Nao'})
    if nOpcaoParar == 1
        exit 
    else 
        loop
    endif 

enddo
