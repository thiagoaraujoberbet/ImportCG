package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.service.EstoqueService;
import br.com.importcg.wrapper.EstoqueWrapper;

@Named
@ViewScoped
public class ListaEstoqueMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9116495315654119255L;
	
	@Inject
	private EstoqueService estoqueService;
	
	private List<EstoqueWrapper> estoques = new ArrayList<>();
	
	private List<EstoqueWrapper> estoquesSelecionados = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		estoques = estoqueService.buscarInformacoesEstoque();
	}
	
	public List<EstoqueWrapper> getEstoques() {
		return estoques;
	}

	public void setEstoques(List<EstoqueWrapper> estoques) {
		this.estoques = estoques;
	}

	public List<EstoqueWrapper> getEstoquesSelecionados() {
		return estoquesSelecionados;
	}

	public void setEstoquesSelecionados(List<EstoqueWrapper> estoquesSelecionados) {
		this.estoquesSelecionados = estoquesSelecionados;
	}
}
