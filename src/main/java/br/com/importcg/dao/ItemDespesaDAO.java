package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.enumeration.EnumStatusBaixa;
import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.ItemDespesa;

public class ItemDespesaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6083973333775353055L;

	@Inject
	private EntityManager manager;
	
	public ItemDespesa salvar(ItemDespesa itemDespesa) {
		return manager.merge(itemDespesa);
	}
	
	public void excluir(ItemDespesa itemDespesa) {
		try {
			itemDespesa = porId(itemDespesa.getId());
			manager.remove(itemDespesa);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O item da despesa não pode ser excluído");
		}
	}

	public ItemDespesa porId(Long id) {
		return manager.find(ItemDespesa.class, id);
	}
	
	public List<ItemDespesa> listarTodos() {
		return manager.createQuery("SELECT i FROM itemDespesa i", ItemDespesa.class).getResultList();
	}

	public List<ItemDespesa> porIdDespesa(Long idDespesa) {
		return manager.createQuery("SELECT i FROM ItemDespesa i WHERE i.despesa.id = :idDespesa", ItemDespesa.class).setParameter("idDespesa", idDespesa).getResultList();
	}

	public List<ItemDespesa> buscarItensDespesaNaoBaixadas() {
		return manager.createQuery("SELECT i FROM ItemDespesa i ORDER BY i.despesa.dataDespesa DESC", ItemDespesa.class).getResultList();
//		return manager.createQuery("SELECT i FROM ItemDespesa i WHERE i.status = :status ORDER BY i.despesa.dataDespesa DESC", ItemDespesa.class)
//				.setParameter("status", EnumStatusBaixa.NAOBAIXADO).getResultList();
	}
}
