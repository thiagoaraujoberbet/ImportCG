package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Estoque;

public class EstoqueDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1354084921615678289L;

	@Inject
	private EntityManager manager;
	
	public Estoque salvar(Estoque estoque) {
		return manager.merge(estoque);
	}
	
	public void excluir(Estoque estoque) {
		try {
			estoque = porId(estoque.getId());
			manager.remove(estoque);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O produto não pode ser excluído");
		}
	}

	public Estoque porId(Long id) {
		return manager.find(Estoque.class, id);
	}
	
	public List<Estoque> listarTodos() {
		return manager.createQuery("SELECT e FROM Estoque e ORDER BY e.produto.nome, e.produto.marca, e.produto.modelo ASC", Estoque.class).getResultList();
	}

	public Estoque verificarProdutoEmEstoque(Long idProduto) {
		try {
			Query query = manager.createQuery("SELECT e FROM Estoque e WHERE e.produto.id = :idProduto");
			query.setParameter("idProduto", idProduto);
			
			return (Estoque) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}
}
