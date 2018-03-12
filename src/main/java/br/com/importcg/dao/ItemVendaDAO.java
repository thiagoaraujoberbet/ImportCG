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
import br.com.importcg.model.ItemVenda;
import br.com.importcg.wrapper.QuantidadeVendidaFuncionarioWrapper;
import br.com.importcg.wrapper.ValorVendidoFuncionarioWrapper;
import br.com.importcg.wrapper.VendasRealizadasWrapper;

public class ItemVendaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1527795044717817152L;

	@Inject
	private EntityManager manager;

	public ItemVenda salvar(ItemVenda itemVenda) {
		return manager.merge(itemVenda);
	}

	public List<ItemVenda> porIdVenda(Long idVenda) {
		return manager.createQuery("SELECT i FROM ItemVenda i WHERE i.venda.id = :idVenda", ItemVenda.class).setParameter("idVenda", idVenda).getResultList();
	}

	public ItemVenda porId(Long id) {
		return manager.find(ItemVenda.class, id);
	}

	public void excluir(ItemVenda itemVenda) {
		try {
			itemVenda = porId(itemVenda.getId());
			manager.remove(itemVenda);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O item de venda não pode ser excluído");
		}
	}

	public boolean verificarProdutoVendido(Long idProduto) {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select count(iv) from ItemVenda iv where iv.produto.id = :idProduto");
		Query query = manager.createQuery(sql.toString());
		query.setParameter("idProduto", idProduto);
		
		return (Long) query.getSingleResult() > 0L ? true : false;
	}

	@SuppressWarnings("unchecked")
	public List<ValorVendidoFuncionarioWrapper> buscarValorVendidoFuncionario(Long idPessoa) {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT p.idPessoa, ");
		sql.append("       p.nome, ");
		sql.append("       Year(v.dataVenda), ");
		sql.append("       Month(v.dataVenda), ");
		sql.append("       Sum(iv.valor) ");
		sql.append("FROM   u684253104_impcg.itemVenda iv ");
		sql.append("       JOIN u684253104_impcg.venda v ");
		sql.append("         ON iv.idVenda = v.idVenda ");
		sql.append("       JOIN u684253104_impcg.pessoa p ");
		sql.append("         ON v.idFuncionario = p.idPessoa ");
		sql.append("WHERE  p.idPessoa = :idPessoa ");
		sql.append("GROUP  BY p.idPessoa, ");
		sql.append("          Year(v.dataVenda), ");
		sql.append("          Month(v.dataVenda) ");
		sql.append("ORDER  BY p.idPessoa, ");
		sql.append("          Year(v.dataVenda) ASC, ");
		sql.append("          Month(v.dataVenda) ASC;");
		
		Query query = manager.createNativeQuery(sql.toString());
		query.setParameter("idPessoa", idPessoa);
		
		List<Object[]> objects = query.getResultList();
		
		List<ValorVendidoFuncionarioWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			ValorVendidoFuncionarioWrapper funcionario = new ValorVendidoFuncionarioWrapper();
			
			if (item[0] != null) {
				funcionario.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				funcionario.setNome(item[1].toString());
			}
			
			if (item[2] != null) {
				funcionario.setAno(new Integer(item[2].toString()));
			}
			
			if (item[3] != null) {
				funcionario.setMes(new Integer(item[3].toString()));
			}
			
			if (item[4] != null) {
				funcionario.setValor(new BigDecimal(item[4].toString()));
			}
			
			itens.add(funcionario);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<QuantidadeVendidaFuncionarioWrapper> buscarQuantidadeVendidaFuncionario(Long idPessoa) {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT p.idPessoa, ");
		sql.append("       p.nome, ");
		sql.append("       Year(v.dataVenda), ");
		sql.append("       Month(v.dataVenda), ");
		sql.append("       Sum(iv.quantidade) ");
		sql.append("FROM   u684253104_impcg.itemVenda iv ");
		sql.append("       JOIN u684253104_impcg.venda v ");
		sql.append("         ON iv.idVenda = v.idVenda ");
		sql.append("       JOIN u684253104_impcg.pessoa p ");
		sql.append("         ON v.idFuncionario = p.idPessoa ");
		sql.append("WHERE  p.idPessoa = :idPessoa ");
		sql.append("GROUP  BY p.idPessoa, ");
		sql.append("          Year(v.dataVenda), ");
		sql.append("          Month(v.dataVenda) ");
		sql.append("ORDER  BY p.idPessoa, ");
		sql.append("          Year(v.dataVenda) ASC, ");
		sql.append("          Month(v.dataVenda) ASC;");
		
		Query query = manager.createNativeQuery(sql.toString());
		query.setParameter("idPessoa", idPessoa);
		
		List<Object[]> objects = query.getResultList();
		
		List<QuantidadeVendidaFuncionarioWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			QuantidadeVendidaFuncionarioWrapper funcionario = new QuantidadeVendidaFuncionarioWrapper();
			
			if (item[0] != null) {
				funcionario.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				funcionario.setNome(item[1].toString());
			}
			
			if (item[2] != null) {
				funcionario.setAno(new Integer(item[2].toString()));
			}
			
			if (item[3] != null) {
				funcionario.setMes(new Integer(item[3].toString()));
			}
			
			if (item[4] != null) {
				funcionario.setQuantidade(new Integer(item[4].toString()));
			}
			
			itens.add(funcionario);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<VendasRealizadasWrapper> buscarVendasRealizadasPorProduto(Long idProduto) {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT c.nome, ");
		sql.append("       iv.valor, ");
		sql.append("       iv.quantidade, ");
		sql.append("       v.dataVenda ");
		sql.append("FROM   u684253104_impcg.itemVenda iv ");
		sql.append("       JOIN u684253104_impcg.produto p ");
		sql.append("         ON iv.idProduto = p.idProduto ");
		sql.append("       JOIN u684253104_impcg.venda v ");
		sql.append("         ON iv.idVenda = v.idVenda ");
		sql.append("       JOIN u684253104_impcg.itemEntrada ie ");
		sql.append("         ON iv.idItemEntrada = ie.idItemEntrada ");
		sql.append("       JOIN u684253104_impcg.pessoa c ");
		sql.append("         ON v.idCliente = c.idPessoa ");
		sql.append("WHERE  p.idProduto = :idProduto ");
		sql.append("ORDER  BY v.dataVenda DESC;");
		
		Query query = manager.createNativeQuery(sql.toString());
		query.setParameter("idProduto", idProduto);
		
		List<Object[]> objects = query.getResultList();
		
		List<VendasRealizadasWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			VendasRealizadasWrapper vendas = new VendasRealizadasWrapper();
			
			if (item[0] != null) {
				vendas.setNome(item[0].toString());
			}
			
			if (item[1] != null) {
				vendas.setValorVenda(new BigDecimal(item[1].toString()));
			}
			
			if (item[2] != null) {
				vendas.setQuantidade((Integer) item[2]);
			}
			
			if (item[3] != null) {
				vendas.setDataVenda((Date) item[3]);
			}
			
			itens.add(vendas);
		}
		
		return itens;
	}
}
