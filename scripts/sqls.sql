select IFNULL(sum(iv.quantidade), 0) from u684253104_impcg.itemVenda iv where iv.idItemEntrada = 29;

select sum(ie.quantidade) from u684253104_impcg.itemEntrada ie where ie.idItemEntrada = 27;

SELECT x.idItemEntrada, x.valorEmReal, x.idProduto, x.nome, x.marca, x.modelo, x.estoque FROM (
	SELECT DISTINCT i.idItemEntrada, i.valorEmReal, p.idProduto, p.nome, p.marca, p.modelo, 
		(select IFNULL(sum(iv.quantidade), 0) from u684253104_impcg.itemEntrada iv where iv.idItemEntrada = i.idItemEntrada) -
		(select IFNULL(sum(ie.quantidade), 0) from u684253104_impcg.itemVenda ie where ie.idItemEntrada = i.idItemEntrada) AS estoque 
	FROM u684253104_impcg.itemEntrada i 
	INNER JOIN u684253104_impcg.produto p ON i.idProduto = p.idProduto
) x
WHERE x.estoque > 0
ORDER BY x.nome, x.marca, x.modelo; 

SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)
AS 'primeiro dia do mes', last_day(sysdate()) as 'ultimo dia do mes';

SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1);
SELECT last_day(sysdate());

select 
		(select SUM(e.valorTotal) from u684253104_impcg.entrada e
			where e.dataCompra between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate())) entradas,
		(select SUM(iv.valor) from u684253104_impcg.itemVenda iv
			JOIN u684253104_impcg.venda v ON iv.idVenda = v.idVenda
			where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate())) saidas,
		(select SUM(p.saldo) from u684253104_impcg.pagamento p
			where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate()) and p.pago = 1) recebido;

select 
		(select SUM(e.valorTotal) from u684253104_impcg.entrada e
			where e.dataCompra between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) entradas,
		(select SUM(iv.valor) from u684253104_impcg.itemVenda iv
			JOIN u684253104_impcg.venda v ON iv.idVenda = v.idVenda
			where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) saidas,
		(select SUM(p.saldo) from u684253104_impcg.pagamento p
			where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and p.pago = 1) recebido
;

select 
		(select SUM(e.valorTotal) from u684253104_impcg.entrada e) entradas,
		(select SUM(iv.valor) from u684253104_impcg.itemVenda iv) saidas,
		(select SUM(p.saldo) from u684253104_impcg.pagamento p where p.pago = 1) recebido
;

	SELECT e.idEstoque, e.idProduto, e.quantidade, p.nome, p.marca, p.modelo, p.categoria, p.descricao,
	case when (select SUM(iv.quantidade) FROM u684253104_impcg.itemVenda iv WHERE iv.idProduto = p.idProduto) is null then 0 else 
		(select SUM(iv.quantidade) FROM u684253104_impcg.itemVenda iv WHERE iv.idProduto = p.idProduto) end quantidadeTotalVenda
	FROM u684253104_impcg.estoque e
	JOIN u684253104_impcg.produto p ON e.idProduto = p.idProduto
    ORDER BY p.nome, p.marca, p.modelo;
    
    
    SELECT p.idPessoa, p.nome, p.cargo, p.cpf, p.dataNascimento, p.celular, p.email, p.tipo, p.dataCriacao, p.dataAlteracao,
    case when (select SUM(iv.quantidade) from u684253104_impcg.itemVenda iv JOIN u684253104_impcg.venda v ON iv.idVenda = v.idVenda where v.idFuncionario = p.idPessoa) is null then 0 else 
    (select SUM(iv.quantidade) from u684253104_impcg.itemVenda iv JOIN u684253104_impcg.venda v ON iv.idVenda = v.idVenda where v.idFuncionario = p.idPessoa) end quantidadeVendida
    FROM u684253104_impcg.pessoa p 
    WHERE p.tipo = 'FUNCIONARIO'
    ORDER BY p.nome; 
    
	SELECT p.idPessoa, p.nome, p.cargo, p.cpf, p.dataNascimento, p.celular, p.email, p.tipo, p.dataCriacao, p.dataAlteracao,
    case when (select SUM(iv.quantidade) from u684253104_impcg.itemVenda iv JOIN u684253104_impcg.venda v ON iv.idVenda = v.idVenda where v.idCliente = p.idPessoa) is null then 0 else 
    (select SUM(iv.quantidade) from u684253104_impcg.itemVenda iv JOIN u684253104_impcg.venda v ON iv.idVenda = v.idVenda where v.idCliente = p.idPessoa) end quantidadeVendida
    FROM u684253104_impcg.pessoa p 
    WHERE p.tipo = 'CLIENTE'
    ORDER BY p.nome; 
    
    
