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