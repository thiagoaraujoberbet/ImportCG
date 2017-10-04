package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Produto;

public class ProdutoDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1622321073848847671L;

	@Inject
	private EntityManager manager;
	
	public Produto salvar(Produto produto) {
		return manager.merge(produto);
	}
	
	public void excluir(Produto produto) {
		try {
			produto = porId(produto.getId());
			manager.remove(produto);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O produto não pode ser excluído");
		}
	}

	public Produto porId(Long id) {
		return manager.find(Produto.class, id);
	}
	
	public List<Produto> listarTodos() {
		return manager.createQuery("SELECT p FROM Produto p ORDER BY p.nome ASC", Produto.class).getResultList();
	}
}
