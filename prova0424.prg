// Lucas Issamu Morino Yamahuti

set scoreboard off
set epoch to 1940
set date british
SetMode (25,80)
set message to 24 center 
set wrap on  

clear

nSequencia           := 1
cProdutosCadastrados := ''
cValidacaoNumero     := '0123456789'
cValidacaoLetra      := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
dDataAtual           := Date()

do while .t.
    @ 00,00 to 08,50
    nOpcaoMenu := 0
    
    @ 01,01 say 'Menu principal'       picture '@!'
    
    @ 02,01 prompt  '1 - Cadastrar produto'     message 'Cadastrar produto'
    @ 03,01 prompt  '2 - Consultar produto'     message 'Consultar produto'
    @ 04,01 prompt  '3 - Deletar produto'       message 'Deletar produto'
    @ 05,01 prompt  '4 - Entrada de produto'    message 'Entrada de produto'
    @ 06,01 prompt  '5 - Saida de produto'      message 'Saida de produto'
    @ 07,01 prompt  '6 - Sair do programa'      message 'Sair do programa'
    menu to nOpcaoMenu
    
    if LastKey() == 27
        nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'})
        if nOpcao == 1
            exit 
        else 
            loop
        endif 
    endif 
    
    clear 
    if nOpcaoMenu == 1
        cIdentidade         := Space(8)
        cDescricao          := Space(30)
        nQtdEstoque         := 0
        dDataCadastro       := CToD('')
        lValidacaoNumero    := .f.
        lValidacaoLetra     := .f.
        
        do while !lValidacaoNumero .and. !lValidacaoLetra
            nContNumero  := 0
            nContLetra   := 0
            cContInvalid := ''
            
            @ 01,01 say 'Cadastre novo produto'
            @ 02,01 say 'ID..............:'
            @ 03,01 say 'Descricao.......:'
            @ 04,01 say 'Quantidade......:'
            @ 05,01 say 'Data de cadastro:'
            
            @ 02,18 get cIdentidade     picture '@!'    valid !Empty(cIdentidade)
            read 

            if cIdentidade $ cProdutosCadastrados
                Alert('Produtos ja cadastrado')
                loop 
            endif 

            @ 03,18 get cDescricao      picture '@!'    valid !Empty(cDescricao)
            @ 04,18 get nQtdEstoque     picture '9999'  valid !Empty(nQtdEstoque) .and. nQtdEstoque > 0
            @ 05,18 get dDataCadastro                   valid !Empty(dDataCadastro) .and. dDataAtual >= dDataCadastro
            read 
            if LastKey() == 27
                nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'})
                if nOpcao == 1
                    exit 
                else 
                    loop
                endif 
            endif 
            
            nContValidacao := 1
            do while nContValidacao <= Len(cIdentidade) 
                if SubStr(cIdentidade, nContValidacao, 1) $ cValidacaoLetra
                    nContLetra++
                elseif SubStr(cIdentidade, nContValidacao, 1) $ cValidacaoNumero
                    nContNumero++
                else 
                    cContInvalid += SubStr(cIdentidade, nContValidacao, 1)
                endif 
                nContValidacao++
            enddo
            
            if nContLetra < 2 .or. nContNumero < 4 .or. Len(cContInvalid) > 0 .or. Len(cIdentidade) != 8
                Alert('O codigo deve possuir pelo menos 2 letras, 4 numeros, nao pode possuir nenhum outro caracter que nao seja letra ou numero e precisa possuir 8 digitos')
                loop  
            else 
                lValidacaoLetra      := .t.
                lValidacaoNumero     := .t.
                nSequencia++
                cProdutosCadastrados += cIdentidade + cDescricao + Str(nQtdEstoque) + DToC(dDataCadastro)
                Inkey(0)
            endif 
        enddo

    elseif nOpcaoMenu == 2
        if cProdutosCadastrados == ''
            Alert('Nenhum produto cadastrado!')
            loop   
        endif 
        
        cConsultarProduto := Space(8)
        @ 01,01 say 'Consultar produto:'
        
        @ 01,19 get cConsultarProduto   picture '@!'    valid !Empty(cConsultarProduto)
        read 
        if LastKey() == 27
            nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'})
            if nOpcao == 1
                loop
            endif 
        endif 
        
        if cConsultarProduto $ cProdutosCadastrados
            nContConsulta := 1
            do while !(SubStr(cProdutosCadastrados, nContConsulta + (50 * (nContConsulta-1)), 8) == cConsultarProduto)
                nContConsulta++
            enddo
            
            cDadosProduto       := SubStr(cProdutosCadastrados, nContConsulta + (50 * (nContConsulta-1)), 50)
            cDescricaoProduto   := SubStr(cDadosProduto, 9, 30)
            cQtdProduto         := SubStr(cDadosProduto, 39, 4)
            cDataCadastro       := SubStr(cDadosProduto, 43, 8)
            
            @ 02,01 say 'Descricao....: ' + cDescricaoProduto
            @ 03,01 say 'Quantidade...: ' + cQtdProduto
            @ 04,01 say 'Data cadastro: ' + cDataCadastro

            Inkey(0)
        else
            Alert('Produto nao cadastrado!')
            loop 
        endif
        
    elseif nOpcaoMenu == 3
        if cProdutosCadastrados == ''
            Alert('Nenhum produto cadastrado!')
            exit 
        endif 
        
        cProdutoDeletar      := Space(8)
        @ 01,01 say 'Digite o produto a deletar:'
        
        @ 01,28 get cProdutoDeletar picture '@!'    valid !Empty(cProdutoDeletar) .and. Len(cProdutoDeletar) == 8
        read 
        if LastKey() == 27
            nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'})
            if nOpcao == 1
                loop
            endif 
        endif 
        
        if cProdutoDeletar $ cProdutosCadastrados
            cProdutosAtualizados := ''
            nContConsulta        := 1
            do while !(SubStr(cProdutosCadastrados, nContConsulta + (50 * (nContConsulta-1)), 8) = cProdutoDeletar)
                nContConsulta++
            enddo
            
            nContSequencia := 1
            do while nContSequencia <= nContConsulta + (50 * (nContConsulta-1))
                cProdutosAtualizados += SubStr(cProdutosCadastrados, nContSequencia, 1)
                nContSequencia++
            enddo
            
            cProdutosAtualizados := SubStr(cProdutosCadastrados, 1 + (50 * (nContConsulta)))
            cProdutosCadastrados := cProdutosAtualizados
            
            Alert('O produto foi deletado com sucesso!')
        else
            Alert('Produto nao cadastrado!')
            loop 
        endif 
        
    elseif nOpcaoMenu == 4
        if cProdutosCadastrados == ''
            Alert('Nenhum produto cadastrado!')
            exit  
        endif 
        
        cProduto      := Space(8)
        @ 01,01 say 'Digite codigo do produto:'
        
        @ 01,26 get cProduto picture '@!'    valid !Empty(cProduto) .and. Len(cProduto) == 8
        read 
        if LastKey() == 27
            nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'})
            if nOpcao == 1
                loop
            endif 
        endif 
        
        if cProduto $ cProdutosCadastrados
            cProdutosAtualizados := ''
            dDataEntrada         := CToD('')
            nEntradaProduto      := 0
            nContConsulta        := 1
            
            do while !(SubStr(cProdutosCadastrados, 1 + (50 * (nContConsulta-1)), 8) == cProduto)
                nContConsulta++
            enddo

            cDadosProduto       := SubStr(cProdutosCadastrados, 1 + (50 * (nContConsulta-1)), 50)
            cDescricaoProduto   := SubStr(cDadosProduto, 9, 30)
            cQtdProduto         := SubStr(cDadosProduto, 39, 4)
            cDataCadastro       := SubStr(cDadosProduto, 43, 8)
            
            @ 02,01 say 'Descricao....: ' + cDescricaoProduto
            @ 03,01 say 'Quantidade...: ' + cQtdProduto
            @ 04,01 say 'Data cadastro: ' + cDataCadastro
            
            @ 06,01 say 'Entrada......:'
            @ 07,01 say 'Data entrada.:'

            cProdutosAtualizados := SubStr(cProdutosCadastrados, nContConsulta + (50 * (nContConsulta)), 50)
            cProdutosCadastrados := cProdutosAtualizados
            
            @ 06,15 get nEntradaProduto picture '9999'  valid !Empty(nEntradaProduto) .and. nEntradaProduto > 0
            @ 07,15 get dDataEntrada                    valid !Empty(dDataEntrada) .and. dDataEntrada > dDataCadastro
            read 
            if LastKey() == 27
                nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'})
                if nOpcao == 1
                    loop
                endif 
            endif 

            nContSequencia := 1
            do while nContSequencia <= nContConsulta + (50 * (nContConsulta-1))
                cProdutosAtualizados += SubStr(cProdutosCadastrados, nContSequencia, 1)
                nContSequencia++
            enddo
            
            cQtdFinal := AllTrim(Str(Val(cQtdProduto) + nEntradaProduto))
            if Len(cQtdFinal) < 4
                cQtdFinal := Replicate(' ', 4 - Len(cQtdFinal)) + cQtdFinal
            endif 
            
            cProdutosAtualizados := SubStr(cProdutosCadastrados, 1 + (50 * (nContConsulta)))
            cProdutosCadastrados += cProdutosAtualizados + cProduto + cDescricaoProduto + cQtdFinal + DToC(dDataEntrada)
            
            Alert('Entrada do produto efetivado')
            
        else
            Alert('Produto nao cadastrado!')
            loop 
        endif 
        
    elseif nOpcaoMenu == 5
        if cProdutosCadastrados == ''
            Alert('Nenhum produto cadastrado!')
            exit  
        endif 
        
        cProduto      := Space(8)
        @ 01,01 say 'Digite codigo do produto:'
        
        @ 01,26 get cProduto picture '@!'    valid !Empty(cProduto) .and. Len(cProduto) == 8
        read 
        if LastKey() == 27
            nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'})
            if nOpcao == 1
                loop
            endif 
        endif 
        
        if cProduto $ cProdutosCadastrados
            cProdutosAtualizados := ''
            dDataSaida           := CToD('')
            nSaidaProduto        := 0
            nContConsulta        := 1
            
            do while !(SubStr(cProdutosCadastrados, 1 + (50 * (nContConsulta-1)), 8) == cProduto)
                nContConsulta++
            enddo
            
            cDadosProduto       := SubStr(cProdutosCadastrados, 1 + (50 * (nContConsulta-1)), 50)
            cDescricaoProduto   := SubStr(cDadosProduto, 9, 30)
            cQtdProduto         := SubStr(cDadosProduto, 39, 4)
            cDataCadastro       := SubStr(cDadosProduto, 43, 8)
            
            @ 02,01 say 'Descricao....: ' + cDescricaoProduto
            @ 03,01 say 'Quantidade...: ' + cQtdProduto
            @ 04,01 say 'Data cadastro: ' + cDataCadastro
            
            @ 06,01 say 'Saida........:'
            @ 07,01 say 'Data Saida...:'

            @ 06,15 get nSaidaProduto picture '9999'    valid !Empty(nSaidaProduto) .and. nSaidaProduto > 0
            @ 07,15 get dDataSaida                      valid !Empty(dDataSaida) .and. dDataSaida > dDataCadastro
            read 
            if LastKey() == 27
                nOpcao := Alert('Deseja sair?', {'Sim', 'Nao'})
                if nOpcao == 1
                    loop  
                endif 
            endif 
            
            cQtdFinal := AllTrim(Str(Val(cQtdProduto) - nSaidaProduto))
            if Len(cQtdFinal) < 4
                cQtdFinal := Replicate(' ', 4 - Len(cQtdFinal)) + cQtdFinal
            endif 

            nContSequencia := 1
            do while nContSequencia <= nContConsulta + (50 * (nContConsulta-1))
                cProdutosAtualizados += SubStr(cProdutosCadastrados, nContSequencia, 1)
                nContSequencia++
            enddo

            cProdutosAtualizados := SubStr(cProdutosCadastrados, 1 + (50 * (nContConsulta)))
            cProdutosCadastrados += cProdutosAtualizados + cIdentidade + cDescricao + cQtdFinal + DToC(dDataSaida)
            
            Alert('Saida do produto efetivado')
            
        else
            Alert('Produto nao cadastrado!')
            loop 
        endif
        
    elseif nOpcaoMenu == 6
        exit 
    endif
    
    clear 
enddo
