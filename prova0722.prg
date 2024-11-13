// Lucas Issamu Morino Yamahuti

set wrap on
set message to 12 center
set Date brit 
set epoch to 1940

clear 

cLogin          := 'ADMIN'
cSenha          := '123mudar'
cLetrasSenha    := 'abcdefghijklmnopqrstuvwxy'
cDigitoSenha    := '0123456789'
cValidacaoLogin := Space(10)
cValidacaoSenha := Space(10)
nOpcaoIniciar   := 0
nOrdemServico   := 1

do while .t.
    @ 01,01 say 'Login:'
    @ 02,01 say 'Senha:'
    
    @ 01,08 get cValidacaoLogin     picture '@!'    valid !Empty(cValidacaoLogin)
    @ 02,08 get cValidacaoSenha                     valid !Empty(cValidacaoSenha)
    read 
    
    if cValidacaoLogin != cLogin .and. cValidacaoSenha != cSenha
        Alert('Login e Senha inexistente!')
        loop
    elseif cValidacaoLogin != cLogin
        Alert('Login inexistente!')
    elseif cValidacaoSenha != cSenha
        Alert('Senha invalida!')
        loop
    else
        Alert('Bem vindo!')
        exit
    endif
    
    cValidacaoLogin := ''
    cValidacaoSenha := ''
enddo

clear

