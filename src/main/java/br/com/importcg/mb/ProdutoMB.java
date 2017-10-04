package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.CatalogoInternacional;
import br.com.importcg.model.Fornecedor;
import br.com.importcg.model.Produto;
import br.com.importcg.model.ProdutoImagem;
import br.com.importcg.service.CatalogoInternacionalService;
import br.com.importcg.service.FornecedorService;
import br.com.importcg.service.ProdutoService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ProdutoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3574906108494269921L;
	
	private Produto produto = new Produto();
	private CatalogoInternacional catalogoInternacional = new CatalogoInternacional();
		
	private Long idProduto;
	private boolean edicaoCatalogoInternacional = false;
	
	private List<ProdutoImagem> imagens = new ArrayList<>();
	private List<Fornecedor> fornecedores = new ArrayList<>();
	private List<CatalogoInternacional> catalogosInternacional = new ArrayList<>();
	
	@Inject
	private ProdutoService produtoService;
	
	@Inject
	private FornecedorService fornecedorService;
	
	@Inject
	private CatalogoInternacionalService catalogoInternacionalService;
	
	public void inicializar() {
		if (idProduto != null) 
			produto = produtoService.porId(idProduto);
		else
			produto.setDataCriacao(new Date());
		
		if (fornecedores.isEmpty()) {
			fornecedores = fornecedorService.listarTodos();
		}
		
		if (catalogosInternacional.isEmpty()) {
			catalogosInternacional = catalogoInternacionalService.porIdProduto(idProduto);
		}
	}

	public String salvar() {
		produtoService.salvar(produto);
		
		if (produto.isEdicao())
			FacesUtil.addInfoMessage("Produto editado com sucesso!");
		else
			FacesUtil.addInfoMessage("Produto cadastrado com sucesso!");
		
		return "listarProduto.xhtml?faces-redirect=true";
	}
	
	public void salvarCatalogoInternacional() {
		catalogoInternacional.setProduto(produto);
		catalogoInternacionalService.salvar(catalogoInternacional);
		
		catalogoInternacional = new CatalogoInternacional();
		catalogosInternacional = catalogoInternacionalService.porIdProduto(idProduto);
		
		this.edicaoCatalogoInternacional = false;
		
		FacesUtil.addInfoMessage("Catalogo Internacional cadastrado com sucesso!");
	}
	
	public String excluir() {
		produtoService.excluir(produto);
		
		return "listarProduto.xhtml?faces-redirect=true";
	}
	
	public void excluirCatalogoInternacional() {
		catalogoInternacionalService.excluir(catalogoInternacional);
		catalogosInternacional.remove(catalogoInternacional);
		
		catalogoInternacional = new CatalogoInternacional();
		
		FacesUtil.addInfoMessage("Catalogo(s) Internacional excluido(s) com sucesso!");
	}
	
	public void calcularValorEmReal() {
		catalogoInternacional.setValorEmReal(catalogoInternacional.getCotacao().multiply(catalogoInternacional.getValorEmDolar()));	
	}
	
	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public CatalogoInternacional getCatalogoInternacional() {
		return catalogoInternacional;
	}

	public void setCatalogoInternacional(CatalogoInternacional catalogoInternacional) {
		this.catalogoInternacional = catalogoInternacional;
	}

	public Long getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Long idProduto) {
		this.idProduto = idProduto;
	}

	public boolean isEdicaoCatalogoInternacional() {
		return edicaoCatalogoInternacional;
	}

	public void setEdicaoCatalogoInternacional(boolean edicaoCatalogoInternacional) {
		this.edicaoCatalogoInternacional = edicaoCatalogoInternacional;
	}

	public List<ProdutoImagem> getImagens() {
		return imagens;
	}

	public void setImagens(List<ProdutoImagem> imagens) {
		this.imagens = imagens;
	}

	public List<Fornecedor> getFornecedores() {
		return fornecedores;
	}

	public void setFornecedores(List<Fornecedor> fornecedores) {
		this.fornecedores = fornecedores;
	}

	public List<CatalogoInternacional> getCatalogosInternacional() {
		return catalogosInternacional;
	}

	public void setCatalogosInternacional(List<CatalogoInternacional> catalogosInternacional) {
		this.catalogosInternacional = catalogosInternacional;
	}
}
