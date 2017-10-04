package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.CatalogoPreco;
import br.com.importcg.service.CatalogoPrecoService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaCatalogoPrecoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5268476697323274186L;
	
	@Inject
	private CatalogoPrecoService catalogoPrecoService;

	private List<CatalogoPreco> catalogos = new ArrayList<>();
	
	private List<CatalogoPreco> catalogosSelecionados = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		catalogos = catalogoPrecoService.listarTodos();
	}
	
	public void excluirSelecionados() {
		for (CatalogoPreco catalogo : catalogosSelecionados) {
			catalogoPrecoService.excluir(catalogo);
			catalogos.remove(catalogo);
		}
		
		FacesUtil.addInfoMessage("Catalogo(s) de preço excluida(s) com sucesso!");
	}

	public List<CatalogoPreco> getCatalogos() {
		return catalogos;
	}

	public void setCatalogos(List<CatalogoPreco> catalogos) {
		this.catalogos = catalogos;
	}

	public List<CatalogoPreco> getCatalogosSelecionados() {
		return catalogosSelecionados;
	}

	public void setCatalogosSelecionados(List<CatalogoPreco> catalogosSelecionados) {
		this.catalogosSelecionados = catalogosSelecionados;
	}
}