do while .t.
    @ 01,01 say 'MENU PRINCIPAL'
    
    @ 02,01 prompt 'Efetuar pedidos'
    @ 03,01 prompt 'Sair'           
    menu to nOpcaoIniciar
    
    clear 
    if nOpcaoIniciar == 1
        do while .t.
            cCliente         := Space(40)
            dOrdemServico    := CToD('')
            cNomeTecnico     := Space(30)
            cDescricaoEquip  := Space(40)
            dCompra          := CToD('')
            cEntrega         := Space(1)
            nLimiteCredito   := 0
            cEnderecoEntrega := Space(20)
            cBairroEntrega   := Space(20)
            cReferencia      := Space(20)
            nTelefoneDDD     := 0   
            nTelefone1       := 0   
            nTelefone2       := 0   
            
            @ 01,01 say 'Ordem de serviço        :'
            @ 01,19 say nOrdemServico    picture '99999999'
            @ 02,01 say 'Cliente                 :'
            @ 03,01 say 'Data da ordem de servico:'
            @ 04,01 say 'Tecnico                 :'
            @ 05,01 say 'Descricao equipamento   :'
            @ 06,01 say 'Data da compra          :'
            @ 07,01 say 'Entrega a domicilio     :'
            @ 08,01 say 'Limite de credito       :'

            @ 02,27 get cCliente          picture '@!'           valid !Empty(cCliente)
            @ 03,27 get dOrdemServico                            valid !Empty(dOrdemServico) .and. dOrdemServico < Date()
            @ 04,27 get cNomeTecnico      picture '@!'           valid !Empty(cNomeTecnico)
            @ 05,27 get cDescricaoEquip   picture '@!'           valid !Empty(cDescricaoEquip)
            @ 06,27 get dCompra                                  valid !Empty(dCompra) .and. dCompra <= Date()
            @ 07,27 get cEntrega          picture '@!'           valid cEntrega $ 'SN'
            @ 08,27 get nLimiteCredito    picture '@e 99999.99'  valid nLimiteCredito > 0
            read 

            if cEntrega == 'S'
                @ 10,01 say 'DADOS PARA ENTREGA'
                @ 11,01 say 'Endereco  :'
                @ 12,01 say 'Bairro    :'
                @ 13,01 say 'Referencia:'
                @ 14,01 say 'Contato   : (  )      -'

                @ 11,13 get cEnderecoEntrega    picture '@!'    valid !Empty(cEnderecoEntrega)
                @ 12,13 get cBairroEntrega      picture '@!'    valid !Empty(cBairroEntrega)
                @ 13,13 get cReferencia         picture '@!'    valid !Empty(cReferencia)
                @ 14,14 get nTelefoneDDD        picture '99'    valid nTelefoneDDD > 10
                @ 14,17 get nTelefone1          picture '9999'  valid !Empty(nTelefone1)
                @ 14,24 get nTelefone2          picture '9999'  valid !Empty(nTelefone2)
                read 
            endif

            clear 
   
            nLinha      := 6
            nTotalGeral := 0
            do while .t.
                @ 01,01 say 'Informe se deseja comprar algum produto ou se precisa de serviço'
                nOpcaoServico := 0
                @ 02,01 prompt 'Produto'
                @ 03,01 prompt 'Servico'
                menu to nOpcaoServico
                
                @ 05,01 say 'SERVICO/PRODUTO'
                @ 05,33 say 'QTD'
                @ 05,38 say 'PRECO'
                @ 05,47 say 'DESCONTO'
                @ 05,57 say 'TOTAL'

                cProduto      := Space(30)
                cServico      := Space(25)
                nQtd          := 0
                nPrecoUnit    := 0
                nDesconto     := 0
                nTotalProduto := 0
                nLinha1       := nLinha + 2
                nLinha2       := nLinha + 3
                nLinha3       := nLinha + 1

                if nOpcaoServico == 1
                    @ nLinha,01 get cProduto    picture '@!'            valid !Empty(cProduto)
                    @ nLinha,33 get nQtd        picture '999'           valid nQtd > 0
                    @ nLinha,38 get nPrecoUnit  picture '@e 99999.99'   valid nPrecoUnit > 0
                    @ nLinha,47 get nDesconto   picture '@e 999.99'     valid nDesconto >= 0 .and. nDesconto <= 100
                    read 

                    if LastKey() == 27
                        nOpcaoSairServico := Alert('Deseja parar de cadastrar?', {'Sim', 'Nao'})
                        if nOpcaoSairServico == 1
                            exit
                        else
                            loop
                        endif
                    endif

                    nTotalProduto := (nQtd * nPrecoUnit) - (nQtd * nPrecoUnit * nDesconto / 100)
                    
                    if Year(Date()) - Year(dCompra) <= 2
                        nTotalProduto := 0
                    endif
                    
                elseif nOpcaoServico == 2
                    @ nLinha,01 get cServico    picture '@!'            valid !Empty(cServico)
                    @ nLinha,38 get nPrecoUnit  picture '@e 99999.99'   valid nPrecoUnit > 0
                    @ nLinha,47 get nDesconto   picture '@e 999.99'     valid nDesconto >= 0 .and. nDesconto <= 100
                    read 
                    
                    if LastKey() == 27
                        nOpcaoSairServico := Alert('Deseja parar de cadastrar?', {'Sim', 'Nao'})
                        if nOpcaoSairServico == 1
                            exit
                        else
                            loop
                        endif
                    endif
                    
                    nTotalProduto := nPrecoUnit - (nPrecoUnit * nDesconto / 100)

                    if Year(Date()) - Year(dOrdemServico) <= 1
                        nTotalProduto := 0
                    endif

                endif

                cSenhaLiberacao := '123LIBERA'
                cDigitacaoSenha := Space(9)
                
                if nTotalProduto > nLimiteCredito
                    Alert('Se adicionar esse produto ira ultrapassar o limite do cliente, chame o gerente')
                    @ nLinha,70 get cDigitacaoSenha     valid !Empty(cDigitacaoSenha)
                    read 
                    
                    if cDigitacaoSenha == cSenhaLiberacao
                        @ nLinha,57 say nTotalProduto   picture '@e 99999.99'
                    else
                        loop
                    endif
                endif
                
                @ nLinha,57 say nTotalProduto   picture '@e 99999.99'

                nFreteValor := 0
                if cEntrega == 'S'
                    nFreteValor += nTotalProduto * 3 / 100
                endif
                
                nTotalGeral += nTotalProduto + (nTotalProduto * 3 / 100) + nFreteValor
                nLimiteCredito -= nTotalProduto

                @ nLinha3,30 say 'SALDO TOTAL'
                @ nLinha3,57 say nTotalGeral    picture '@e 999999.99'
                @ nLinha1,30 say 'FRETE'
                @ nLinha1,57 say nFreteValor    picture '@e 999999.99'
                @ nLinha2,30 say 'LIMITE DISPONIVEL'
                @ nLinha2,57 say nLimiteCredito picture '@e 999999.99'

                Inkey(0)
                
                @ nLinha1,01 clear to nLinha2,80

                if nLinha2 == 25
                    @ 06,01 clear to 25,80
                    nLinha := 6
                else
                    nLinha++
                endif
            enddo
               
            clear 

            
            nFormasPagamento := 0
            cFormasPagamento := ''
            nOpcaoPagamento  := Space(1)
            do while .t.
                @ 01,01 say 'Forma de pagamento :'
                @ 02,01 say 'Dinheiro'
                @ 03,01 say 'Cheque  '
                @ 04,01 say 'Cartao  '
                @ 06,01 say 'Formas de pagamento:'

                @ 01,22 get nOpcaoPagamento valid nOpcaoPagamento $ '123'
                read

                if nOpcaoPagamento == '1'
                    if ' Dinheiro' $ cFormasPagamento
                        cFormasPagamento += ''
                    else
                        cFormasPagamento += ' Dinheiro'
                    endif
                elseif nOpcaoPagamento == '2'
                    if ' Cheque  ' $ cFormasPagamento
                        cFormasPagamento += ''
                    else
                        cFormasPagamento += ' Cheque  '
                    endif
                elseif nOpcaoPagamento == '3'
                    if ' Cartao  ' $ cFormasPagamento
                        cFormasPagamento += ''
                    else
                        cFormasPagamento += ' Cartao  '
                    endif
                endif 

                @ 06,22 say cFormasPagamento

                cOutraFormaPagamento := Space(1)
                @ 08,01 say 'Deseja cadastrar outra forma de pagamento?'
                @ 08,44 get cOutraFormaPagamento valid cOutraFormaPagamento $ 'SN'
                read 

                if cOutraFormaPagamento == 'S'
                    loop
                else
                    exit
                endif

                nFormasPagamento++
            enddo
            nOrdemServico++

        enddo
        clear 

        @ 01,01 say 'DADOS PARA EMISSÃO DA NOTA'

        if nTotalGeral == 0
            Alert('Todos os produtos estão sendo cobertas pela garantia')
        endif
        
        nCNPJ := 0
        nNota := 0
        dNota := CToD('')
        @ 02,01 say 'CNPJ          :'
        @ 03,01 say 'Numero da nota:'
        @ 04,01 say 'Data da nota  :'
        
        @ 02,17 get nCNPJ   picture '99.999.999/9999-99'    valid !Empty(nCNPJ)
        @ 03,17 get nNota   picture '99999999'              valid !Empty(nNota)
        @ 04,17 get dNota                                   valid !Empty(dNota)
        read 

        clear 

        @ 01,01 say 'NOTA DE SERVICO'
        @ 02,01 say 'Numero da nota :'
        @ 03,01 say 'CNPJ do cliente:'
        @ 04,01 say 'Data da nota   :'
        @ 05,01 say 'Valor da nota  :'
        @ 07,01 say 'Endereco       :'
        @ 08,01 say 'Bairro         :'
        @ 09,01 say 'Telefone       :'
        @ 02,18 say nNota
        @ 03,18 say nCNPJ
        @ 04,18 say dNota
        @ 05,18 say nTotalGeral
        @ 07,18 say cEnderecoEntrega
        @ 08,18 say cBairroEntrega
        @ 09,18 say nTelefoneDDD
        @ 09,21 say nTelefone1
        @ 09,27 say nTelefone2

        Inkey(0)

    else
        exit
    endif 

    nOpcaoSair := Alert('Deseja cadastrar mais um pedido?', {'Sim', 'Nao'})
    if nOpcaoSair == 1
        loop
    else
        exit
    endif
enddo