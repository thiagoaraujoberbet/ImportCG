/* 	MB   -> ListaClienteMB 
	Tela -> listarCliente.xhtml
	PessoaDAO
	buscarInformacoesCliente
    Retorna informações do cliente (Pessoa)
*/
SELECT *
FROM   (SELECT p.idPessoa,
               p.nome,
               p.cargo,
               p.cpf,
               p.dataNascimento,
               p.celular,
               p.email,
               p.tipo,
               p.dataCriacao,
               p.dataAlteracao,
               CASE
                 WHEN (SELECT Sum(iv.quantidade)
                       FROM   u684253104_impcg.itemVenda iv
                              JOIN venda v
                                ON iv.idVenda = v.idVenda
                       WHERE  v.idCliente = p.idPessoa) IS NULL THEN 0
                 ELSE (SELECT Sum(iv.quantidade)
                       FROM   u684253104_impcg.itemVenda iv
                              JOIN venda v
                                ON iv.idVenda = v.idVenda
                       WHERE  v.idCliente = p.idPessoa)
               END quantidadeComprada,
               CASE
                 WHEN (SELECT Sum(iv.valor)
                       FROM   u684253104_impcg.itemVenda iv
                              JOIN venda v
                                ON iv.idVenda = v.idVenda
                       WHERE  v.idCliente = p.idPessoa) IS NULL THEN 0
                 ELSE (SELECT Sum(iv.valor)
                       FROM   u684253104_impcg.itemVenda iv
                              JOIN venda v
                                ON iv.idVenda = v.idVenda
                       WHERE  v.idCliente = p.idPessoa)
               END valorComprado,
               CASE
                 WHEN (SELECT Sum(pag.saldo)
                       FROM   u684253104_impcg.pagamento pag
                              JOIN venda v
                                ON pag.idVenda = v.idVenda
                       WHERE  v.idCliente = p.idPessoa
                              AND pag.pago = 0) IS NULL THEN 0
                 ELSE (SELECT Sum(pag.saldo)
                       FROM   u684253104_impcg.pagamento pag
                              JOIN venda v
                                ON pag.idVenda = v.idVenda
                       WHERE  v.idCliente = p.idPessoa
                              AND pag.pago = 0)
               END valorDevido
        FROM   u684253104_impcg.pessoa p
        WHERE  p.tipo = 'CLIENTE') cliente
ORDER  BY valorDevido DESC,
          nome ASC;  
          
/* 	MB   -> ListaClienteMB 
	Tela -> listarCliente.xhtml
	PessoaDAO
	buscarMaioresCompradoresPorQtde
    Retorna os 10 maiores comprados por quantidade de itens adquiridos
*/          
SELECT *
FROM   (SELECT p.idPessoa,
               p.nome,
               CASE
                 WHEN (SELECT Sum(iv.quantidade)
                       FROM   u684253104_impcg.itemVenda iv
                              JOIN venda v
                                ON iv.idVenda = v.idVenda
                       WHERE  v.idCliente = p.idPessoa) IS NULL THEN 0
                 ELSE (SELECT Sum(iv.quantidade)
                       FROM   u684253104_impcg.itemVenda iv
                              JOIN venda v
                                ON iv.idVenda = v.idVenda
                       WHERE  v.idCliente = p.idPessoa)
               end quantidadeComprada
        FROM   u684253104_impcg.pessoa p
        WHERE  p.tipo = 'CLIENTE'
               AND p.idPessoa <> 46) cliente
ORDER  BY quantidadeComprada DESC,
          nome ASC
LIMIT  10;  

/* 	MB   -> ListaClienteMB 
	Tela -> listarCliente.xhtml
	PessoaDAO
	buscarMaioresCompradoresPorValor
    Retorna os 10 maiores comprados por valor de itens adquiridos
*/          
SELECT *
FROM   (SELECT p.idPessoa,
               p.nome,
               CASE
                 WHEN (SELECT Sum(iv.valor)
                       FROM   u684253104_impcg.itemVenda iv
                              JOIN venda v
                                ON iv.idVenda = v.idVenda
                       WHERE  v.idCliente = p.idPessoa) IS NULL THEN 0
                 ELSE (SELECT Sum(iv.valor)
                       FROM   u684253104_impcg.itemVenda iv
                              JOIN venda v
                                ON iv.idVenda = v.idVenda
                       WHERE  v.idCliente = p.idPessoa)
               end valorComprado
        FROM   u684253104_impcg.pessoa p
        WHERE  p.tipo = 'CLIENTE'
               AND p.idPessoa <> 46) cliente
ORDER  BY valorComprado DESC,
          nome ASC
LIMIT  10; 

/* 	MB   -> ListaFuncionarioMB 
	Tela -> listarFuncionario.xhtml
	ItemVendaDAO
	buscarValorVendidoFuncionario
    Retorna os valores vendidos por mes do funcionario
*/  
SELECT p.idPessoa,
       p.nome,
       Year(v.dataVenda),
       Month(v.dataVenda),
       Sum(iv.valor)
