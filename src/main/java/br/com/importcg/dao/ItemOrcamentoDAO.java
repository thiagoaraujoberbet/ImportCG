package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.ItemOrcamento;

public class ItemOrcamentoDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8505920123252490512L;

	@Inject
	private EntityManager manager;

	public ItemOrcamento salvar(ItemOrcamento itemOrcamento) {
		return manager.merge(itemOrcamento);
	}

	public List<ItemOrcamento> porIdOrcamento(Long idOrcamento) {
		return manager.createQuery("SELECT i FROM ItemOrcamento i WHERE i.orcamento.id = :idOrcamento", ItemOrcamento.class).setParameter("idOrcamento", idOrcamento).getResultList();
	}

	public ItemOrcamento porId(Long id) {
		return manager.find(ItemOrcamento.class, id);
	}

	public void excluir(ItemOrcamento itemOrcamento) {
		try {
			itemOrcamento = porId(itemOrcamento.getId());
			manager.remove(itemOrcamento);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O item do orçamento não pode ser excluído");
		}
	}
}
