package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.CatalogoPreco;

public class CatalogoPrecoDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4845126969847845559L;

	@Inject
	private EntityManager manager;
	
	public CatalogoPreco salvar(CatalogoPreco catalogoPreco) {
		return manager.merge(catalogoPreco);
	}
	
	public void excluir(CatalogoPreco catalogoPreco) {
		try {
			catalogoPreco = porId(catalogoPreco.getId());
			manager.remove(catalogoPreco);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O catalogo de preço não pode ser excluída");
		}
	}

	public CatalogoPreco porId(Long id) {
		return manager.find(CatalogoPreco.class, id);
	}
	
	public List<CatalogoPreco> listarTodos() {
		return manager.createQuery("SELECT c FROM CatalogoPreco c ORDER BY c.produto.nome, c.produto.marca, c.produto.modelo ASC", CatalogoPreco.class).getResultList();
	}
}
