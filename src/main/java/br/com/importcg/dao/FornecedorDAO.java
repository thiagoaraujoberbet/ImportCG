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
import br.com.importcg.model.Fornecedor;

public class FornecedorDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7103076812831695151L;

	@Inject
	private EntityManager manager;
	
	public Fornecedor salvar(Fornecedor fornecedor) {
		return manager.merge(fornecedor);
	}
	
	public void excluir(Fornecedor fornecedor) {
		try {
			fornecedor = porId(fornecedor.getId());
			manager.remove(fornecedor);
			manager.flush();
		} catch (Exception e) {
			throw new NegocioException("O fornecedor não pode ser excluído");
		}
	}

	public Fornecedor porId(Long id) {
		return manager.find(Fornecedor.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Fornecedor> listarTodos() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT f.idFornecedor, f.nome, f.endereco, f.telefone, f.email, f.site, f.instagram, f.dataCriacao, f.dataAlteracao, ");
		sql.append("	case when (SELECT SUM(ie.quantidade) FROM importcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) is null then 0 else ");
		sql.append("		(SELECT SUM(ie.quantidade) FROM importcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) end quantidadeVendida, ");
		sql.append("	case when (SELECT SUM(ie.valorEmReal) FROM importcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) is null then 0 else ");
		sql.append("		(SELECT SUM(ie.valorEmReal) FROM importcg.itemEntrada ie where ie.idFornecedor = f.idFornecedor) end valorVendido ");
		sql.append("FROM importcg.fornecedor f ");
		sql.append("ORDER BY f.nome ASC ");
		
		Query query = manager.createNativeQuery(sql.toString());
		
		List<Object[]> objects = query.getResultList();
		
		List<Fornecedor> itens = new ArrayList<>();
		
		for (Object[] item : objects) {
			Fornecedor fornecedor = new Fornecedor();
			
			if (item[0] != null) {
				fornecedor.setId(Long.parseLong(item[0].toString()));
			}
			
			if (item[1] != null) {
				fornecedor.setNome(item[1].toString());
			}
			
			if (item[2] != null) {
				fornecedor.setEndereco(item[2].toString());
			}
			
			if (item[3] != null) {
				fornecedor.setTelefone(item[3].toString());
			}
			
			if (item[4] != null) {
				fornecedor.setEmail(item[4].toString());
			}
			
			if (item[5] != null) {
				fornecedor.setSite(item[5].toString());
			}
			
			if (item[6] != null) {
				fornecedor.setInstagram(item[6].toString());
			}
			
			if (item[7] != null) {
				fornecedor.setDataCriacao((Date) item[7]);
			}	
			
			if (item[8] != null) {
				fornecedor.setDataAlteracao((Date) item[8]);
			}
			
			if (item[9] != null) {
				fornecedor.setQuantidadeVendida(new Integer(item[9].toString()));
			}
			
			if (item[10] != null) {
				fornecedor.setValorVendido(new BigDecimal(item[10].toString()));
			}
			
			itens.add(fornecedor);
		}
		
		return itens;
	}
}
