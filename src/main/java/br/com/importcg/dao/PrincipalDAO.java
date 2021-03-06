package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.wrapper.BalancoMensalWrapper;
import br.com.importcg.wrapper.BalancoWrapper;
import br.com.importcg.wrapper.CalculoMensalWrapper;

public class PrincipalDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3475973553153901979L;

	@Inject
	private EntityManager manager;

	@SuppressWarnings("unchecked")
	public List<BalancoWrapper> buscarBalancoMesAnterior() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT ");
		sql.append("(SELECT SUM(e.valorTotal) from entrada e ");
		sql.append("	where e.dataCompra between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)) entradas, ");
		sql.append("(SELECT SUM(iv.valor * iv.quantidade) from itemVenda iv ");
		sql.append("	JOIN venda v ON iv.idVenda = v.idVenda ");
		sql.append("	where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)) saidas, ");
		sql.append("(SELECT SUM(p.saldo) from pagamento p ");
		sql.append("	where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and p.pago = 1) recebido, ");
		sql.append("(SELECT SUM(ib.valor) from itemBaixa ib ");
		sql.append("	inner join itemDespesa d ON ib.idItemDespesa = d.idItemDespesa ");
		sql.append("	where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1 and d.idEntrada is null) despesas, ");
		sql.append("(SELECT SUM(ib.valor) from itemBaixa ib ");
		sql.append("	inner join itemDespesa d ON ib.idItemDespesa = d.idItemDespesa ");
		sql.append("	where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1) pago");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<BalancoWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			BalancoWrapper balanco = new BalancoWrapper();
			
			if (item[0] != null) {
				balanco.setValoresEntrada(new BigDecimal(item[0].toString()));
			}
			
			if (item[1] != null) {
				balanco.setValoresSaida(new BigDecimal(item[1].toString()));
			}
			
			if (item[2] != null) {
				balanco.setValoresRecebido(new BigDecimal(item[2].toString()));
			}
			
			if (item[3] != null) {
				balanco.setValoresDespesa(new BigDecimal(item[3].toString()));
			}
			
			if (item[4] != null) {
				balanco.setValoresPago(new BigDecimal(item[4].toString()));
			}
			
			itens.add(balanco);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<BalancoWrapper> buscarBalancoMesAtual() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT ");
		sql.append("(SELECT SUM(e.valorTotal) from entrada e ");
		sql.append("	where e.dataCompra between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) entradas, ");
		sql.append("(SELECT SUM(iv.valor * iv.quantidade) from itemVenda iv ");
		sql.append("	JOIN venda v ON iv.idVenda = v.idVenda ");
		sql.append("	where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) saidas, ");
		sql.append("(SELECT SUM(p.saldo) from pagamento p ");
		sql.append("	where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and p.pago = 1) recebido, ");
		sql.append("(SELECT SUM(ib.valor) from itemBaixa ib ");
		sql.append("	inner join itemDespesa d ON ib.idItemDespesa = d.idItemDespesa ");
		sql.append("	where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and ib.baixado = 1 and d.idEntrada is null) despesas, ");
		sql.append("(SELECT SUM(ib.valor) from itemBaixa ib ");
		sql.append("	inner join itemDespesa d ON ib.idItemDespesa = d.idItemDespesa ");
		sql.append("	where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and ib.baixado = 1) pago;");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<BalancoWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			BalancoWrapper balanco = new BalancoWrapper();
			
			if (item[0] != null) {
				balanco.setValoresEntrada(new BigDecimal(item[0].toString()));
			}
			
			if (item[1] != null) {
				balanco.setValoresSaida(new BigDecimal(item[1].toString()));
			}
			
			if (item[2] != null) {
				balanco.setValoresRecebido(new BigDecimal(item[2].toString()));
			}
			
			if (item[3] != null) {
				balanco.setValoresDespesa(new BigDecimal(item[3].toString()));
			}
			
			if (item[4] != null) {
				balanco.setValoresPago(new BigDecimal(item[4].toString()));
			}
			
			itens.add(balanco);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<BalancoWrapper> buscarBalancoGeral() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT ");
		sql.append("(SELECT SUM(e.valorTotal) from entrada e) entradas, ");
		sql.append("(SELECT SUM(iv.valor * iv.quantidade) from itemVenda iv) saidas, ");
		sql.append("(SELECT SUM(p.saldo) from pagamento p WHERE p.pago = 1) recebido, ");
		sql.append("(SELECT SUM(ib.valor) from itemBaixa ib ");
		sql.append("	inner join itemDespesa d ON ib.idItemDespesa = d.idItemDespesa ");
		sql.append("	where ib.baixado = 1 and d.idEntrada is null) despesas, ");
		sql.append("(SELECT SUM(ib.valor) from itemBaixa ib ");
		sql.append("	inner join itemDespesa d ON ib.idItemDespesa = d.idItemDespesa ");
		sql.append("	where ib.baixado = 1) pago;");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<BalancoWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			BalancoWrapper balanco = new BalancoWrapper();
			
			if (item[0] != null) {
				balanco.setValoresEntrada(new BigDecimal(item[0].toString()));
			}
			
			if (item[1] != null) {
				balanco.setValoresSaida(new BigDecimal(item[1].toString()));
			}
			
			if (item[2] != null) {
				balanco.setValoresRecebido(new BigDecimal(item[2].toString()));
			}
			
			if (item[3] != null) {
				balanco.setValoresDespesa(new BigDecimal(item[3].toString()));
			}
			
			if (item[4] != null) {
				balanco.setValoresPago(new BigDecimal(item[4].toString()));
			}
			
			itens.add(balanco);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<CalculoMensalWrapper> buscarValoresAReceber() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select ");
		// A receber no mes atual
		sql.append("(select SUM(p.saldo) from pagamento p ");
		sql.append("			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) AReceberMesAtual, ");
		// A receber no proximo mês     
		sql.append("(select SUM(p.saldo) from pagamento p ");
		sql.append("			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 0 MONTH)), 1)) and last_day(sysdate() + INTERVAL 1 MONTH)) AReceberProximoMes1, ");
		// A receber no proximo mês     
		sql.append("(select SUM(p.saldo) from pagamento p ");
		sql.append("			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL -1 MONTH)), 1)) and last_day(sysdate() + INTERVAL 2 MONTH)) AReceberProximoMes2, ");
		// A receber no proximo mês     
		sql.append("(select SUM(p.saldo) from pagamento p ");
		sql.append("			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL -2 MONTH)), 1)) and last_day(sysdate() + INTERVAL 3 MONTH)) AReceberProximoMes3, ");
		// A receber em todos os meses
		sql.append("(select SUM(p.saldo) from pagamento p ");
		sql.append("			where p.pago = 0) AReceberTodosMeses ");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<CalculoMensalWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			CalculoMensalWrapper receber = new CalculoMensalWrapper();
			
			if (item[0] != null) {
				receber.setValoresMesAtual(new BigDecimal(item[0].toString()));
			}
			
			if (item[1] != null) {
				receber.setValoresProximoMes1(new BigDecimal(item[1].toString()));
			}
			
			if (item[2] != null) {
				receber.setValoresProximoMes2(new BigDecimal(item[2].toString()));
			}
			
			if (item[3] != null) {
				receber.setValoresProximoMes3(new BigDecimal(item[3].toString()));
			}
			
			if (item[4] != null) {
				receber.setValoresTodosMeses(new BigDecimal(item[4].toString()));
			}
			
			itens.add(receber);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<CalculoMensalWrapper> buscarValoresAPagar() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select ");
		// A receber no mes atual
		sql.append("(select SUM(ib.valor) from itemBaixa ib ");
		sql.append("			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) APagarMesAtual, ");
		// A receber no proximo mês     
		sql.append("(select SUM(ib.valor) from itemBaixa ib ");
		sql.append("			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 0 MONTH)), 1)) and last_day(sysdate() + INTERVAL 1 MONTH)) APagarProximoMes1, ");
		// A receber no proximo mês     
		sql.append("(select SUM(ib.valor) from itemBaixa ib ");
		sql.append("			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL -1 MONTH)), 1)) and last_day(sysdate() + INTERVAL 2 MONTH)) APagarProximoMes2, ");
		// A receber no proximo mês     
		sql.append("(select SUM(ib.valor) from itemBaixa ib ");
		sql.append("			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL -2 MONTH)), 1)) and last_day(sysdate() + INTERVAL 3 MONTH)) APagarProximoMes3, ");
		//A receber em todos os meses
		sql.append("(select SUM(ib.valor) from itemBaixa ib ");
		sql.append("			where ib.baixado = 0) APagarTodosMeses ");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<CalculoMensalWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			CalculoMensalWrapper pagar = new CalculoMensalWrapper();
			
			if (item[0] != null) {
				pagar.setValoresMesAtual(new BigDecimal(item[0].toString()));
			}
			
			if (item[1] != null) {
				pagar.setValoresProximoMes1(new BigDecimal(item[1].toString()));
			}
			
			if (item[2] != null) {
				pagar.setValoresProximoMes2(new BigDecimal(item[2].toString()));
			}
			
			if (item[3] != null) {
				pagar.setValoresProximoMes3(new BigDecimal(item[3].toString()));
			}
			
			if (item[4] != null) {
				pagar.setValoresTodosMeses(new BigDecimal(item[4].toString()));
			}
			
			itens.add(pagar);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<BalancoMensalWrapper> buscarEntradaPorMes() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Year(e.dataCompra), ");
		sql.append("       Month(e.dataCompra), ");
		sql.append("       Sum(e.valorTotal) ");
		sql.append("FROM   entrada e ");
		sql.append("GROUP  BY Year(e.dataCompra), ");
		sql.append("          Month(e.dataCompra) ");
		sql.append("ORDER  BY Year(e.dataCompra) ASC, ");
		sql.append("          Month(e.dataCompra) ASC;");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<BalancoMensalWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			BalancoMensalWrapper balanco = new BalancoMensalWrapper();
			
			if (item[0] != null) {
				balanco.setAno(new Integer(item[0].toString()));
			}
			
			if (item[1] != null) {
				balanco.setMes(new Integer(item[1].toString()));
			}
			
			if (item[2] != null) {
				balanco.setValor(new BigDecimal(item[2].toString()));
			}
			
			itens.add(balanco);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<BalancoMensalWrapper> buscarSaidasPorMes() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Year(v.dataVenda), ");
		sql.append("       Month(v.dataVenda), ");
		sql.append("       Sum(iv.valor) ");
		sql.append("FROM   itemVenda iv ");
		sql.append("       JOIN venda v ");
		sql.append("         ON iv.idVenda = v.idVenda ");
		sql.append("GROUP  BY Year(v.dataVenda), ");
		sql.append("          Month(v.dataVenda) ");
		sql.append("ORDER  BY Year(v.dataVenda) ASC, ");
		sql.append("          Month(v.dataVenda) ASC;");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<BalancoMensalWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			BalancoMensalWrapper balanco = new BalancoMensalWrapper();
			
			if (item[0] != null) {
				balanco.setAno(new Integer(item[0].toString()));
			}
			
			if (item[1] != null) {
				balanco.setMes(new Integer(item[1].toString()));
			}
			
			if (item[2] != null) {
				balanco.setValor(new BigDecimal(item[2].toString()));
			}
			
			itens.add(balanco);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<BalancoMensalWrapper> buscarRecebidosPorMes() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Year(p.data), ");
		sql.append("       Month(p.data), ");
		sql.append("       Sum(p.saldo) ");
		sql.append("FROM   pagamento p ");
		sql.append("WHERE  p.pago = 1 ");
		sql.append("GROUP  BY Year(p.data), ");
		sql.append("          Month(p.data) ");
		sql.append("ORDER  BY Year(p.data) ASC, ");
		sql.append("          Month(p.data) ASC;");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<BalancoMensalWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			BalancoMensalWrapper balanco = new BalancoMensalWrapper();
			
			if (item[0] != null) {
				balanco.setAno(new Integer(item[0].toString()));
			}
			
			if (item[1] != null) {
				balanco.setMes(new Integer(item[1].toString()));
			}
			
			if (item[2] != null) {
				balanco.setValor(new BigDecimal(item[2].toString()));
			}
			
			itens.add(balanco);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<BalancoMensalWrapper> buscarDespesasPorMes() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Year(ib.data), ");
		sql.append("       Month(ib.data), ");
		sql.append("       Sum(ib.valor) ");
		sql.append("FROM   itemBaixa ib ");
		sql.append("       INNER JOIN itemDespesa d ");
		sql.append("               ON ib.idItemDespesa = d.idItemDespesa ");
		sql.append("WHERE  ib.baixado = 1 ");
		sql.append("       AND d.idEntrada IS NULL ");
		sql.append("GROUP  BY Year(ib.data), ");
		sql.append("          Month(ib.data) ");
		sql.append("ORDER  BY Year(ib.data) ASC, ");
		sql.append("          Month(ib.data) ASC;");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<BalancoMensalWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			BalancoMensalWrapper balanco = new BalancoMensalWrapper();
			
			if (item[0] != null) {
				balanco.setAno(new Integer(item[0].toString()));
			}
			
			if (item[1] != null) {
				balanco.setMes(new Integer(item[1].toString()));
			}
			
			if (item[2] != null) {
				balanco.setValor(new BigDecimal(item[2].toString()));
			}
			
			itens.add(balanco);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<BalancoMensalWrapper> buscarPagosPorMes() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Year(ib.data), ");
		sql.append("       Month(ib.data), ");
		sql.append("       Sum(ib.valor) ");
		sql.append("FROM   itemBaixa ib ");
		sql.append("       INNER JOIN itemDespesa d ");
		sql.append("               ON ib.idItemDespesa = d.idItemDespesa ");
		sql.append("WHERE  ib.baixado = 1 ");
		sql.append("GROUP  BY Year(ib.data), ");
		sql.append("          Month(ib.data) ");
		sql.append("ORDER  BY Year(ib.data) ASC, ");
		sql.append("          Month(ib.data) ASC;");

		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<BalancoMensalWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			BalancoMensalWrapper balanco = new BalancoMensalWrapper();
			
			if (item[0] != null) {
				balanco.setAno(new Integer(item[0].toString()));
			}
			
			if (item[1] != null) {
				balanco.setMes(new Integer(item[1].toString()));
			}
			
			if (item[2] != null) {
				balanco.setValor(new BigDecimal(item[2].toString()));
			}
			
			itens.add(balanco);
		}
		
		return itens;
	}

	public BigDecimal buscarRecordVendas() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Max(x.valor) valor ");
		sql.append("FROM   (SELECT Year(v.dataVenda), ");
		sql.append("               Month(v.dataVenda), ");
		sql.append("               Sum(iv.valor) valor ");
		sql.append("        FROM   itemVenda iv ");
		sql.append("               JOIN venda v ");
		sql.append("                 ON iv.idVenda = v.idVenda ");
		sql.append("        GROUP  BY Year(v.dataVenda), ");
		sql.append("                  Month(v.dataVenda) ");
		sql.append("        ORDER  BY Year(v.dataVenda) ASC, ");
		sql.append("                  Month(v.dataVenda) ASC) x;");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		return (BigDecimal) query.getSingleResult();
	}
}
