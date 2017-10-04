package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Tramite;

public class TramiteDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8541183573755861335L;

	@Inject
	private EntityManager manager;
	
	public Tramite salvar(Tramite tramite) {
		return manager.merge(tramite);
	}
	
	public void excluir(Tramite tramite) {
		try {
			tramite = porId(tramite.getId());
			manager.remove(tramite);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O trâmite não pode ser excluída");
		}
	}

	public Tramite porId(Long id) {
		return manager.find(Tramite.class, id);
	}
	
	public List<Tramite> listarTodos() {
		return manager.createQuery("SELECT t FROM Tramite t ORDER BY t.id DESC", Tramite.class).getResultList();
	}
}
