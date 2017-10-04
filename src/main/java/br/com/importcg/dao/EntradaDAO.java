package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Entrada;

public class EntradaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1557263704454907671L;

	@Inject
	private EntityManager manager;
	
	public Entrada salvar(Entrada entrada) {
		return manager.merge(entrada);
	}
	
	public void excluir(Entrada entrada) {
		try {
			entrada = porId(entrada.getId());
			manager.remove(entrada);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A entrada não pode ser excluído");
		}
	}

	public Entrada porId(Long id) {
		return manager.find(Entrada.class, id);
	}
	
	public List<Entrada> listarTodos() {
		return manager.createQuery("SELECT e FROM Entrada e ORDER BY e.dataCompra DESC", Entrada.class).getResultList();
	}

	public List<Entrada> buscarEntradasNaoLancadas() {
		return manager.createQuery("SELECT e FROM Entrada e WHERE e.despesaLancada = :despesaLancada ORDER BY e.dataCompra DESC", Entrada.class)
				.setParameter("despesaLancada", Boolean.FALSE).getResultList();
	}
}
