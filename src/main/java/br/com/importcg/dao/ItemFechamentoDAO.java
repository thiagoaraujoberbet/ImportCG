package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.ItemFechamento;

public class ItemFechamentoDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8428239533656705310L;

	@Inject
	private EntityManager manager;
	
	public ItemFechamento salvar(ItemFechamento itemFechamento) {
		return manager.merge(itemFechamento);
	}

	public List<ItemFechamento> porIdEntrada(Long idFechamento) {
		return manager.createQuery("SELECT i FROM ItemFechamento i WHERE i.fechamento.id = :idFechamento", ItemFechamento.class).setParameter("idFechamento", idFechamento).getResultList();
	}

	public ItemFechamento porId(Long id) {
		return manager.find(ItemFechamento.class, id);
	}

	public void excluir(ItemFechamento itemFechamento) {
		try {
			itemFechamento = porId(itemFechamento.getId());
			manager.remove(itemFechamento);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O item de fechamento não pode ser excluído");
		}
	}
}
