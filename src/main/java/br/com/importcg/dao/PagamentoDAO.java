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

//	@SuppressWarnings("unchecked")
//	public List<PagamentoWrapper> buscarInfoPagamentoPorIdVenda(Long idVenda) {
//		StringBuilder sql = new StringBuilder();
//		
//		sql.append("SELECT p.idPagamento, p.modalidade, p.forma, p.parcela, i.idItemPagamento, i.valor, i.data, i.pago ");
//		sql.append("FROM pagamento p ");
//		sql.append("LEFT JOIN itemPagamento i ON i.idPagamento = p.idPagamento ");
//		sql.append("ORDER BY i.data ASC ");
//		
//		Query query = manager.createNativeQuery(sql.toString());
//		
//		List<Object[]> objects = query.getResultList();
//		
//		List<PagamentoWrapper> itensWrapper = new ArrayList<>();
//		
//		for (Object[] item : objects) {
//			PagamentoWrapper pagamentoWrapper = new PagamentoWrapper();
//			
//			if (item[0] != null) {
//				pagamentoWrapper.setIdPagamento(Long.parseLong(item[0].toString()));
//			}
//			
//			if (item[1] != null) {
//				pagamentoWrapper.setModalidade(Enum.valueOf(EnumModalidadePagamento.class, item[1].toString()));
//			}
//			
//			if (item[2] != null) {
//				pagamentoWrapper.setForma(Enum.valueOf(EnumFormaPagamento.class, item[2].toString()));
//			}
//			
//			if (item[3] != null) {
//				pagamentoWrapper.setParcela((Integer) item[3]);
//			}
//			
//			if (item[4] != null) {
//				pagamentoWrapper.setIdItemPagamento(Long.parseLong(item[4].toString()));
//			}
//			
//			if (item[5] != null) {
//				pagamentoWrapper.setValor((BigDecimal) item[5]);
//			}
//			
//			if (item[6] != null) {
//				pagamentoWrapper.setData((Date) item[6]);
//			}
//			
//			if (item[7] != null) {
//				pagamentoWrapper.setPago(Boolean.valueOf(item[7].toString()));
//			}
//			
//			itensWrapper.add(pagamentoWrapper);
//		}
//		
//		return itensWrapper;
//	}
}
