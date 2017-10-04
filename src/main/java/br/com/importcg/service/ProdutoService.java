package br.com.importcg.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.ProdutoDAO;
import br.com.importcg.model.Produto;
import br.com.importcg.util.Transacional;

public class ProdutoService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4271330362086845421L;
	
	@Inject
	private ProdutoDAO produtoDAO;
	
	@Transacional
	public void salvar(Produto produto) {
		if (produto.isInclusao())
			produto.setDataCriacao(new Date());
		else 
			produto.setDataAlteracao(new Date());
		
		produtoDAO.salvar(produto);
	}

	@Transacional
	public void excluir(Produto produto) {
		produtoDAO.excluir(produto);
	}
	
	public List<Produto> listarTodos() {
		return produtoDAO.listarTodos();
	}
	
	public Produto porId(Long id) {
		return produtoDAO.porId(id);
	}
 }
