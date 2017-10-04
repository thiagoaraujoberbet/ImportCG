package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Produto;
import br.com.importcg.service.ProdutoService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaProdutoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4388149597350942331L;

	@Inject
	private ProdutoService produtoService;
	
	private List<Produto> produtos = new ArrayList<>();
	
	private List<Produto> produtosSelecionados = new ArrayList<>();

	@PostConstruct
	public void inicializar() {
		produtos = produtoService.listarTodos();
	}
	
	public void excluirSelecionados() {
		for (Produto produto : produtosSelecionados) {
			produtoService.excluir(produto);
			produtos.remove(produto);
		}
		
		FacesUtil.addInfoMessage("Produto(s) excluido(s) com sucesso!");
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

	public List<Produto> getProdutosSelecionados() {
		return produtosSelecionados;
	}

	public void setProdutosSelecionados(List<Produto> produtosSelecionados) {
		this.produtosSelecionados = produtosSelecionados;
	}
}
