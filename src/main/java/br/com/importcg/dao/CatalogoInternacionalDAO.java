package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.CatalogoInternacional;

public class CatalogoInternacionalDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6053967808303400667L;

	@Inject
	private EntityManager manager;
	
	public CatalogoInternacional salvar(CatalogoInternacional catalogoInternacional) {
		return manager.merge(catalogoInternacional);
	}
	
	public void excluir(CatalogoInternacional catalogoInternacional) {
		try {
			catalogoInternacional = porId(catalogoInternacional.getId());
			manager.remove(catalogoInternacional);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O catalogo internacional não pode ser excluído");
		}
	}

	public CatalogoInternacional porId(Long id) {
		return manager.find(CatalogoInternacional.class, id);
	}
	
	public List<CatalogoInternacional> listarTodos() {
		return manager.createQuery("SELECT c FROM CatalogoInternacional c ORDER BY c.nome ASC", CatalogoInternacional.class).getResultList();
	}

	public List<CatalogoInternacional> porIdProduto(Long idProduto) {
		return manager.createQuery("SELECT c FROM CatalogoInternacional c WHERE c.produto.id = :idProduto ORDER BY c.data DESC", CatalogoInternacional.class).setParameter("idProduto", idProduto).getResultList();
	}
}
