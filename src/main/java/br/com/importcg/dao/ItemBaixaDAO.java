package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.ItemBaixa;

public class ItemBaixaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1879617595597524446L;

	@Inject
	private EntityManager manager;
	
	public ItemBaixa salvar(ItemBaixa itemBaixa) {
		return manager.merge(itemBaixa);
	}
	
	public void excluir(ItemBaixa itemBaixa) {
		try {
			itemBaixa = porId(itemBaixa.getId());
			manager.remove(itemBaixa);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O item de baixa não pode ser excluído");
		}
	}

	public ItemBaixa porId(Long id) {
		return manager.find(ItemBaixa.class, id);
	}
	
	public List<ItemBaixa> listarTodos() {
		return manager.createQuery("SELECT i FROM ItemBaixa i ORDER BY i.data ASC", ItemBaixa.class).getResultList();
	}

	public List<ItemBaixa> porIdBaixa(Long idBaixa) {
		return manager.createQuery("SELECT i FROM ItemBaixa i WHERE i.baixa.id = :idBaixa ORDER BY i.data ASC", ItemBaixa.class).setParameter("idBaixa", idBaixa).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<ItemBaixa> buscarDespesasMensaisBaixadas() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from itemBaixa ib ");
		sql.append("where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1");
		
		return manager.createNativeQuery(sql.toString(), ItemBaixa.class).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<ItemBaixa> buscarDespesasABaixar() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from itemBaixa ib ");
		sql.append("where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and ib.baixado = 0");
		
		return manager.createNativeQuery(sql.toString(), ItemBaixa.class).getResultList();
	}

	public List<ItemBaixa> buscarChequesEmitidos() {
		return manager.createQuery("SELECT i FROM ItemBaixa i WHERE i.baixado = :baixado AND i.cheque = :cheque ORDER BY i.data ASC", ItemBaixa.class)
				.setParameter("baixado", Boolean.FALSE).setParameter("cheque", Boolean.TRUE).getResultList();
	}

	public BigDecimal obterSaldoTotalAPagarMesAtual() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Sum(valor) ");
		sql.append("FROM   itemBaixa ib ");
		sql.append("WHERE  ib.baixado = 0 ");
		sql.append("       AND ib.data BETWEEN (SELECT Adddate(Last_day(Subdate(Curdate(), ");
		sql.append("                                                   INTERVAL 1 month)), 1 ");
		sql.append("                                  )) AND Last_day ");
		sql.append("                              (Sysdate());");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		return (BigDecimal) query.getSingleResult();
	}

	public BigDecimal obterSaldoTotalAPagarProximoMes() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Sum(valor) ");
		sql.append("FROM   itemBaixa ib ");
		sql.append("WHERE  ib.baixado = 0 ");
		sql.append("       AND ib.data BETWEEN (SELECT Adddate(Last_day(Subdate(Curdate(), ");
		sql.append("                                                   INTERVAL 0 month)), 1 ");
		sql.append("                                  )) AND Last_day ");
		sql.append("                              (Sysdate() + INTERVAL 1 month);");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		return (BigDecimal) query.getSingleResult();
	}

	public BigDecimal obterSaldoTotalChequesACairMesAtual() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Sum(valor) ");
		sql.append("FROM   itemBaixa ib ");
		sql.append("WHERE  ib.baixado = :baixado ");
		sql.append("       AND ib.cheque = :cheque ");
		sql.append("       AND ib.data BETWEEN (SELECT Adddate(Last_day(Subdate(Curdate(), ");
		sql.append("                                                   INTERVAL 1 month)), 1 ");
		sql.append("                                  )) AND Last_day ");
		sql.append("                              (Sysdate());");
		
		Query query = manager.createNativeQuery(sql.toString());
		query.setParameter("baixado", Boolean.FALSE);
		query.setParameter("cheque", Boolean.TRUE);
		
		return (BigDecimal) query.getSingleResult();
	}

	public BigDecimal obterSaldoTotalChequesACairProximoMes() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Sum(valor) ");
		sql.append("FROM   itemBaixa ib ");
		sql.append("WHERE  ib.baixado = :baixado ");
		sql.append("       AND ib.cheque = :cheque ");
		sql.append("       AND ib.data BETWEEN (SELECT Adddate(Last_day(Subdate(Curdate(), ");
		sql.append("                                                   INTERVAL 0 month)), 1 ");
		sql.append("                                  )) AND Last_day ");
		sql.append("                              (Sysdate() + INTERVAL 1 month);");
		
		Query query = manager.createNativeQuery(sql.toString());
		query.setParameter("baixado", Boolean.FALSE);
		query.setParameter("cheque", Boolean.TRUE);
		
		return (BigDecimal) query.getSingleResult();
	}
}
