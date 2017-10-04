package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Baixa;

public class BaixaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6911351193284007090L;

	@Inject
	private EntityManager manager;
	
	public Baixa salvar(Baixa baixa) {
		return manager.merge(baixa);
	}
	
	public void excluir(Baixa baixa) {
		try {
			baixa = porId(baixa.getId());
			manager.remove(baixa);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A baixa não pode ser excluído");
		}
	}

	public Baixa porId(Long id) {
		return manager.find(Baixa.class, id);
	}
	
	public List<Baixa> listarTodos() {
		return manager.createQuery("SELECT b FROM Baixa b ORDER BY b.dataCriacao DESC", Baixa.class).getResultList();
	}
}
