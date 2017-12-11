package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Venda;

public class VendaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7306908178058893121L;

	@Inject
	private EntityManager manager;
	
	public Venda salvar(Venda venda) {
		return manager.merge(venda);
	}
	
	public void excluir(Venda venda) {
		try {
			venda = porId(venda.getId());
			manager.remove(venda);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A venda não pode ser excluído");
		}
	}

	public Venda porId(Long id) {
		return manager.find(Venda.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Venda> listarTodos() {
		return manager.createNativeQuery("SELECT * FROM venda ORDER BY status ASC, dataVenda DESC", Venda.class).getResultList();
	}
}
