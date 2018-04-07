package br.com.importcg.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.ItemEntrada;
import br.com.importcg.model.Produto;

public class ItemEntradaDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1382751101406381319L;

	@Inject
	private EntityManager manager;

	public ItemEntrada salvar(ItemEntrada itemEntrada) {
		return manager.merge(itemEntrada);
	}

	public List<ItemEntrada> porIdEntrada(Long idEntrada) {
		return manager.createQuery("SELECT i FROM ItemEntrada i WHERE i.entrada.id = :idEntrada", ItemEntrada.class).setParameter("idEntrada", idEntrada).getResultList();
	}

	public ItemEntrada porId(Long id) {
		return manager.find(ItemEntrada.class, id);
	}

	public void excluir(ItemEntrada itemEntrada) {
		try {
			itemEntrada = porId(itemEntrada.getId());
			manager.remove(itemEntrada);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O item de entrada não pode ser excluído");
		}
	}

	@SuppressWarnings("unchecked")
	public List<ItemEntrada> buscarItensParaVenda() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT x.idItemEntrada, x.valorEmReal, x.idProduto, x.nome, x.marca, x.modelo, x.estoque FROM ( ");
		sql.append("	SELECT DISTINCT i.idItemEntrada, i.valorEmReal, p.idProduto, p.nome, p.marca, p.modelo, ");
		sql.append("		(select IFNULL(sum(ie.quantidade), 0) from itemEntrada ie where ie.idItemEntrada = i.idItemEntrada) - ");
		sql.append("		(select IFNULL(sum(iv.quantidade), 0) from itemVenda iv where iv.idItemEntrada = i.idItemEntrada) AS estoque ");
		sql.append("	FROM itemEntrada i ");
		sql.append("	INNER JOIN produto p ON i.idProduto = p.idProduto ");
		sql.append(") x ");
		sql.append("WHERE x.estoque > 0 ");
		sql.append("ORDER BY x.nome, x.marca, x.modelo ");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<ItemEntrada> itensEntrada = new ArrayList<>();
		
		for (Object[] item : objects) {
			ItemEntrada itemEntrada = new ItemEntrada();
			
			if (item[0] != null) {
				itemEntrada.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				itemEntrada.setValorEmReal(new BigDecimal(item[1].toString()));
			}
			
			Produto produto = new Produto();
			
			if (item[2] != null) {
				produto.setId(Long.parseLong(item[2].toString()));
			}
			
			if (item[3] != null) {
				produto.setNome(item[3].toString());
			}
			
			if (item[4] != null) {
				produto.setMarca(item[4].toString());
			}
			
			if (item[5] != null) {
				produto.setModelo(item[5].toString());
			}
			
			itemEntrada.setProduto(produto);
			
			if (item[6] != null) {
				itemEntrada.setQuantidadeEstoque(new Integer(item[6].toString()));
			}
			
			itensEntrada.add(itemEntrada);
		}
		
		return itensEntrada;
	}

	public BigDecimal buscarQtdeItensDisponiveisParaVendaPorIdProduto(Long idProduto) {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT CASE WHEN SUM(ie.quantidade) is null THEN 0 ELSE SUM(ie.quantidade) END ");
		sql.append("FROM   itemEntrada ie ");
		sql.append("WHERE  ie.idProduto = :idProduto ");
		sql.append("       AND NOT EXISTS (SELECT * ");
		sql.append("                       FROM   itemVenda iv ");
		sql.append("                       WHERE  iv.idItemEntrada = ie.idItemEntrada ");
		sql.append("                              AND iv.idProduto = ie.idProduto)");
		
		Query query = manager.createNativeQuery(sql.toString());
		query.setParameter("idProduto", idProduto);
		
		return (BigDecimal) query.getSingleResult();
	}

	public BigDecimal buscarItensParaVendaPorIdProduto(Long idProduto) {
		StringBuilder sql = new StringBuilder();
		
		sql.append("	SELECT ");
		sql.append("		SUM((select IFNULL(sum(ie.quantidade), 0) from itemEntrada ie where ie.idItemEntrada = i.idItemEntrada) - ");
		sql.append("		(select IFNULL(sum(iv.quantidade), 0) from itemVenda iv where iv.idItemEntrada = i.idItemEntrada)) AS estoque ");
		sql.append("	FROM itemEntrada i ");
		sql.append("	WHERE i.idProduto = :idProduto ");
		
		Query query = manager.createNativeQuery(sql.toString());
		query.setParameter("idProduto", idProduto);
		
		return (BigDecimal) query.getSingleResult();
	}
}
