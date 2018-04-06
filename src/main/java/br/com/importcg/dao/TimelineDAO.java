package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Timeline;

public class TimelineDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -940168223785486650L;

	@Inject
	private EntityManager manager;
	
	public Timeline salvar(Timeline timeline) {
		return manager.merge(timeline);
	}
	
	public void excluir(Timeline timeline) {
		try {
			timeline = porId(timeline.getId());
			manager.remove(timeline);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A timeline não pode ser excluído");
		}
	}

	public Timeline porId(Long id) {
		return manager.find(Timeline.class, id);
	}
	
	public List<Timeline> listarTodos() {
		return manager.createQuery("SELECT t FROM Timeline t ORDER BY t.id DESC", Timeline.class).getResultList();
	}
}
