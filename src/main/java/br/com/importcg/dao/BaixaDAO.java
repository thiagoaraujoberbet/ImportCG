package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.enumeration.EnumStatusBaixa;
import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Baixa;

public class BaixaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6911351193284007090L;

	@Inject
	private EntityManager manager;
	
	public Baixa salvar(Baixa baixa) {
		return manager.merge(baixa);
	}
	
	public void excluir(Baixa baixa) {
		try {
			baixa = porId(baixa.getId());
			manager.remove(baixa);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A baixa não pode ser excluído");
		}
	}

	public Baixa porId(Long id) {
		return manager.find(Baixa.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Baixa> listarTodos() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select b.idBaixa, b.descricao, b.valorTotal, b.dataCriacao, b.status, ");
		sql.append("(select case when sum(valor) is null then 0 else sum(valor) end from importcg.itemBaixa ib where ib.baixado = 1 and b.idBaixa = ib.idBaixa) as valorPago, ");
		sql.append("(select case when sum(valor) is null then 0 else sum(valor) end from importcg.itemBaixa ib where ib.baixado = 0 and b.idBaixa = ib.idBaixa) as valorRestante ");
		sql.append("from importcg.baixa b ");
		sql.append("order by b.dataCriacao DESC ");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<Baixa> baixas = new ArrayList<>();
		
		for (Object[] item : objects) {
			Baixa baixa = new Baixa();
			
			if (item[0] != null) {
				baixa.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				baixa.setDescricao(item[1].toString());
			}
			
			if (item[2] != null) {
				baixa.setValorTotal(new BigDecimal(item[2].toString()));
			}
			
			if (item[3] != null) {
				baixa.setDataCriacao((Date) item[3]);
			}
			
			if (item[4] != null) {
				baixa.setStatus(Enum.valueOf(EnumStatusBaixa.class, item[4].toString()));
			}
			
			if (item[5] != null) {
				baixa.setValorPago(new BigDecimal(item[5].toString()));
			}
			
			if (item[6] != null) {
				baixa.setValorRestante(new BigDecimal(item[6].toString()));
			}
			
			baixas.add(baixa);
		}
		
		return baixas;
	}
}
