package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

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
		return manager.createQuery("SELECT i FROM ItemBaixa i WHERE i.baixa.id = :idBaixa", ItemBaixa.class).setParameter("idBaixa", idBaixa).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<ItemBaixa> buscarDespesasBaixadas() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from importcg.itemBaixa ib ");
		sql.append("where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1");
		
		return manager.createNativeQuery(sql.toString(), ItemBaixa.class).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<ItemBaixa> buscarDespesasABaixar() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from importcg.itemBaixa ib ");
		sql.append("where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and ib.baixado = 0");
		
		return manager.createNativeQuery(sql.toString(), ItemBaixa.class).getResultList();
	}
}