FROM   u684253104_impcg.itemVenda iv
       JOIN u684253104_impcg.venda v
         ON iv.idVenda = v.idVenda
       JOIN u684253104_impcg.pessoa p
         ON v.idFuncionario = p.idPessoa
WHERE  p.idPessoa = 3
GROUP  BY p.idPessoa,
          Year(v.dataVenda),
          Month(v.dataVenda)
ORDER  BY p.idPessoa,
          Year(v.dataVenda) ASC,
          Month(v.dataVenda) ASC; 
          
/* 	MB   -> ListaFuncionarioMB 
	Tela -> listarFuncionario.xhtml
	ItemVendaDAO
	buscarQuantidadeVendidaFuncionario
    Retorna as quantidade de itens vendidos por mes do funcionario
*/  
SELECT p.idPessoa,
       p.nome,
       Year(v.dataVenda),
       Month(v.dataVenda),
       Sum(iv.quantidade)
FROM   u684253104_impcg.itemVenda iv
       JOIN u684253104_impcg.venda v
         ON iv.idVenda = v.idVenda
       JOIN u684253104_impcg.pessoa p
         ON v.idFuncionario = p.idPessoa
WHERE  p.idPessoa = 3
GROUP  BY p.idPessoa,
          Year(v.dataVenda),
          Month(v.dataVenda)
ORDER  BY p.idPessoa,
          Year(v.dataVenda) ASC,
          Month(v.dataVenda) ASC; 
          
/* 	MB   -> ListaPrincipalMB 
	Tela -> index.xhtml
	PrincipalDAO
	buscarEntradaPorMes
    Retorna os valores por mes das entradas (Compras)
*/           
SELECT Year(e.dataCompra),
       Month(e.dataCompra),
       Sum(e.valorTotal)
FROM   entrada e
GROUP  BY Year(e.dataCompra),
          Month(e.dataCompra)
ORDER  BY Year(e.dataCompra) ASC,
          Month(e.dataCompra) ASC;            
    
/* 	MB   -> ListaPrincipalMB 
	Tela -> index.xhtml
	PrincipalDAO
	buscarSaidasPorMes
    Retorna os valores por mes das saidas (Vendas)
*/   
SELECT Year(v.dataVenda),
       Month(v.dataVenda),
       Sum(iv.valor)
FROM   itemVenda iv
       JOIN venda v
         ON iv.idVenda = v.idVenda
GROUP  BY Year(v.dataVenda),
          Month(v.dataVenda)
ORDER  BY Year(v.dataVenda) ASC,
          Month(v.dataVenda) ASC; 

/* 	MB   -> ListaPrincipalMB 
	Tela -> index.xhtml
	PrincipalDAO
	buscarRecebidosPorMes
    Retorna os valores recebidos por mes
*/            
SELECT Year(p.data),
       Month(p.data),
       Sum(p.saldo)
FROM   pagamento p
WHERE  p.pago = 1
GROUP  BY Year(p.data),
          Month(p.data)
ORDER  BY Year(p.data) ASC,
          Month(p.data) ASC;  
          
/* 	MB   -> ListaPrincipalMB 
	Tela -> index.xhtml
	PrincipalDAO
	buscarDespesasPorMes
    Retorna os valores das despesas mensais
*/           
SELECT Year(ib.data),
       Month(ib.data),
       Sum(ib.valor)
FROM   itemBaixa ib
       INNER JOIN itemDespesa d
               ON ib.idItemDespesa = d.idItemDespesa
WHERE  ib.baixado = 1
       AND d.idEntrada IS NULL
GROUP  BY Year(ib.data),
          Month(ib.data)
ORDER  BY Year(ib.data) ASC,
          Month(ib.data) ASC;  

/* 	MB   -> ListaPrincipalMB 
	Tela -> index.xhtml
	PrincipalDAO
	buscarPagosPorMes
    Retorna os valores pagos por mês
*/ 
SELECT Year(ib.data),
       Month(ib.data),
       Sum(ib.valor)
FROM   itemBaixa ib
       INNER JOIN itemDespesa d
               ON ib.idItemDespesa = d.idItemDespesa
WHERE  ib.baixado = 1
GROUP  BY Year(ib.data),
          Month(ib.data)
ORDER  BY Year(ib.data) ASC,
          Month(ib.data) ASC;  
    
/* 	MB   -> ClienteMB 
	Tela -> manterCliente.xhtml
	PessoaDAO
	buscarProdutosCompradosPorCliente
    Retorna os produtos comprados por cliente
*/     
SELECT pr.idProduto,
       pr.nome,
       pr.marca,
       pr.modelo,
       iv.valor,
       v.dataVenda
FROM   u684253104_impcg.itemVenda iv
       JOIN u684253104_impcg.venda v
         ON iv.idVenda = v.idVenda
       JOIN u684253104_impcg.pessoa p
         ON v.idCliente = p.idPessoa
       JOIN u684253104_impcg.produto pr
         ON iv.idProduto = pr.idProduto
WHERE  p.idPessoa = 24
ORDER  BY v.dataVenda DESC;  