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
lValidacaoLogin  := .f.
lValidacaoSenha  := .f.
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

@ 00,00 to 25,75 double 
@ 00,30 say cNomeFrutaria   picture '@!'

do while .t.
    do while !lValidacaoLogin .and. !lValidacaoSenha
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

        if AllTrim(cLogin) == cLoginCadastrado
            lValidacaoLogin := .t.
        endif 
        if AllTrim(cSenha) == cSenhaCadastrado
            lValidacaoSenha  := .t.
        endif 

        if !lValidacaoSenha
            cAlerta += 'Senha '
        endif 
        if !lValidacaoLogin
            cAlerta += 'Login '
        endif 
        
        if !lValidacaoLogin .and. !lValidacaoSenha
            Alert(cAlerta + 'incorretas, tente novamente!')
            @ 01,01 clear to 24,74
        endif 
    enddo

    if nOpcaoPrograma == 1
        exit 
    endif 
    
    Alert('Bem Vindo ' + cLogin)
    @ 01,01 clear to 24,74

    do while .t. 
        
        @ 10,30 prompt 'Efetuar pedidos'    message 'Efetuar pedidos'
        @ 11,30 prompt 'Sair'               message 'Sair'
        menu to nOpcaoMenu

        @ 01,01 clear to 24,74

        if nOpcaoMenu == 1
            nPedido++
            nLimite  := 0
            cCliente := Space(20)
            dDataPedido := dDataAtual

            @ 01,01 to 04,74
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
            @ 05,01 to 11,74
            @ 05,30 say 'Tabela produtos' picture '@!'
            nLimiteAtualizada := nLimite
            nValorProdutoTotal := 0

            do while nLimite >= nValorProdutoTotal
                nCodigo            := 0
                cDescricaoProduto  := ''
                nPrecoProduto      := 0
                nDescontoProduto   := 0
                nQtdProduto        := 0
                
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
                @ 07,66 say nEstoque1   picture '@E 999.99'
                @ 08,66 say nEstoque2   picture '@E 999.99'
                @ 09,66 say nEstoque3   picture '@E 999.99'
                @ 10,66 say nEstoque4   picture '@E 999.99'
                
                @ 12,01 to 24,74
                @ 12,30 say 'Pedido'        picture '@!'
                @ 13,02 say 'Codigo |   descricao   | unit | desc % |  Qtd  | Valor Total'   picture '@!'
                @ 22,02 say Replicate('-', 60)
                
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
                
                if !(AllTrim(Str(nCodigo)) $ nTodososCodigos)
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
                
                nValorProduto      := nPrecoProduto * nQtdSolicitado - (nPrecoProduto * nQtdSolicitado * (nDescontoSolicitado / 100))
                nValorProdutoTotal += nValorProduto
                
                @ nContLinha,51 say nValorProduto  picture '@E 99,999.99'
                
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
                    nLimite += nValorProduto
                    nValorProdutoTotal -= nValorProduto
                    nOpcaoCancelar := Alert('Ultrapassou o limite, solicite novamente ou saia do programa', {'Solicitar', 'Sair'})
                    if nOpcaoCancelar == 1
                        loop 
                    else
                        exit 
                    endif   
                endif 

                @ 23,02 say 'limite'            picture '@!'
                @ 23,10 say nLimiteAtualizada   picture '@E 99,999.99'  color cCorLimite
                @ 23,35 say 'valor total'       picture '@!'
                @ 23,47 say nValorProdutoTotal  picture '@E 99,999.99'
                
                nContLinha++
                if nContLinha == 22
                    nContLinha := 14
                    @ nContLinha,02 clear to 22,73 
                endif 
            enddo

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
