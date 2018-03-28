package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Entrada;
import br.com.importcg.service.EntradaService;

@Named
@ViewScoped
public class ListaEntradaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7716223882648115291L;

	@Inject
	private EntradaService entradaService;
	
	private List<Entrada> entradas = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		entradas = entradaService.listarTodos();
	}
	
	public List<Entrada> getEntradas() {
		return entradas;
	}

	public void setEntradas(List<Entrada> entradas) {
		this.entradas = entradas;
	}
}
