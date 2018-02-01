package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Aplicacao;

public class AplicacaoDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8262485291157232838L;

	@Inject
	private EntityManager manager;
	
	public Aplicacao salvar(Aplicacao aplicacao) {
		return manager.merge(aplicacao);
	}
	
	public void excluir(Aplicacao aplicacao) {
		try {
			aplicacao = porId(aplicacao.getId());
			manager.remove(aplicacao);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A Aplicação não pode ser excluída");
		}
	}

	public Aplicacao porId(Long id) {
		return manager.find(Aplicacao.class, id);
	}
	
	public List<Aplicacao> listarTodos() {
		return manager.createQuery("SELECT a FROM Aplicacao a ORDER BY a.id DESC", Aplicacao.class).getResultList();
	}
}
