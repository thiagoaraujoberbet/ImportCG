package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.ItemVenda;

public class ItemVendaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1527795044717817152L;

	@Inject
	private EntityManager manager;

	public ItemVenda salvar(ItemVenda itemVenda) {
		return manager.merge(itemVenda);
	}

	public List<ItemVenda> porIdEntrada(Long idVenda) {
		return manager.createQuery("SELECT i FROM ItemVenda i WHERE i.venda.id = :idVenda", ItemVenda.class).setParameter("idVenda", idVenda).getResultList();
	}

	public ItemVenda porId(Long id) {
		return manager.find(ItemVenda.class, id);
	}

	public void excluir(ItemVenda itemVenda) {
		try {
			itemVenda = porId(itemVenda.getId());
			manager.remove(itemVenda);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O item de venda não pode ser excluído");
		}
	}
}