select 
		(select SUM(ib.valor) from u684253104_impcg.itemBaixa ib
			JOIN u684253104_impcg.baixa b ON ib.idBaixa = b.idBaixa
			where b.dataCriacao between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1) entradas,
		(select SUM(id.valor) from u684253104_impcg.itemDespesa id
			JOIN u684253104_impcg.despesa d ON id.idDespesa = d.idDespesa
			where id.idEntrada is null and d.dataDespesa between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)) despesas,
		(select SUM(p.saldo) from u684253104_impcg.pagamento p
			where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and p.pago = 1) recebido,
		(select SUM(ib.valor) from u684253104_impcg.itemBaixa ib
			where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and ib.baixado = 0) despesasAPagar

select 
		(select SUM(p.saldo) from u684253104_impcg.pagamento p
			where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and p.pago = 1) recebido


/*buscar Despesa Baixadas*/
select * from u684253104_impcg.itemBaixa ib
where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1

/*buscar Despesa a serem Baixadas no mes*/
select * from u684253104_impcg.itemBaixa ib
where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and ib.baixado = 0;


select 	
-- A receber no mes atual
(select SUM(p.saldo) from u684253104_impcg.pagamento p
			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) AReceberMesAtual,
-- A receber no proximo mês            
(select SUM(p.saldo) from u684253104_impcg.pagamento p
			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 0 MONTH)), 1)) and last_day(sysdate() + INTERVAL 1 MONTH)) AReceberProximoMes,
-- A receber no proximo mês              
(select SUM(p.saldo) from u684253104_impcg.pagamento p
			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL -1 MONTH)), 1)) and last_day(sysdate() + INTERVAL 2 MONTH)) AReceberProximoProximoMes,            
-- A receber em todos os meses
(select SUM(p.saldo) from u684253104_impcg.pagamento p
			where p.pago = 0) AReceberTodosMeses;       
            
            
select 	
-- A receber no mes atual
(select SUM(ib.valor) from u684253104_impcg.itemBaixa ib
			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) APagarMesAtual,
-- A receber no proximo mês            
(select SUM(ib.valor) from u684253104_impcg.itemBaixa ib
			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 0 MONTH)), 1)) and last_day(sysdate() + INTERVAL 1 MONTH)) APagarProximoMes,
-- A receber no proximo mês              
(select SUM(ib.valor) from u684253104_impcg.itemBaixa ib
			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL -1 MONTH)), 1)) and last_day(sysdate() + INTERVAL 2 MONTH)) APagarProximoProximoMes,            
-- A receber em todos os meses
(select SUM(ib.valor) from u684253104_impcg.itemBaixa ib
			where ib.baixado = 0) APagarTodosMeses;    


select count(*) from u684253104_impcg.itemVenda iv where iv.idProduto = 12;

SELECT * FROM u684253104_impcg.itemDespesa i WHERE i.idItemDespesa not in (SELECT id.idItemDespesa FROM u684253104_impcg.itemDespesa id JOIN u684253104_impcg.itemBaixa ib ON id.idItemDespesa = ib.idItemDespesa);

select * from u684253104_impcg.itemBaixa;

select b.idBaixa, b.descricao, b.valorTotal, b.dataCriacao, b.status,
(select case when sum(valor) is null then 0 else sum(valor) end from u684253104_impcg.itemBaixa ib where ib.baixado = 1 and b.idBaixa = ib.idBaixa) as valorPago,
(select case when sum(valor) is null then 0 else sum(valor) end from u684253104_impcg.itemBaixa ib where ib.baixado = 0 and b.idBaixa = ib.idBaixa) as valorRestante 
from u684253104_impcg.baixa b
order by b.dataCriacao DESC;

(SELECT SUM(ib.valor) from u684253104_impcg.itemBaixa ib 
inner join u684253104_impcg.itemDespesa d ON ib.idItemDespesa = d.idItemDespesa
where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1 and d.idEntrada is null);

select SUM(iv.quantidade) from u684253104_impcg.itemVenda iv inner join u684253104_impcg.itemEntrada ie ON iv.idItemEntrada = ie.idItemEntrada where ie.idFornecedor = 1;

select f.idFornecedor, f.nome, f.endereco, f.telefone, f.email, f.site, f.instagram, f.dataCriacao, f.dataAlteracao,
case when (select SUM(ie.quantidade) from u684253104_impcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) is null then 0 else 
(select SUM(ie.quantidade) from u684253104_impcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) end quantidadeVendida,
case when (select SUM(ie.valorEmReal) from u684253104_impcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) is null then 0 else 
(select SUM(ie.valorEmReal) from u684253104_impcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) end valorVendido
from u684253104_impcg.fornecedor f
ORDER BY f.nome ASC;

select p.idPagamento, p.idVenda, p.forma, p.valor, p.saldo, pe.nome, p.data 
from u684253104_impcg.pagamento p 
inner join u684253104_impcg.venda v ON p.idVenda = v.idVenda
inner join u684253104_impcg.pessoa pe ON v.idCliente = pe.idPessoa
where p.pago = 0 and p.data = CURDATE();

