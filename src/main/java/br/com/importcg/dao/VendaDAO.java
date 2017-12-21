package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.enumeration.EnumStatusVenda;
import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Pessoa;
import br.com.importcg.model.Venda;

public class VendaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7306908178058893121L;

	@Inject
	private EntityManager manager;
	
	public Venda salvar(Venda venda) {
		return manager.merge(venda);
	}
	
	public void excluir(Venda venda) {
		try {
			venda = porId(venda.getId());
			manager.remove(venda);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A venda não pode ser excluído");
		}
	}

	public Venda porId(Long id) {
		return manager.find(Venda.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Venda> listarTodos() {
		StringBuilder sql = new StringBuilder();

		sql.append("SELECT v.idVenda, v.idCliente, pC.nome cliente, v.idFuncionario, pF.nome funcionario, v.dataVenda, v.valorTotal, v.quantidadeTotal, v.status, ");
		sql.append("case when ");
		sql.append("(select SUM(p.saldo) from importcg.pagamento p inner join importcg.venda ve on p.idVenda = ve.idVenda where p.pago = 0 and ve.idVenda = v.idVenda)  is null then 0 else ");
		sql.append("(select SUM(p.saldo) from importcg.pagamento p inner join importcg.venda ve on p.idVenda = ve.idVenda where p.pago = 0 and ve.idVenda = v.idVenda) end as restante ");
		sql.append("FROM importcg.venda v ");
		sql.append("INNER JOIN  importcg.pessoa pC ON v.idCliente = pC.idPessoa ");
		sql.append("INNER JOIN  importcg.pessoa pF ON v.idFuncionario = pF.idPessoa ");
		sql.append("ORDER BY status ASC, dataVenda DESC ");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<Venda> vendas = new ArrayList<>();
		
		for (Object[] item : objects) {
			Venda venda = new Venda();
			
			if (item[0] != null) {
				venda.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				Pessoa cliente = new Pessoa();
				cliente.setId(Long.parseLong(item[1].toString()));
				cliente.setNome(item[2].toString());
				venda.setCliente(cliente);
			}
			
			if (item[3] != null) {
				Pessoa funcionario = new Pessoa();
				funcionario.setId(Long.parseLong(item[3].toString()));
				funcionario.setNome(item[4].toString());
				venda.setFuncionario(funcionario);
			}
			
			if (item[5] != null) {
				venda.setDataVenda((Date) item[5]);
			}
			
			if (item[6] != null) {
				venda.setValorTotal(new BigDecimal(item[6].toString()));
			}
			
			if (item[7] != null) {
				venda.setQuantidadeTotal(new Integer(item[7].toString()));
			}
			
			if (item[8] != null) {
				venda.setStatus(Enum.valueOf(EnumStatusVenda.class, item[8].toString()));
			}
			
			if (item[9] != null) {
				venda.setRestante(new BigDecimal(item[9].toString()));
			}
			
			vendas.add(venda);
		}
		
		return vendas;
	}
}
