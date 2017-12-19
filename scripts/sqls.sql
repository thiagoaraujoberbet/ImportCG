vendaselect IFNULL(sum(iv.quantidade), 0) from importcg.itemVenda iv where iv.idItemEntrada = 29;

select sum(ie.quantidade) from importcg.itemEntrada ie where ie.idItemEntrada = 27;

SELECT x.idItemEntrada, x.valorEmReal, x.idProduto, x.nome, x.marca, x.modelo, x.estoque FROM (
	SELECT DISTINCT i.idItemEntrada, i.valorEmReal, p.idProduto, p.nome, p.marca, p.modelo, 
		(select IFNULL(sum(iv.quantidade), 0) from importcg.itemEntrada iv where iv.idItemEntrada = i.idItemEntrada) -
		(select IFNULL(sum(ie.quantidade), 0) from importcg.itemVenda ie where ie.idItemEntrada = i.idItemEntrada) AS estoque 
	FROM importcg.itemEntrada i 
	INNER JOIN importcg.produto p ON i.idProduto = p.idProduto
) x
WHERE x.estoque > 0
ORDER BY x.nome, x.marca, x.modelo; 

SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)
AS 'primeiro dia do mes', last_day(sysdate()) as 'ultimo dia do mes';

SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1);
SELECT last_day(sysdate());

select 
		(select SUM(e.valorTotal) from importcg.entrada e
			where e.dataCompra between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate())) entradas,
		(select SUM(iv.valor) from importcg.itemVenda iv
			JOIN importcg.venda v ON iv.idVenda = v.idVenda
			where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate())) saidas,
		(select SUM(p.saldo) from importcg.pagamento p
			where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate()) and p.pago = 1) recebido;

select 
		(select SUM(e.valorTotal) from importcg.entrada e
			where e.dataCompra between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) entradas,
		(select SUM(iv.valor) from importcg.itemVenda iv
			JOIN importcg.venda v ON iv.idVenda = v.idVenda
			where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) saidas,
		(select SUM(p.saldo) from importcg.pagamento p
			where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and p.pago = 1) recebido
;

select 
		(select SUM(e.valorTotal) from importcg.entrada e) entradas,
		(select SUM(iv.valor) from importcg.itemVenda iv) saidas,
		(select SUM(p.saldo) from importcg.pagamento p where p.pago = 1) recebido
;

	SELECT e.idEstoque, e.idProduto, e.quantidade, p.nome, p.marca, p.modelo, p.categoria, p.descricao,
	case when (select SUM(iv.quantidade) FROM importcg.itemVenda iv WHERE iv.idProduto = p.idProduto) is null then 0 else 
		(select SUM(iv.quantidade) FROM importcg.itemVenda iv WHERE iv.idProduto = p.idProduto) end quantidadeTotalVenda
	FROM importcg.estoque e
	JOIN importcg.produto p ON e.idProduto = p.idProduto
    ORDER BY p.nome, p.marca, p.modelo;
    
    
    SELECT p.idPessoa, p.nome, p.cargo, p.cpf, p.dataNascimento, p.celular, p.email, p.tipo, p.dataCriacao, p.dataAlteracao,
    case when (select SUM(iv.quantidade) from importcg.itemVenda iv JOIN importcg.venda v ON iv.idVenda = v.idVenda where v.idFuncionario = p.idPessoa) is null then 0 else 
    (select SUM(iv.quantidade) from importcg.itemVenda iv JOIN importcg.venda v ON iv.idVenda = v.idVenda where v.idFuncionario = p.idPessoa) end quantidadeVendida
    FROM importcg.pessoa p 
    WHERE p.tipo = 'FUNCIONARIO'
    ORDER BY p.nome; 
    
	SELECT p.idPessoa, p.nome, p.cargo, p.cpf, p.dataNascimento, p.celular, p.email, p.tipo, p.dataCriacao, p.dataAlteracao,
    case when (select SUM(iv.quantidade) from importcg.itemVenda iv JOIN importcg.venda v ON iv.idVenda = v.idVenda where v.idCliente = p.idPessoa) is null then 0 else 
    (select SUM(iv.quantidade) from importcg.itemVenda iv JOIN importcg.venda v ON iv.idVenda = v.idVenda where v.idCliente = p.idPessoa) end quantidadeVendida
    FROM importcg.pessoa p 
    WHERE p.tipo = 'CLIENTE'
    ORDER BY p.nome; 
    
    
select 
		(select SUM(ib.valor) from importcg.itemBaixa ib
			JOIN importcg.baixa b ON ib.idBaixa = b.idBaixa
			where b.dataCriacao between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1) entradas,
		(select SUM(id.valor) from importcg.itemDespesa id
			JOIN importcg.despesa d ON id.idDespesa = d.idDespesa
			where id.idEntrada is null and d.dataDespesa between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)) despesas,
		(select SUM(p.saldo) from importcg.pagamento p
			where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and p.pago = 1) recebido,
		(select SUM(ib.valor) from importcg.itemBaixa ib
			where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and ib.baixado = 0) despesasAPagar

