package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Fechamento;

public class FechamentoDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6375677053491407164L;
	
	@Inject
	private EntityManager manager;
	
	public Fechamento salvar(Fechamento fechamento) {
		return manager.merge(fechamento);
	}
	
	public void excluir(Fechamento fechamento) {
		try {
			fechamento = porId(fechamento.getId());
			manager.remove(fechamento);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O fechamento não pode ser excluído");
		}
	}

	public Fechamento porId(Long id) {
		return manager.find(Fechamento.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Fechamento> listarTodos() {
		return manager.createNativeQuery("SELECT * FROM fechamento ORDER BY data DESC", Fechamento.class).getResultList();
	}

	public Fechamento buscarValoresFechamento(Fechamento fechamento) {
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT ");
		sql.append("(SELECT SUM(e.valorTotal) from importcg.entrada e ");
		sql.append("	where e.dataCompra between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)) entradas, ");
		sql.append("(SELECT SUM(id.valor) from importcg.itemDespesa id ");
		sql.append("	JOIN importcg.despesa d ON id.idDespesa = d.idDespesa ");
		sql.append("	where id.idEntrada is null and d.dataDespesa between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)) despesas, ");
		sql.append("(SELECT SUM(p.saldo) from importcg.pagamento p ");
		sql.append("	where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and p.pago = 1) recebido; ");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		Object[] objects = (Object[]) query.getSingleResult();
		
		fechamento.setValorEntradas(new BigDecimal(objects[0].toString()));
		fechamento.setValorDespesas(new BigDecimal(objects[1].toString()));
		fechamento.setValorRecebido(new BigDecimal(objects[2].toString()));
			
		return fechamento;
	}
}