select p.idPagamento, p.idVenda, p.forma, p.valor, p.saldo, pe.nome, p.data 
from u684253104_impcg.pagamento p 
inner join u684253104_impcg.venda v ON p.idVenda = v.idVenda
inner join u684253104_impcg.pessoa pe ON v.idCliente = pe.idPessoa
where p.pago = 0 and p.dataRecebimento = '2017-12-27';

select SUM(p.saldo) from u684253104_impcg.pagamento p inner join u684253104_impcg.venda v on p.idVenda = v.idVenda where v.status = 'AGUARDANDOPAGAMENTO' and p.pago = 1; 
select SUM(p.saldo) from u684253104_impcg.pagamento p inner join u684253104_impcg.venda v on p.idVenda = v.idVenda where v.status = 'PAGAMENTOPARCIAL' and p.pago = 1;


select SUM(p.saldo) from u684253104_impcg.pagamento p inner join u684253104_impcg.venda v on p.idVenda = v.idVenda where v.status = 'AGUARDANDOPAGAMENTO' and p.pago = 0; 
select SUM(p.saldo) from u684253104_impcg.pagamento p inner join u684253104_impcg.venda v on p.idVenda = v.idVenda where v.status = 'PAGAMENTOPARCIAL' and p.pago = 0; 

SELECT v.idVenda, v.idCliente, v.idFuncionario, v.dataVenda, v.valorTotal, v.quantidadeTotal, v.status,
	case when 
		(select SUM(p.saldo) from u684253104_impcg.pagamento p inner join u684253104_impcg.venda ve on p.idVenda = ve.idVenda where p.pago = 0 and ve.idVenda = v.idVenda)  is null then 0 else 
		(select SUM(p.saldo) from u684253104_impcg.pagamento p inner join u684253104_impcg.venda ve on p.idVenda = ve.idVenda where p.pago = 0 and ve.idVenda = v.idVenda) end as restante
FROM u684253104_impcg.venda v
ORDER BY status ASC, dataVenda DESC;


select p.saldo from u684253104_impcg.pagamento p
			where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and p.pago = 1;
            
select * from u684253104_impcg.itemBaixa ib where ib.baixado = 0 and ib.cheque = 1; 

select * from u684253104_impcg.itemBaixa ib where ib.cheque = 1;         

SELECT
(SELECT SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())
GROUP BY MONTH(v.dataVenda)) a,
(SELECT SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)
GROUP BY MONTH(v.dataVenda)) b,
(SELECT SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 3 MONTH)), 1)) and last_day(sysdate() - INTERVAL 2 MONTH)
GROUP BY MONTH(v.dataVenda)) c,
(SELECT SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 4 MONTH)), 1)) and last_day(sysdate() - INTERVAL 3 MONTH)
GROUP BY MONTH(v.dataVenda)) d,
(SELECT SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 5 MONTH)), 1)) and last_day(sysdate() - INTERVAL 4 MONTH)
GROUP BY MONTH(v.dataVenda)) e,
(SELECT SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 6 MONTH)), 1)) and last_day(sysdate() - INTERVAL 5 MONTH)
GROUP BY MONTH(v.dataVenda)) f;


SELECT MONTH(v.dataVenda), SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())
GROUP BY MONTH(v.dataVenda)
UNION
SELECT MONTH(v.dataVenda), SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)
GROUP BY MONTH(v.dataVenda)
UNION
SELECT MONTH(v.dataVenda), SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 3 MONTH)), 1)) and last_day(sysdate() - INTERVAL 2 MONTH)
GROUP BY MONTH(v.dataVenda)
UNION
SELECT MONTH(v.dataVenda), SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 4 MONTH)), 1)) and last_day(sysdate() - INTERVAL 3 MONTH)
GROUP BY MONTH(v.dataVenda) 
UNION
SELECT MONTH(v.dataVenda), SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 5 MONTH)), 1)) and last_day(sysdate() - INTERVAL 4 MONTH)
GROUP BY MONTH(v.dataVenda)
UNION
SELECT MONTH(v.dataVenda), SUM(iv.valor) from u684253104_impcg.itemVenda iv
JOIN venda v ON iv.idVenda = v.idVenda 
where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 6 MONTH)), 1)) and last_day(sysdate() - INTERVAL 5 MONTH)
GROUP BY MONTH(v.dataVenda);
		
SELECT c.idProduto,
       f.nome,
       c.data,
       c.cotacao,
       c.valorEmDolar,
       c.valorEmReal
FROM   u684253104_impcg.catalogoInternacional c
       JOIN u684253104_impcg.fornecedor f
         ON c.idFornecedor = f.idFornecedor
WHERE  c.idProduto = 6
ORDER  BY c.data DESC;  