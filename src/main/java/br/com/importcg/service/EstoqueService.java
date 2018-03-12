package br.com.importcg.service;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.EstoqueDAO;
import br.com.importcg.model.Estoque;
import br.com.importcg.model.Produto;
import br.com.importcg.util.Transacional;
import br.com.importcg.wrapper.EstoqueWrapper;

public class EstoqueService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7024245984286025521L;
	
	@Inject
	private EstoqueDAO estoqueDAO;

	@Transacional
	public void salvar(Estoque estoque) {
		estoqueDAO.salvar(estoque);
	}

	@Transacional
	public void excluir(Estoque estoque) {
		estoqueDAO.excluir(estoque);
	}
	
	@Transacional
	public void atualizarEstoquePositivo(Integer quantidade, Produto produto) {
		Estoque estoque = estoqueDAO.verificarProdutoEmEstoque(produto.getId());
		
		if (estoque != null) {
			estoque.setQuantidade(estoque.getQuantidade() + quantidade);
			estoqueDAO.salvar(estoque);
		} else {
			this.salvarEstoque(quantidade, produto);
		}
	}
	
	@Transacional
	public void atualizarEstoqueNegativo(Integer quantidade, Long idProduto) {
		Estoque estoque = estoqueDAO.verificarProdutoEmEstoque(idProduto);
		
		if (estoque != null) {
			estoque.setQuantidade(estoque.getQuantidade() - quantidade);
			estoqueDAO.salvar(estoque);
		} 
	}
	
	private void salvarEstoque(Integer quantidade, Produto produto) {
		Estoque estoque = new Estoque();
		estoque.setProduto(produto);
		estoque.setQuantidade(quantidade);
		
		estoqueDAO.salvar(estoque);
	}
	
	public List<Estoque> listarTodos() {
		return estoqueDAO.listarTodos();
	}
	
	public Estoque porId(Long id) {
		return estoqueDAO.porId(id);
	}

	public Estoque verificarProdutoEmEstoque(Long idProduto) {
		return estoqueDAO.verificarProdutoEmEstoque(idProduto);
	}

	public List<EstoqueWrapper> buscarInformacoesEstoque() {
		return estoqueDAO.buscarInformacoesEstoque();
	}

	public BigDecimal buscarValorProdutosEmEstoque() {
		return estoqueDAO.buscarValorProdutosEmEstoque();
	}
}
