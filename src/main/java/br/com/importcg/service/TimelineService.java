package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.TimelineDAO;
import br.com.importcg.model.Timeline;
import br.com.importcg.util.Transacional;

public class TimelineService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7400644617252333384L;

	@Inject
	private TimelineDAO timelineDAO;
	
	@Transacional
	public void salvar(Timeline timeline) {
		timelineDAO.salvar(timeline);
	}

	@Transacional
	public void excluir(Timeline timeline) {
		timelineDAO.excluir(timeline);
	}
	
	public List<Timeline> listarTodos() {
		return timelineDAO.listarTodos();
	}
	
	public Timeline porId(Long id) {
		return timelineDAO.porId(id);
	}
}
