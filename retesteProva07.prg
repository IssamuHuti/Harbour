set scoreboard off
set epoch to 1940
set date british
SetMode (25,80)
set message to 24 center 
set wrap on  

clear

cLogin          := 'ADMIN'
cSenha          := '123mudar'
cDigitarLogin   := Space(10)
cDigitarSenha   := Space(10)
nOpcaoLogin     := 0
nOrdemServicos  := 1

do while .t.
    do while !(cDigitarLogin == cLogin) .and. !(cDigitarSenha == cSenha)
        @ 01,01 say 'Login |'
        @ 02,01 say 'Senha |'
        
        @ 01,08 get cDigitarLogin   picture '@!'    valid !Empty(cDigitarLogin)
        @ 02,08 get cDigitarSenha                   valid !Empty(cDigitarSenha)
        read 
        if LastKey() == 27
            nOpcaoLogin := Alert('Cancelar o login?', {'Sim', 'Nao'})
            if nOpcaoLogin == 1
                exit 
            else 
                loop 
            endif 
        endif 
        
        @ 01,01 clear to 02,50
    enddo
    
    if nOpcaoLogin == 1
        exit 
    endif 
    
    nOpcaoMenu := 0
    @ 01,01 prompt '1. Efetuar pedidos'
    @ 02,01 prompt '2. Sair'
    menu to nOpcaoMenu

    @ 01,01 clear to 02,50

    nValorTotalOrdem := 0
    if nOpcaoMenu == 1
        cNomeCliente   := Space(40)
        dDataOrdem     := Date()
        cNomeTecnico   := Space(30)
        cDescricao     := Space(40)
        dDataCompra    := CToD('')
        cOpcaoEntrega  := Space(1)
        nLimiteCliente := 0
        
        @ 01,01 say 'Nro Ordem............:'            picture '99999999'
        @ 01,23 say Str(nOrdemServicos)
        @ 02,01 say 'Nome Cliente.........:'            picture '@!'
        @ 03,01 say 'Data Ordem...........:'            picture '@!'
        @ 04,01 say 'Nome Tecnico.........:'            picture '@!'
        @ 05,01 say 'Descricao equipamento:'            picture '@!'
        @ 06,01 say 'Data Compra..........:'            picture '@!'
        @ 07,01 say 'Limite de credito....:'            picture '@!'
        @ 08,01 say 'Entrega Domicilio  [S]im [N]ao :'
        
        @ 02,23 get cNomeCliente    picture '@!'                valid !Empty(cNomeCliente)
        @ 03,23 get dDataOrdem                                  valid !Empty(dDataOrdem)
        @ 04,23 get cNomeTecnico    picture '@!'                valid !Empty(cNomeTecnico)
        @ 05,23 get cDescricao      picture '@!'                valid !Empty(cDescricao)
        @ 06,23 get dDataCompra                                 valid !Empty(dDataCompra)
        @ 07,23 get nLimiteCliente  picture '@E 99999999.99'    valid !Empty(nLimiteCliente) .and. nLimiteCliente > 0
        @ 08,33 get cOpcaoEntrega   picture '@!'                valid !Empty(cOpcaoEntrega) .and. cOpcaoEntrega $ 'SN'
        read 
        if LastKey() == 27
            nCancelarOrdem := Alert('Deseja cancelar a ordem?', {'Sim', 'Nao'})
            if nCancelarOrdem == 1
                exit 
            else 
                loop 
            endif 
        endif 
        
        @ 10,01 say 'Item da ordem [P]roduto [S]ervico : '
        
        nValorTotal     := 0
        nLinhaItens     := 12
        nValorComissao  := 0
        do while .t. 
            nOpcaoLiberar := 0
            cItemOrdem    := Space(1)

            @ 10,37 get cItemOrdem  picture '@!'    valid !Empty(cItemOrdem) .and. cItemOrdem $ 'SP'
            read 
            if LastKey() == 27
                nCancelarAdicao := Alert('Deseja finalizar a ordem de servico?', {'Sim', 'Nao'})
                if nCancelarAdicao == 1
                    exit 
                else 
                    loop 
                endif 
            endif 
            
            nValorItem := 0
            
            @ 11,01 say 'Descricao do produto          |Qtd|Preco Unit|%Desconto|%Comissao| Valor Total'
            
            if cItemOrdem == 'P'
                cDescricaoProduto := Space(30)
                nQtdItem          := 0
                nPrecoUnit        := 0
                nDesconto         := 0
                
                @ nLinhaItens,01 get cDescricaoProduto picture '@!'               valid !Empty(cDescricaoProduto)
                @ nLinhaItens,32 get nQtdItem          picture '999'              valid !Empty(nQtdItem) .and. nQtdItem > 0
                @ nLinhaItens,36 get nPrecoUnit        picture '@E 99999999.99'   valid !Empty(nPrecoUnit) .and. nPrecoUnit > 0
                @ nLinhaItens,47 get nDesconto         picture '@E 99.99'         valid nDesconto >= 0
                read 
                if LastKey() == 27
                    nCancelarItem := Alert('Cancelar o item?', {'Sim', 'Nao'})
                    if nCancelarItem == 1
                        exit 
                    else
                        loop 
                    endif 
                endif 
                
                nValorItem := (nQtdItem * nPrecoUnit) - (nQtdItem * nPrecoUnit * nDesconto / 100)
    
                if (Year(dDataOrdem) - Year(dDataCompra)) <= 1
                    nValorItem := 0
                elseif (Year(dDataOrdem) - Year(dDataCompra)) == 2
                    if Month(dDataOrdem) < Month(dDataCompra)
                        nValorItem := 0
                    elseif Month(dDataOrdem) == Month(dDataCompra)
                        if Day(dDataOrdem) < Day(dDataCompra)
                            nValorItem := 0
                        endif 
                    endif 
                endif  
                
            elseif cItemOrdem == 'S'
                cDescricaoServico := Space(25)
                nPrecoUnit        := 0
                nDesconto         := 0
                nComissao         := 0
                
                @ nLinhaItens,01 get cDescricaoServico picture '@!'               valid !Empty(cDescricaoServico)
                @ nLinhaItens,36 get nPrecoUnit        picture '@E 99999999.99'   valid !Empty(nPrecoUnit) .and. nPrecoUnit > 0
                @ nLinhaItens,47 get nDesconto         picture '@E 99.99'         valid nDesconto >= 0
                @ nLinhaItens,57 get nComissao         picture '@E 99.99'         valid nComissao >= 0
                read 
                if LastKey() == 27
                    nCancelarItem := Alert('Cancelar o item?', {'Sim', 'Nao'})
                    if nCancelarItem == 1
                        exit 
                    else
                        loop 
                    endif 
                endif 
                
                nValorComissao  := nPrecoUnit * nComissao / 100
                nValorItem      := nPrecoUnit + nValorComissao - (nPrecoUnit * nDesconto / 100)
                
                if (Year(dDataOrdem) - Year(dDataCompra)) == 1
                    if Month(dDataOrdem) < Month(dDataCompra)
                        nValorItem := 0
                    elseif Month(dDataOrdem) == Month(dDataCompra)
                        if Day(dDataOrdem) < Day(dDataCompra)
                            nValorItem := 0
                        endif 
                    endif 
                endif  

            endif
            
            nValorTotal += nValorItem
            nValorTotalOrdem += nValorItem
            
            if nLimiteCliente < nValorTotal
                cSenhaSupervisor := '123LIBERA'
                cSenhaLiberacao  := Space(10)
                
                @ 22,01 say 'O valor da ordem maior do que o limite, libere o limite pelo SUPERVISOR'
                @ 23,01 say 'Login: SUPERVISOR'
                @ 24,01 say 'Senha:'
                
                @ 24,07 get cSenhaLiberacao picture '@!'    valid !Empty(cSenhaLiberacao)
                read 
                if LastKey() == 27
                    nOpcaoLiberar := Alert('Deseja cancelar a liberacao do limite?', {'Sim', 'Nao'})
                    if nOpcaoLiberar == 1
                        exit 
                    endif 
                endif 
                
                if !(cSenhaLiberacao == cSenhaSupervisor)
                    Alert('Senha incorreta, ultimo item sera excluido!')
                    nValorTotal -= nValorItem
                    nValorTotalOrdem -= nValorItem
                endif 
                
                @ 22,01 clear to 24,80
            endif 
            
            @ nLinhaItens,67 say nValorTotal  picture '@E 999999999.99'

            @ 21,50 say 'Valor Ordem'
            @ 21,62 say Str(nValorTotalOrdem)
            
            nLinhaItens++
            if nLinhaItens == 21
                nLinhaItens := 12
                @ 12,01 clear to 20,80
            endif

        enddo

        if cOpcaoEntrega == 'S'
            cEndereco       := Space(30)
            nNumeroEndereco := 0
            cBairro         := Space(20)
            cReferencia     := Space(20)
            nTelefone       := 0
            nValorEntrega   := 0

            @ 22,01 say 'Endereco entrega:'
            @ 22,50 say 'N:'
            @ 22,57 say 'Fone:'
            @ 23,01 say 'Bairro:'
            @ 23,29 say 'Referencia:'
            @ 24,01 say 'Taxa de entrega:'

            @ 22,21 get cEndereco       picture '@!'             valid !Empty(cEndereco)
            @ 22,53 get nNumeroEndereco picture '9999'           valid !Empty(nNumeroEndereco) .and. nNumeroEndereco > 0
            @ 22,63 get nTelefone       picture '99 99999-9999'  valid !Empty(nTelefone)
            @ 23,08 get cBairro         picture '@!'             valid !Empty(cBairro)
            @ 23,41 get cReferencia     picture '@!'             valid !Empty(cReferencia)
            read 

            nValorEntrega := nValorTotalOrdem * 3 / 100
            @ 24,17 say nValorEntrega   picture '@E 9999.99'

            nValorTotalOrdem += nValorEntrega

            Inkey(0)
            @ 22,01 clear to 24,79
        endif 
        
        @ 22,01 say 'Forma de pagamento [1]Dinheiro [2]Cheque [3]Cartao:'
        
        cFormasPagamento := ''
        cTiposPagamentos := ''
        do while Len(cTiposPagamentos) < 3
            cOpcaoPagamento := ''
            
            @ 22,53 get cOpcaoPagamento valid !Empty(cOpcaoPagamento) .and. cOpcaoPagamento $ '123'
            read 
            if LastKey() == 27
                nCancelarOpcao := Alert('Todas as formas de pagamento cadastradas?', {'Sim', 'Nao'})
                if nCancelarOpcao == 1
                    if !cFormasPagamento
                        Alert('Escolha uma das opcoes de pagamento!')
                        loop
                    else
                        exit 
                    endif 
                else
                    loop 
                endif 
            endif 
            if cOpcaoPagamento $ cTiposPagamentos
                Alert('Opcao de pagamento ja cadastrado!')
                loop 
            else
                cTiposPagamentos += cOpcaoPagamento
            endif 
            
            if cOpcaoPagamento == '1'
                cFormasPagamento += 'Dinheiro '
            elseif cOpcaoPagamento == '2'
                cFormasPagamento += 'Cheque '
            elseif cOpcaoPagamento == '3'
                cFormasPagamento += 'Cartao '
            endif 
        enddo
        @ 22,01 clear to 24,79

        if nValorTotalOrdem == 0
            Alert('Despesas cobertas pela garantia! Informe as seguintes informacoes para cobertura da garantia!')

            nCNPJ        := 0
            nNota        := 0

            @ 22,01 say 'CNPJ:' 99.999.999/0001-99
            @ 22,26 say 'Nro Nota:'
            @ 23,01 say 'Data da nota: ' + DToC(dDataCompra)
            @ 24,01 say 'Comissao paga:'
            @ 24,15 say nValorComissao  picture '@E 99,999.99'

            @ 22,06 get nCNPJ           picture '99,999,999/9999-99'    valid !Empty(nCNPJ) .and. nCNPJ > 0
            @ 22,36 get nNota           picture '999999999'             valid !Empty(nNota) .and. nNota > 0
            read 

        endif 

        Alert('Ordem finalizada!')
        nOrdemServicos++
    else 
        exit 
    endif 
    
enddo
    