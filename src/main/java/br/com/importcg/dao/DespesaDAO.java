package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Despesa;

public class DespesaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6083973333775353055L;

	@Inject
	private EntityManager manager;
	
	public Despesa salvar(Despesa despesa) {
		return manager.merge(despesa);
	}
	
	public void excluir(Despesa despesa) {
		try {
			despesa = porId(despesa.getId());
			manager.remove(despesa);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A despesa não pode ser excluído");
		}
	}

	public Despesa porId(Long id) {
		return manager.find(Despesa.class, id);
	}
	
	public List<Despesa> listarTodos() {
		return manager.createQuery("SELECT d FROM Despesa d ORDER BY d.dataDespesa DESC", Despesa.class).getResultList();
	}
}
