package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Retirada;

public class RetiradaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6862607708944495836L;

	@Inject
	private EntityManager manager;
	
	public Retirada salvar(Retirada retirada) {
		return manager.merge(retirada);
	}
	
	public void excluir(Retirada retirada) {
		try {
			retirada = porId(retirada.getId());
			manager.remove(retirada);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A Retirada não pode ser excluída");
		}
	}

	public Retirada porId(Long id) {
		return manager.find(Retirada.class, id);
	}
	
	public List<Retirada> listarTodos() {
		return manager.createQuery("SELECT r FROM Retirada r ORDER BY r.id DESC", Retirada.class).getResultList();
	}
}
