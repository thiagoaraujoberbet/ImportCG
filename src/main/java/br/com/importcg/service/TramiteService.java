package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.TramiteDAO;
import br.com.importcg.model.Tramite;
import br.com.importcg.util.Transacional;

public class TramiteService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5529505380161667735L;

	@Inject
	private TramiteDAO tramiteDAO;
	
	@Transacional
	public void salvar(Tramite tramite) {
		tramiteDAO.salvar(tramite);
	}

	@Transacional
	public void excluir(Tramite tramite) {
		tramiteDAO.excluir(tramite);
	}
	
	public List<Tramite> listarTodos() {
		return tramiteDAO.listarTodos();
	}
	
	public Tramite porId(Long id) {
		return tramiteDAO.porId(id);
	}
}
