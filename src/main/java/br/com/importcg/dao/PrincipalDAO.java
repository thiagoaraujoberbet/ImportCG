package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.wrapper.CalculoMensalWrapper;
import br.com.importcg.wrapper.BalancoWrapper;

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
		sql.append("(SELECT SUM(e.valorTotal) from importcg.entrada e ");
		sql.append("	where e.dataCompra between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)) entradas, ");
		sql.append("(SELECT SUM(iv.valor) from importcg.itemVenda iv ");
		sql.append("	JOIN importcg.venda v ON iv.idVenda = v.idVenda ");
		sql.append("	where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)) saidas, ");
		sql.append("(SELECT SUM(p.saldo) from importcg.pagamento p ");
		sql.append("	where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and p.pago = 1) recebido; ");
		
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
			
			itens.add(balanco);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<BalancoWrapper> buscarBalancoMesAtual() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT ");
		sql.append("(SELECT SUM(e.valorTotal) from importcg.entrada e ");
		sql.append("	where e.dataCompra between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) entradas, ");
		sql.append("(SELECT SUM(iv.valor) from importcg.itemVenda iv ");
		sql.append("	JOIN importcg.venda v ON iv.idVenda = v.idVenda ");
		sql.append("	where v.dataVenda between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) saidas, ");
		sql.append("(SELECT SUM(p.saldo) from importcg.pagamento p ");
		sql.append("	where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and p.pago = 1) recebido; ");
		
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
			
			itens.add(balanco);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<BalancoWrapper> buscarBalancoGeral() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT ");
		sql.append("(SELECT SUM(e.valorTotal) from importcg.entrada e) entradas, ");
		sql.append("(SELECT SUM(iv.valor) from importcg.itemVenda iv) saidas, ");
		sql.append("(SELECT SUM(p.saldo) from importcg.pagamento p WHERE p.pago = 1) recebido ");
		
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
			
			itens.add(balanco);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<CalculoMensalWrapper> buscarValoresAReceber() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select ");
		// A receber no mes atual
		sql.append("(select SUM(p.saldo) from importcg.pagamento p ");
		sql.append("			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) AReceberMesAtual, ");
		// A receber no proximo mês     
		sql.append("(select SUM(p.saldo) from importcg.pagamento p ");
		sql.append("			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 0 MONTH)), 1)) and last_day(sysdate() + INTERVAL 1 MONTH)) AReceberProximoMes1, ");
		// A receber no proximo mês     
		sql.append("(select SUM(p.saldo) from importcg.pagamento p ");
		sql.append("			where p.pago = 0 and p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL -1 MONTH)), 1)) and last_day(sysdate() + INTERVAL 2 MONTH)) AReceberProximoMes2, ");
		// A receber em todos os meses
		sql.append("(select SUM(p.saldo) from importcg.pagamento p ");
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
				receber.setValoresTodosMeses(new BigDecimal(item[3].toString()));
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
		sql.append("(select SUM(ib.valor) from importcg.itemBaixa ib ");
		sql.append("			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate())) APagarMesAtual, ");
		// A receber no proximo mês     
		sql.append("(select SUM(ib.valor) from importcg.itemBaixa ib ");
		sql.append("			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 0 MONTH)), 1)) and last_day(sysdate() + INTERVAL 1 MONTH)) APagarProximoMes1, ");
		// A receber no proximo mês     
		sql.append("(select SUM(ib.valor) from importcg.itemBaixa ib ");
		sql.append("			where ib.baixado = 0 and ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL -1 MONTH)), 1)) and last_day(sysdate() + INTERVAL 2 MONTH)) APagarProximoMes2, ");
		//A receber em todos os meses
		sql.append("(select SUM(ib.valor) from importcg.itemBaixa ib ");
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
				pagar.setValoresTodosMeses(new BigDecimal(item[3].toString()));
			}
			
			itens.add(pagar);
		}
		
		return itens;
	}
}