select 
		(select SUM(p.saldo) from importcg.pagamento p
			where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and p.pago = 1) recebido


/*buscar Despesa Baixadas*/
select * from importcg.itemBaixa ib
where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1

/*buscar Despesa a serem Baixadas no mes*/
select * from importcg.itemBaixa ib
where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and ib.baixado = 0;


select 	
-- A receber no mes atual
(select SUM(p.saldo) from importcg.pagamento p
			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) AReceberMesAtual,
-- A receber no proximo mês            
(select SUM(p.saldo) from importcg.pagamento p
			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 0 MONTH)), 1)) and last_day(sysdate() + INTERVAL 1 MONTH)) AReceberProximoMes,
-- A receber no proximo mês              
(select SUM(p.saldo) from importcg.pagamento p
			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL -1 MONTH)), 1)) and last_day(sysdate() + INTERVAL 2 MONTH)) AReceberProximoProximoMes,            
-- A receber em todos os meses
(select SUM(p.saldo) from importcg.pagamento p
			where p.pago = 0) AReceberTodosMeses;       
            
            
select 	
-- A receber no mes atual
(select SUM(ib.valor) from importcg.itemBaixa ib
			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) APagarMesAtual,
-- A receber no proximo mês            
(select SUM(ib.valor) from importcg.itemBaixa ib
			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 0 MONTH)), 1)) and last_day(sysdate() + INTERVAL 1 MONTH)) APagarProximoMes,
-- A receber no proximo mês              
(select SUM(ib.valor) from importcg.itemBaixa ib
			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL -1 MONTH)), 1)) and last_day(sysdate() + INTERVAL 2 MONTH)) APagarProximoProximoMes,            
-- A receber em todos os meses
(select SUM(ib.valor) from importcg.itemBaixa ib
			where ib.baixado = 0) APagarTodosMeses;    


select count(*) from importcg.itemVenda iv where iv.idProduto = 12;

SELECT * FROM importcg.itemDespesa i WHERE i.idItemDespesa not in (SELECT id.idItemDespesa FROM importcg.itemDespesa id JOIN importcg.itemBaixa ib ON id.idItemDespesa = ib.idItemDespesa);

select * from importcg.itemBaixa;

select b.idBaixa, b.descricao, b.valorTotal, b.dataCriacao, b.status,
(select case when sum(valor) is null then 0 else sum(valor) end from importcg.itemBaixa ib where ib.baixado = 1 and b.idBaixa = ib.idBaixa) as valorPago,
(select case when sum(valor) is null then 0 else sum(valor) end from importcg.itemBaixa ib where ib.baixado = 0 and b.idBaixa = ib.idBaixa) as valorRestante 
from importcg.baixa b
order by b.dataCriacao DESC;

(SELECT SUM(ib.valor) from importcg.itemBaixa ib 
inner join importcg.itemDespesa d ON ib.idItemDespesa = d.idItemDespesa
where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1 and d.idEntrada is null);

select SUM(iv.quantidade) from importcg.itemVenda iv inner join importcg.itemEntrada ie ON iv.idItemEntrada = ie.idItemEntrada where ie.idFornecedor = 1;

select f.idFornecedor, f.nome, f.endereco, f.telefone, f.email, f.site, f.instagram, f.dataCriacao, f.dataAlteracao,
case when (select SUM(ie.quantidade) from importcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) is null then 0 else 
(select SUM(ie.quantidade) from importcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) end quantidadeVendida,
case when (select SUM(ie.valorEmReal) from importcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) is null then 0 else 
(select SUM(ie.valorEmReal) from importcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) end valorVendido
from importcg.fornecedor f
ORDER BY f.nome ASC;

select p.idPagamento, p.idVenda, p.forma, p.valor, p.saldo, pe.nome, p.data 
from importcg.pagamento p 
inner join importcg.venda v ON p.idVenda = v.idVenda
inner join importcg.pessoa pe ON v.idCliente = pe.idPessoa
where p.pago = 0 and p.data = CURDATE();

select p.idPagamento, p.idVenda, p.forma, p.valor, p.saldo, pe.nome, p.data 
from importcg.pagamento p 
inner join importcg.venda v ON p.idVenda = v.idVenda
inner join importcg.pessoa pe ON v.idCliente = pe.idPessoa
where p.pago = 0 and p.dataRecebimento = '2017-12-27';

select SUM(p.saldo) from importcg.pagamento p inner join importcg.venda v on p.idVenda = v.idVenda where v.status = 'AGUARDANDOPAGAMENTO' and p.pago = 1; 
select SUM(p.saldo) from importcg.pagamento p inner join importcg.venda v on p.idVenda = v.idVenda where v.status = 'PAGAMENTOPARCIAL' and p.pago = 1;


select SUM(p.saldo) from importcg.pagamento p inner join importcg.venda v on p.idVenda = v.idVenda where v.status = 'AGUARDANDOPAGAMENTO' and p.pago = 0; 
select SUM(p.saldo) from importcg.pagamento p inner join importcg.venda v on p.idVenda = v.idVenda where v.status = 'PAGAMENTOPARCIAL' and p.pago = 0; 