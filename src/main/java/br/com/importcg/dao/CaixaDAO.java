package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.enumeration.EnumTipoConta;
import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Caixa;

public class CaixaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4151058933193695805L;

	@Inject
	private EntityManager manager;
	
	public Caixa salvar(Caixa caixa) {
		return manager.merge(caixa);
	}
	
	public void excluir(Caixa caixa) {
		try {
			caixa = porId(caixa.getId());
			manager.remove(caixa);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O caixa não pode ser excluída");
		}
	}

	public Caixa porId(Long id) {
		return manager.find(Caixa.class, id);
	}
	
	public List<Caixa> listarTodos() {
		return manager.createQuery("SELECT c FROM Caixa c ORDER BY c.conta.nome ASC", Caixa.class).getResultList();
	}

	public Caixa porIdFuncionario(Long idFuncionario, EnumTipoConta tipoConta) {
		return (Caixa) manager.createQuery("SELECT c FROM Caixa c WHERE c.conta.funcionario.id = :idFuncionario and c.conta.tipo = :tipoConta", Caixa.class)
				.setParameter("idFuncionario", idFuncionario).setParameter("tipoConta", tipoConta).getSingleResult();
	}

	public Caixa buscarContaPagSeguroAReceber() {
		return (Caixa) manager.createQuery("SELECT c FROM Caixa c WHERE c.conta.nome = :nomeConta", Caixa.class)
				.setParameter("nomeConta", "Conta Digital (A Receber)").getSingleResult();
	}

	public Caixa buscarContaPagSeguroDisponivel() {
		return (Caixa) manager.createQuery("SELECT c FROM Caixa c WHERE c.conta.nome = :nomeConta", Caixa.class)
				.setParameter("nomeConta", "Conta Digital (Disponível)").getSingleResult();
	}

	public BigDecimal obterSaldoTotalCaixa() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT Sum(c.valor) ");
		sql.append("FROM caixa c");

		Query query = manager.createNativeQuery(sql.toString());
		
		return (BigDecimal) query.getSingleResult();
	}
}
