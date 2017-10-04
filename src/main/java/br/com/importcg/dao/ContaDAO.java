package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Conta;

public class ContaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6649735805719375145L;

	@Inject
	private EntityManager manager;
	
	public Conta salvar(Conta conta) {
		return manager.merge(conta);
	}
	
	public void excluir(Conta conta) {
		try {
			conta = porId(conta.getId());
			manager.remove(conta);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A conta não pode ser excluída");
		}
	}

	public Conta porId(Long id) {
		return manager.find(Conta.class, id);
	}
	
	public List<Conta> listarTodos() {
		return manager.createQuery("SELECT f FROM Conta f ORDER BY f.nome ASC", Conta.class).getResultList();
	}
}
