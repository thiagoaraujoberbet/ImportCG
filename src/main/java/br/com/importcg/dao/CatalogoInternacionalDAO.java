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
import br.com.importcg.model.CatalogoInternacional;
import br.com.importcg.model.Produto;

public class CatalogoInternacionalDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6053967808303400667L;

	@Inject
	private EntityManager manager;
	
	public CatalogoInternacional salvar(CatalogoInternacional catalogoInternacional) {
		return manager.merge(catalogoInternacional);
	}
	
	public void excluir(CatalogoInternacional catalogoInternacional) {
		try {
			catalogoInternacional = porId(catalogoInternacional.getId());
			manager.remove(catalogoInternacional);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O catalogo internacional não pode ser excluído");
		}
	}

	public CatalogoInternacional porId(Long id) {
		return manager.find(CatalogoInternacional.class, id);
	}
	
	public List<CatalogoInternacional> listarTodos() {
		return manager.createQuery("SELECT c FROM CatalogoInternacional c ORDER BY c.nome ASC", CatalogoInternacional.class).getResultList();
	}

	public List<CatalogoInternacional> porIdProduto(Long idProduto) {
		return manager.createQuery("SELECT c FROM CatalogoInternacional c WHERE c.produto.id = :idProduto ORDER BY c.data DESC", CatalogoInternacional.class).setParameter("idProduto", idProduto).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<CatalogoInternacional> buscarValoresPagosPorIdProduto(Long idProduto) {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT c.idCatalogoInternacional, ");
		sql.append("       c.idProduto, ");
		sql.append("       f.nome, ");
		sql.append("       c.data, ");
		sql.append("       c.cotacao, ");
		sql.append("       c.valorEmDolar, ");
		sql.append("       c.valorEmReal ");
		sql.append("FROM   catalogoInternacional c ");
		sql.append("       JOIN fornecedor f ");
		sql.append("         ON c.idFornecedor = f.idFornecedor ");
		sql.append("WHERE  c.idProduto = :idProduto ");
		sql.append("ORDER  BY c.data DESC;");
		
		Query query = manager.createNativeQuery(sql.toString());
		query.setParameter("idProduto", idProduto);
		
		List<Object[]> objects = query.getResultList();
		
		List<CatalogoInternacional> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			CatalogoInternacional vbo = new CatalogoInternacional();
			
			if (item[0] != null) {
				vbo.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				Produto produto = new Produto();
				produto.setId(Long.parseLong(item[1].toString()));
			}
			
			if (item[2] != null) {
				vbo.setNomeFornecedor(item[2].toString());
			}
			
			if (item[3] != null) {
				vbo.setData((Date) item[3]);
			}
			
			if (item[4] != null) {
				vbo.setCotacao(new BigDecimal(item[4].toString()));
			}
			
			if (item[5] != null) {
				vbo.setValorEmDolar(new BigDecimal(item[5].toString()));
			}
			
			if (item[6] != null) {
				vbo.setValorEmReal(new BigDecimal(item[6].toString()));
			}
			
			itens.add(vbo);
		}
		
		return itens;
	}
}
