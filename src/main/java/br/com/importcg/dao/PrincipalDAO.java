package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

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
}
