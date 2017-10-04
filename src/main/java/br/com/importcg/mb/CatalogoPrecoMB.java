package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.CatalogoPreco;
import br.com.importcg.model.Produto;
import br.com.importcg.service.CatalogoPrecoService;
import br.com.importcg.service.ProdutoService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class CatalogoPrecoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 345590345790764750L;

	private CatalogoPreco catalogoPreco = new CatalogoPreco();
	
	private Long idCatalogoPreco;
	
	private List<Produto> produtos = new ArrayList<>();
	
	@Inject
	private CatalogoPrecoService catalogoPrecoService;
	
	@Inject
	private ProdutoService produtoService;
	
	public void inicializar() {
		if (idCatalogoPreco != null) 
			catalogoPreco = catalogoPrecoService.porId(idCatalogoPreco);
		
		if (produtos.isEmpty()) {
			produtos = produtoService.listarTodos();
		}
	}

	public String salvar() {
		catalogoPrecoService.salvar(catalogoPreco);
		
		if (catalogoPreco.isEdicao())
			FacesUtil.addInfoMessage("Catalogo de preço editado com sucesso!");
		else
			FacesUtil.addInfoMessage("Catalogo de preço cadastrado com sucesso!");
		
		return "listarCatalogoPreco.xhtml?faces-redirect=true";
	}
	
	public String excluir() {
		catalogoPrecoService.excluir(catalogoPreco);
		
		return "listarCatalogoPreco.xhtml?faces-redirect=true";
	}

	public CatalogoPreco getCatalogoPreco() {
		return catalogoPreco;
	}

	public void setCatalogoPreco(CatalogoPreco catalogoPreco) {
		this.catalogoPreco = catalogoPreco;
	}

	public Long getIdCatalogoPreco() {
		return idCatalogoPreco;
	}

	public void setIdCatalogoPreco(Long idCatalogoPreco) {
		this.idCatalogoPreco = idCatalogoPreco;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}
}
