package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Retirada;
import br.com.importcg.service.RetiradaService;

@Named
@ViewScoped
public class ListaRetiradaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8003161962819310260L;

	@Inject
	private RetiradaService retiradaService;
	
	private List<Retirada> retiradas = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		retiradas = retiradaService.listarTodos();
	}
	
	public List<Retirada> getRetiradas() {
		return retiradas;
	}

	public void setRetiradas(List<Retirada> retiradas) {
		this.retiradas = retiradas;
	}
}
