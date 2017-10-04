package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.ProdutoImagem;

public class ProdutoImagemDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2340118990798598092L;

	@Inject
	private EntityManager manager;
	
	public ProdutoImagem salvar(ProdutoImagem produtoImagem) {
		return manager.merge(produtoImagem);
	}
	
	public void excluir(ProdutoImagem produtoImagem) {
		try {
			produtoImagem = porId(produtoImagem.getId());
			manager.remove(produtoImagem);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O produtoImagem não pode ser excluído");
		}
	}

	public ProdutoImagem porId(Long id) {
		return manager.find(ProdutoImagem.class, id);
	}
	
	public List<ProdutoImagem> listarTodos() {
		return manager.createQuery("SELECT p FROM ProdutoImagem p ORDER BY p.nome ASC", ProdutoImagem.class).getResultList();
	}

	public List<ProdutoImagem> porIdProduto(Long idProduto) {
		return manager.createQuery("SELECT p FROM ProdutoImagem p WHERE p.produto.id = :idProduto", ProdutoImagem.class).setParameter("idProduto", idProduto).getResultList();
	}
}
