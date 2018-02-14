package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Orcamento;
import br.com.importcg.model.Pessoa;

public class OrcamentoDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3157440306836322994L;

	@Inject
	private EntityManager manager;
	
	public Orcamento salvar(Orcamento orcamento) {
		return manager.merge(orcamento);
	}
	
	public void excluir(Orcamento orcamento) {
		try {
			orcamento = porId(orcamento.getId());
			manager.remove(orcamento);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A orçamento não pode ser excluído");
		}
	}

	public Orcamento porId(Long id) {
		return manager.find(Orcamento.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Orcamento> listarTodos() {
		StringBuilder sql = new StringBuilder();

		sql.append("SELECT v.idOrcamento, v.idCliente, pC.nome cliente, v.idFuncionario, pF.nome funcionario, v.data, v.valorTotal, v.quantidadeTotal ");
		sql.append("FROM orcamento v ");
		sql.append("INNER JOIN  pessoa pC ON v.idCliente = pC.idPessoa ");
		sql.append("INNER JOIN  pessoa pF ON v.idFuncionario = pF.idPessoa ");
		sql.append("ORDER BY data DESC ");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<Orcamento> orcamentos = new ArrayList<>();
		
		for (Object[] item : objects) {
			Orcamento orcamento = new Orcamento();
			
			if (item[0] != null) {
				orcamento.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				Pessoa cliente = new Pessoa();
				cliente.setId(Long.parseLong(item[1].toString()));
				cliente.setNome(item[2].toString());
				orcamento.setCliente(cliente);
			}
			
			if (item[3] != null) {
				Pessoa funcionario = new Pessoa();
				funcionario.setId(Long.parseLong(item[3].toString()));
				funcionario.setNome(item[4].toString());
				orcamento.setFuncionario(funcionario);
			}
			
			if (item[5] != null) {
				orcamento.setData((Date) item[5]);
			}
			
			if (item[6] != null) {
				orcamento.setValorTotal(new BigDecimal(item[6].toString()));
			}
			
			if (item[7] != null) {
				orcamento.setQuantidadeTotal(new Integer(item[7].toString()));
			}
			
			orcamentos.add(orcamento);
		}
		
		return orcamentos;
	}
}
