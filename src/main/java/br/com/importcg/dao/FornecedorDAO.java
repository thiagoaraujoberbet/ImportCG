package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Fornecedor;

public class FornecedorDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7103076812831695151L;

	@Inject
	private EntityManager manager;
	
	public Fornecedor salvar(Fornecedor fornecedor) {
		return manager.merge(fornecedor);
	}
	
	public void excluir(Fornecedor fornecedor) {
		try {
			fornecedor = porId(fornecedor.getId());
			manager.remove(fornecedor);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O fornecedor não pode ser excluído");
		}
	}

	public Fornecedor porId(Long id) {
		return manager.find(Fornecedor.class, id);
	}
	
	public List<Fornecedor> listarTodos() {
		return manager.createQuery("SELECT f FROM Fornecedor f ORDER BY f.nome ASC", Fornecedor.class).getResultList();
	}
}
