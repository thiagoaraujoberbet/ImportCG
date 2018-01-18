package br.com.importcg.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.enumeration.EnumCategoria;
import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Estoque;
import br.com.importcg.wrapper.EstoqueWrapper;

public class EstoqueDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1354084921615678289L;

	@Inject
	private EntityManager manager;
	
	public Estoque salvar(Estoque estoque) {
		return manager.merge(estoque);
	}
	
	public void excluir(Estoque estoque) {
		try {
			estoque = porId(estoque.getId());
			manager.remove(estoque);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O produto não pode ser excluído");
		}
	}

	public Estoque porId(Long id) {
		return manager.find(Estoque.class, id);
	}
	
	public List<Estoque> listarTodos() {
		return manager.createQuery("SELECT e FROM Estoque e ORDER BY e.produto.nome, e.produto.marca, e.produto.modelo ASC", Estoque.class).getResultList();
	}

	public Estoque verificarProdutoEmEstoque(Long idProduto) {
		try {
			Query query = manager.createQuery("SELECT e FROM Estoque e WHERE e.produto.id = :idProduto");
			query.setParameter("idProduto", idProduto);
			
			return (Estoque) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<EstoqueWrapper> buscarInformacoesEstoque() {
		StringBuilder sql = new StringBuilder();
		 
		sql.append("SELECT e.idEstoque, e.idProduto, e.quantidade, p.nome, p.marca, p.modelo, p.categoria, p.descricao, ");
		sql.append("	case when (select SUM(iv.quantidade) FROM itemVenda iv WHERE iv.idProduto = p.idProduto) is null then 0 else ");
		sql.append("		(select SUM(iv.quantidade) FROM itemVenda iv WHERE iv.idProduto = p.idProduto) end quantidadeTotalVenda ");
		sql.append("FROM estoque e ");
		sql.append("JOIN produto p ON e.idProduto = p.idProduto ");
		sql.append("ORDER BY e.quantidade DESC, p.nome, p.marca, p.modelo ");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<EstoqueWrapper> itens = new ArrayList<>();
	
		for (Object[] item : objects) {
			EstoqueWrapper estoque = new EstoqueWrapper();
			
			if (item[0] != null) {
				estoque.setIdEstoque(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				estoque.setIdProduto(Long.parseLong(item[1].toString()));
			}
			
			if (item[2] != null) {
				estoque.setQuantidade(new Integer(item[2].toString()));
			}
			
			if (item[3] != null) {
				estoque.setNomeProduto(item[3].toString());
			}
			
			if (item[4] != null) {
				estoque.setMarcaProduto(item[4].toString());
			}
			
			if (item[5] != null) {
				estoque.setModeloProduto(item[5].toString());
			}
			
			if (item[6] != null) {
				estoque.setCategoriaProduto(Enum.valueOf(EnumCategoria.class, item[6].toString()));
			}
			
			if (item[7] != null) {
				estoque.setDescricaoProduto(item[7].toString());
			}
			
			if (item[8] != null) {
				estoque.setQuantidadeTotalVenda(new Integer(item[8].toString()));
			}
			
			itens.add(estoque);
		}
		
		return itens;
	}
}
