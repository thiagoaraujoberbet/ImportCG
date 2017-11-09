package br.com.importcg.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.importcg.enumeration.EnumCategoria;
import br.com.importcg.exception.NegocioException;
import br.com.importcg.model.Produto;

public class ProdutoDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1622321073848847671L;

	@Inject
	private EntityManager manager;
	
	public Produto salvar(Produto produto) {
		return manager.merge(produto);
	}
	
	public void excluir(Produto produto) {
		try {
			produto = porId(produto.getId());
			manager.remove(produto);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O produto não pode ser excluído");
		}
	}

	public Produto porId(Long id) {
		return manager.find(Produto.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Produto> listarTodos() {
		StringBuilder sql = new StringBuilder();
		
		sql.append("	SELECT p.id, p.nome, p.descricao, p.categoria, p.marca, p.modelo, p.dataCriacao, p.dataAlteracao, ");
		sql.append("    CASE WHEN (SELECT COUNT(iv) from ItemVenda iv where iv.produto.id = p.id) > 0 THEN 'true' ELSE 'false' END AS vendido ");
		sql.append("	FROM Produto p ");
		sql.append("	ORDER BY p.nome ");
		
		Query query = manager.createQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<Produto> produtos = new ArrayList<>();
		
		for (Object[] item : objects) {
			Produto produto = new Produto();
			
			if (item[0] != null) {
				produto.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				produto.setNome(item[1].toString());
			}
			
			if (item[2] != null) {
				produto.setDescricao(item[2].toString());
			}
			
			if (item[3] != null) {
				produto.setCategoria(Enum.valueOf(EnumCategoria.class, item[3].toString()));
			}
			
			if (item[4] != null) {
				produto.setMarca(item[4].toString());
			}
			
			if (item[5] != null) {
				produto.setModelo(item[5].toString());
			}
			
			if (item[6] != null) {
				produto.setDataCriacao((Date) item[6]);
			}
			
			if (item[7] != null) {
				produto.setDataAlteracao((Date) item[7]);
			}
			
			if (item[8] != null) {
				produto.setVendido(new Boolean(item[8].toString()));
			}
			
			produtos.add(produto);
		}
		
		return produtos;
	}
}
