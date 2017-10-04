package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Tramite;
import br.com.importcg.service.TramiteService;

@Named
@ViewScoped
public class ListaTramiteMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -67920395431339810L;

	@Inject
	private TramiteService tramiteService;
	
	private List<Tramite> tramites = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		tramites = tramiteService.listarTodos();
	}
	
	public List<Tramite> getTramites() {
		return tramites;
	}

	public void setTramites(List<Tramite> tramites) {
		this.tramites = tramites;
	}
}
