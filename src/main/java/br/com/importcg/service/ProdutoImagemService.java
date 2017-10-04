package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.ProdutoImagemDAO;
import br.com.importcg.model.ProdutoImagem;
import br.com.importcg.util.Transacional;

public class ProdutoImagemService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4442651137007859289L;

	@Inject
	private ProdutoImagemDAO produtoImagemDAO;
	
	@Transacional
	public void salvar(ProdutoImagem produtoImagem) {
		produtoImagemDAO.salvar(produtoImagem);
	}

	@Transacional
	public void excluir(ProdutoImagem produtoImagem) {
		produtoImagemDAO.excluir(produtoImagem);
	}
	
	public List<ProdutoImagem> listarTodos() {
		return produtoImagemDAO.listarTodos();
	}
	
	public ProdutoImagem porId(Long id) {
		return produtoImagemDAO.porId(id);
	}

	public List<ProdutoImagem> porIdProduto(Long idProduto) {
		return produtoImagemDAO.porIdProduto(idProduto);		
	}
}
