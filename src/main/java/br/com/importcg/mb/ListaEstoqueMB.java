package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Estoque;
import br.com.importcg.service.EstoqueService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaEstoqueMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9116495315654119255L;
	
	@Inject
	private EstoqueService estoqueService;
	
	private List<Estoque> estoques = new ArrayList<>();
	
	private List<Estoque> estoquesSelecionados = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		estoques = estoqueService.listarTodos();
	}
	
	public void excluirSelecionados() {
		for (Estoque estoque : estoquesSelecionados) {
			estoqueService.excluir(estoque);
			estoques.remove(estoque);
		}
		
		FacesUtil.addInfoMessage("Estoque(s) excluido(s) com sucesso!");
	}

	public List<Estoque> getEstoques() {
		return estoques;
	}

	public void setEstoques(List<Estoque> estoques) {
		this.estoques = estoques;
	}

	public List<Estoque> getEstoquesSelecionados() {
		return estoquesSelecionados;
	}

	public void setEstoquesSelecionados(List<Estoque> estoquesSelecionados) {
		this.estoquesSelecionados = estoquesSelecionados;
	}
}
