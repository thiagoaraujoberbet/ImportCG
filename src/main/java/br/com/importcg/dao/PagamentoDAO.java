package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Pagamento;

public class PagamentoDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6715386141083731092L;

	@Inject
	private EntityManager manager;

	public Pagamento salvar(Pagamento pagamento) {
		return manager.merge(pagamento);
	}

	public List<Pagamento> porIdVenda(Long idVenda) {
		return manager.createQuery("SELECT p FROM Pagamento p WHERE p.venda.id = :idVenda", Pagamento.class).setParameter("idVenda", idVenda).getResultList();
	}

	public Pagamento porId(Long id) {
		return manager.find(Pagamento.class, id);
	}

	public void excluir(Pagamento pagamento) {
		try {
			pagamento = porId(pagamento.getId());
			manager.remove(pagamento);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O pagamento não pode ser excluído");
		}
	}
}
