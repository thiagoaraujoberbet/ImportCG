package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.enumeration.EnumFormaPagamento;
import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Pagamento;
import br.com.importcg.model.Venda;

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
		return manager.createQuery("SELECT p FROM Pagamento p WHERE p.venda.id = :idVenda ORDER BY p.data ASC", Pagamento.class).setParameter("idVenda", idVenda).getResultList();
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

	@SuppressWarnings("unchecked")
	public List<Pagamento> buscarRecebimentosDiarioCliente() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT p.idPagamento, p.idVenda, p.forma, p.valor, p.saldo, pe.nome ");
		sql.append("FROM importcg.pagamento p ");
		sql.append("INNER JOIN importcg.venda v ON p.idVenda = v.idVenda ");
		sql.append("INNER JOIN importcg.pessoa pe ON v.idCliente = pe.idPessoa ");
		sql.append("WHERE p.pago = 0 and p.data = :data");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		query.setParameter("data", montarData());
		
		List<Object[]> objects = query.getResultList();
		
		List<Pagamento> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			Pagamento pagamento = new Pagamento();
			
			if (item[0] != null) {
				pagamento.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				Venda venda = new Venda();
				venda.setId(Long.parseLong(item[1].toString()));
				pagamento.setVenda(venda);
			}
			
			if (item[2] != null) {
				pagamento.setForma(Enum.valueOf(EnumFormaPagamento.class, item[2].toString()));
			}
			
			if (item[3] != null) {
				pagamento.setValor(new BigDecimal(item[3].toString()));
			}
			
			if (item[4] != null) {
				pagamento.setSaldo(new BigDecimal(item[4].toString()));
			}
			
			if (item[5] != null) {
				pagamento.setNomePagante(item[5].toString());
			}
			
			itens.add(pagamento);
		}
		
		return itens;
	}
	
	private Date montarData() {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String fd = f.format(new Date());
		
		Date date = null;
		try {
			date = f.parse(fd);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return date;
	}

	@SuppressWarnings("unchecked")
	public List<Pagamento> buscarRecebimentosDiarioPagSeguro() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT p.idPagamento, p.idVenda, p.forma, p.valor, p.saldo, pe.nome ");
		sql.append("FROM importcg.pagamento p ");
		sql.append("INNER JOIN importcg.venda v ON p.idVenda = v.idVenda ");
		sql.append("INNER JOIN importcg.pessoa pe ON v.idCliente = pe.idPessoa ");
		sql.append("WHERE p.pago = 0 and p.dataRecebimento = :data");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		query.setParameter("data", montarData());
		
		List<Object[]> objects = query.getResultList();
		
		List<Pagamento> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			Pagamento pagamento = new Pagamento();
			
			if (item[0] != null) {
				pagamento.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				Venda venda = new Venda();
				venda.setId(Long.parseLong(item[1].toString()));
				pagamento.setVenda(venda);
			}
			
			if (item[2] != null) {
				pagamento.setForma(Enum.valueOf(EnumFormaPagamento.class, item[2].toString()));
			}
			
			if (item[3] != null) {
				pagamento.setValor(new BigDecimal(item[3].toString()));
			}
			
			if (item[4] != null) {
				pagamento.setSaldo(new BigDecimal(item[4].toString()));
			}
			
			if (item[5] != null) {
				pagamento.setNomePagante(item[5].toString());
			}
			
			itens.add(pagamento);
		}
		
		return itens;
	}
}
