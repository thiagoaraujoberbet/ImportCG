package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.enumeration.EnumCargo;
import br.com.importcg.enumeration.EnumTipoPessoa;
import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Pessoa;
import br.com.importcg.wrapper.ProdutosCompradosPorCliente;
import br.com.importcg.wrapper.QuantidadeCompradaWrapper;
import br.com.importcg.wrapper.ValorCompradoWrapper;

public class PessoaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2558202767126197772L;

	@Inject
	private EntityManager manager;
	
	public Pessoa salvar(Pessoa pessoa) {
		return manager.merge(pessoa);
	}
	
	public void excluir(Pessoa pessoa) {
		try {
			pessoa = porId(pessoa.getId());
			manager.remove(pessoa);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("A pessoa não pode ser excluído");
		}
	}

	public Pessoa porId(Long id) {
		return manager.find(Pessoa.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Pessoa> listarTodos(EnumTipoPessoa tipo) {
		if (EnumTipoPessoa.FUNCIONARIO.equals(tipo))
			return manager.createNativeQuery("SELECT * FROM pessoa WHERE tipo = :tipo ORDER BY nome ASC", Pessoa.class).setParameter("tipo", EnumTipoPessoa.FUNCIONARIO.toString()).getResultList();
		else if (EnumTipoPessoa.CLIENTE.equals(tipo))
			return manager.createNativeQuery("SELECT * FROM pessoa WHERE tipo = :tipo ORDER BY nome ASC", Pessoa.class).setParameter("tipo", EnumTipoPessoa.CLIENTE.toString()).getResultList();
		else 
			return manager.createNativeQuery("SELECT * FROM pessoa ORDER BY nome ASC", Pessoa.class).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Pessoa> buscarInformacoesFuncionario() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT p.idPessoa, p.nome, p.cargo, p.cpf, p.dataNascimento, p.celular, p.email, p.tipo, p.dataCriacao, p.dataAlteracao, ");
		sql.append("    case when (select SUM(iv.quantidade) from itemVenda iv JOIN venda v ON iv.idVenda = v.idVenda where v.idFuncionario = p.idPessoa) is null then 0 else ");
		sql.append("    (select SUM(iv.quantidade) from itemVenda iv JOIN venda v ON iv.idVenda = v.idVenda where v.idFuncionario = p.idPessoa) end quantidadeVendida, ");
		sql.append("    case when (select SUM(iv.valor) from itemVenda iv JOIN venda v ON iv.idVenda = v.idVenda where v.idFuncionario = p.idPessoa) is null then 0 else ");
		sql.append("    (select SUM(iv.valor) from itemVenda iv JOIN venda v ON iv.idVenda = v.idVenda where v.idFuncionario = p.idPessoa) end valorVendido ");
		sql.append("FROM pessoa p "); 
		sql.append("WHERE p.tipo = 'FUNCIONARIO' ");  
		sql.append("ORDER BY p.nome "); 
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<Pessoa> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			Pessoa pessoa = new Pessoa();
			
			if (item[0] != null) {
				pessoa.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				pessoa.setNome(item[1].toString());
			}
			
			if (item[2] != null) {
				pessoa.setCargo(Enum.valueOf(EnumCargo.class, item[2].toString()));
			}
			
			if (item[3] != null) {
				pessoa.setCpf(item[3].toString());
			}
			
			if (item[4] != null) {
				pessoa.setDataNascimento((Date) item[4]);
			}
			
			if (item[5] != null) {
				pessoa.setCelular(item[5].toString());
			}
			
			if (item[6] != null) {
				pessoa.setEmail(item[6].toString());
			}
			
			if (item[7] != null) {
				pessoa.setTipo(Enum.valueOf(EnumTipoPessoa.class, item[7].toString()));
			}
			
			if (item[8] != null) {
				pessoa.setDataCriacao((Date) item[8]);
			}	
			
			if (item[9] != null) {
				pessoa.setDataAlteracao((Date) item[9]);
			}
			
			if (item[10] != null) {
				pessoa.setQuantidadeVendida(new Integer(item[10].toString()));
			}
			
			if (item[11] != null) {
				pessoa.setValorVendido(new BigDecimal(item[11].toString()));
			}
			
			itens.add(pessoa);
		}
		
		return itens;
	}
	
	@SuppressWarnings("unchecked")
	public List<Pessoa> buscarInformacoesCliente() {
		StringBuffer  sql = new StringBuffer();
		
		sql.append("SELECT * ");
		sql.append("FROM   (SELECT p.idPessoa, ");
		sql.append("               p.nome, ");
		sql.append("               p.cargo, ");
		sql.append("               p.cpf, ");
		sql.append("               p.dataNascimento, ");
		sql.append("               p.celular, ");
		sql.append("               p.email, ");
		sql.append("               p.tipo, ");
		sql.append("               p.dataCriacao, ");
		sql.append("               p.dataAlteracao, ");
		sql.append("               CASE ");
		sql.append("                 WHEN (SELECT Sum(iv.quantidade) ");
		sql.append("                       FROM   u684253104_impcg.itemVenda iv ");
		sql.append("                              JOIN venda v ");
		sql.append("                                ON iv.idVenda = v.idVenda ");
		sql.append("                       WHERE  v.idCliente = p.idPessoa) IS NULL THEN 0 ");
		sql.append("                 ELSE (SELECT Sum(iv.quantidade) ");
		sql.append("                       FROM   u684253104_impcg.itemVenda iv ");
		sql.append("                              JOIN venda v ");
		sql.append("                                ON iv.idVenda = v.idVenda ");
		sql.append("                       WHERE  v.idCliente = p.idPessoa) ");
		sql.append("               END quantidadeComprada, ");
		sql.append("               CASE ");
		sql.append("                 WHEN (SELECT Sum(iv.valor) ");
		sql.append("                       FROM   u684253104_impcg.itemVenda iv ");
		sql.append("                              JOIN venda v ");
		sql.append("                                ON iv.idVenda = v.idVenda ");
		sql.append("                       WHERE  v.idCliente = p.idPessoa) IS NULL THEN 0 ");
		sql.append("                 ELSE (SELECT Sum(iv.valor) ");
		sql.append("                       FROM   u684253104_impcg.itemVenda iv ");
		sql.append("                              JOIN venda v ");
		sql.append("                                ON iv.idVenda = v.idVenda ");
		sql.append("                       WHERE  v.idCliente = p.idPessoa) ");
		sql.append("               END valorComprado, ");
		sql.append("               CASE ");
		sql.append("                 WHEN (SELECT Sum(pag.saldo) ");
		sql.append("                       FROM   u684253104_impcg.pagamento pag ");
		sql.append("                              JOIN venda v ");
		sql.append("                                ON pag.idVenda = v.idVenda ");
		sql.append("                       WHERE  v.idCliente = p.idPessoa ");
		sql.append("                              AND pag.pago = 0) IS NULL THEN 0 ");
		sql.append("                 ELSE (SELECT Sum(pag.saldo) ");
		sql.append("                       FROM   u684253104_impcg.pagamento pag ");
		sql.append("                              JOIN venda v ");
		sql.append("                                ON pag.idVenda = v.idVenda ");
		sql.append("                       WHERE  v.idCliente = p.idPessoa ");
		sql.append("                              AND pag.pago = 0) ");
		sql.append("               END valorDevido ");
		sql.append("        FROM   u684253104_impcg.pessoa p ");
		sql.append("        WHERE  p.tipo = 'CLIENTE') cliente ");
		sql.append("ORDER  BY valorDevido DESC, ");
		sql.append("          nome ASC;");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<Pessoa> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			Pessoa pessoa = new Pessoa();
			
			if (item[0] != null) {
				pessoa.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				pessoa.setNome(item[1].toString());
			}
			
			if (item[2] != null) {
				pessoa.setCargo(Enum.valueOf(EnumCargo.class, item[2].toString()));
			}
			
			if (item[3] != null) {
				pessoa.setCpf(item[3].toString());
			}
			
			if (item[4] != null) {
				pessoa.setDataNascimento((Date) item[4]);
			}
			
			if (item[5] != null) {
				pessoa.setCelular(item[5].toString());
			}
			
			if (item[6] != null) {
				pessoa.setEmail(item[6].toString());
			}
			
			if (item[7] != null) {
				pessoa.setTipo(Enum.valueOf(EnumTipoPessoa.class, item[7].toString()));
			}
			
			if (item[8] != null) {
				pessoa.setDataCriacao((Date) item[8]);
			}	
			
			if (item[9] != null) {
				pessoa.setDataAlteracao((Date) item[9]);
			}
			
			if (item[10] != null) {
				pessoa.setQuantidadeComprada(new Integer(item[10].toString()));
			}
			
			if (item[11] != null) {
				pessoa.setValorComprado(new BigDecimal(item[11].toString()));
			}
			
			if (item[12] != null) {
				pessoa.setValorDevido(new BigDecimal(item[12].toString()));
			}
			
			itens.add(pessoa);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<QuantidadeCompradaWrapper> buscarMaioresCompradoresPorQtde() {
		StringBuffer  sql = new StringBuffer();
		
		sql.append("SELECT * ");
		sql.append("FROM   (SELECT p.idPessoa, ");
		sql.append("               p.nome, ");
		sql.append("               CASE ");
		sql.append("                 WHEN (SELECT Sum(iv.quantidade) ");
		sql.append("                       FROM   u684253104_impcg.itemVenda iv ");
		sql.append("                              JOIN venda v ");
		sql.append("                                ON iv.idVenda = v.idVenda ");
		sql.append("                       WHERE  v.idCliente = p.idPessoa) IS NULL THEN 0 ");
		sql.append("                 ELSE (SELECT Sum(iv.quantidade) ");
		sql.append("                       FROM   u684253104_impcg.itemVenda iv ");
		sql.append("                              JOIN venda v ");
		sql.append("                                ON iv.idVenda = v.idVenda ");
		sql.append("                       WHERE  v.idCliente = p.idPessoa) ");
		sql.append("               end quantidadeComprada ");
		sql.append("        FROM   u684253104_impcg.pessoa p ");
		sql.append("        WHERE  p.tipo = 'CLIENTE' ");
		sql.append("               AND p.idPessoa <> 46) cliente ");
		sql.append("ORDER  BY quantidadeComprada DESC, ");
		sql.append("          nome ASC ");
		sql.append("LIMIT  10;");

		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<QuantidadeCompradaWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			QuantidadeCompradaWrapper pessoa = new QuantidadeCompradaWrapper();
			
			if (item[0] != null) {
				pessoa.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				pessoa.setNome(item[1].toString());
			}
			
			if (item[2] != null) {
				pessoa.setQuantidade(new Integer(item[2].toString()));
			}
			
			itens.add(pessoa);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<ValorCompradoWrapper> buscarMaioresCompradoresPorValor() {
		StringBuffer  sql = new StringBuffer();
		
		sql.append("SELECT * ");
		sql.append("FROM   (SELECT p.idPessoa, ");
		sql.append("               p.nome, ");
		sql.append("               CASE ");
		sql.append("                 WHEN (SELECT Sum(iv.valor) ");
		sql.append("                       FROM   u684253104_impcg.itemVenda iv ");
		sql.append("                              JOIN venda v ");
		sql.append("                                ON iv.idVenda = v.idVenda ");
		sql.append("                       WHERE  v.idCliente = p.idPessoa) IS NULL THEN 0 ");
		sql.append("                 ELSE (SELECT Sum(iv.valor) ");
		sql.append("                       FROM   u684253104_impcg.itemVenda iv ");
		sql.append("                              JOIN venda v ");
		sql.append("                                ON iv.idVenda = v.idVenda ");
		sql.append("                       WHERE  v.idCliente = p.idPessoa) ");
		sql.append("               end valorComprado ");
		sql.append("        FROM   u684253104_impcg.pessoa p ");
		sql.append("        WHERE  p.tipo = 'CLIENTE' ");
		sql.append("               AND p.idPessoa <> 46) cliente ");
		sql.append("ORDER  BY valorComprado DESC, ");
		sql.append("          nome ASC ");
		sql.append("LIMIT  10;");

		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<ValorCompradoWrapper> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			ValorCompradoWrapper pessoa = new ValorCompradoWrapper();
			
			if (item[0] != null) {
				pessoa.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				pessoa.setNome(item[1].toString());
			}
			
			if (item[2] != null) {
				pessoa.setValor(new BigDecimal(item[2].toString()));
			}
			
			itens.add(pessoa);
		}
		
		return itens;
	}

	@SuppressWarnings("unchecked")
	public List<ProdutosCompradosPorCliente> buscarProdutosCompradosPorCliente(Long idCliente) {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT pr.idProduto, ");
		sql.append("       pr.nome, ");
		sql.append("       pr.marca, ");
		sql.append("       pr.modelo, ");
		sql.append("       iv.valor, ");
		sql.append("       v.dataVenda ");
		sql.append("FROM   u684253104_impcg.itemVenda iv ");
		sql.append("       JOIN u684253104_impcg.venda v ");
		sql.append("         ON iv.idVenda = v.idVenda ");
		sql.append("       JOIN u684253104_impcg.pessoa p ");
		sql.append("         ON v.idCliente = p.idPessoa ");
		sql.append("       JOIN u684253104_impcg.produto pr ");
		sql.append("         ON iv.idProduto = pr.idProduto ");
		sql.append("WHERE  p.idPessoa = :idCliente ");
		sql.append("ORDER  BY v.dataVenda DESC;");

		Query query = manager.createNativeQuery(sql.toString());
		query.setParameter("idCliente", idCliente);
		
		List<Object[]> objects = query.getResultList();
		
		List<ProdutosCompradosPorCliente> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			ProdutosCompradosPorCliente produto = new ProdutosCompradosPorCliente();
			
			if (item[0] != null) {
				produto.setIdProduto(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				produto.setNomeProduto(item[1].toString());
			}
			
			if (item[2] != null) {
				produto.setMarcaProduto(item[2].toString());
			}
			
			if (item[3] != null) {
				produto.setModeloProduto(item[3].toString());
			}
			
			if (item[4] != null) {
				produto.setValorProduto(new BigDecimal(item[4].toString()));
			}
			
			if (item[5] != null) {
				produto.setDataVenda((Date) item[5]);
			}
			
			itens.add(produto);
		}
		
		return itens;
	}
}
