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
		sql.append("(SELECT SUM(e.valorTotal) from entrada e ");
		sql.append("	where e.dataCompra between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH)) entradas, ");
		sql.append("(SELECT SUM(ib.valor) from itemBaixa ib ");
		sql.append("	where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and ib.baixado = 1) despesasBaixadas, ");
		sql.append("(SELECT SUM(ib.valor) from itemBaixa ib ");
		sql.append("	where ib.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 1 MONTH)), 1)) and last_day(sysdate()) and ib.baixado = 0) despesasABaixar, ");
		sql.append("(SELECT SUM(p.saldo) from pagamento p ");
		sql.append("	where p.data between (SELECT ADDDATE(LAST_DAY(SUBDATE(CURDATE(), INTERVAL 2 MONTH)), 1)) and last_day(sysdate() - INTERVAL 1 MONTH) and p.pago = 1) recebido ");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		Object[] objects = (Object[]) query.getSingleResult();
		
		if (objects[0] != null) {
			fechamento.setValorEntradas(new BigDecimal(objects[0].toString()));
		} else fechamento.setValorEntradas(new BigDecimal(0));
		
		if (objects[1] != null) {
			fechamento.setValorDespesasBaixadas(new BigDecimal(objects[1].toString()));
		} else fechamento.setValorDespesasBaixadas(new BigDecimal(0));
		
		if (objects[2] != null) {
			fechamento.setValorDespesasABaixar(new BigDecimal(objects[2].toString()));
		} else fechamento.setValorDespesasABaixar(new BigDecimal(0));
		
		if (objects[3] != null) {
			fechamento.setValorRecebido(new BigDecimal(objects[3].toString()));
		} else fechamento.setValorRecebido(new BigDecimal(0));
			
		return fechamento;
	}
}
