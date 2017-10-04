package br.com.importcg.dao;

import java.io.Serializable;
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
		else 
			return manager.createNativeQuery("SELECT * FROM pessoa WHERE tipo = :tipo ORDER BY nome ASC", Pessoa.class).setParameter("tipo", EnumTipoPessoa.CLIENTE.toString()).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Pessoa> buscarInformacoesFuncionario() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT p.idPessoa, p.nome, p.cargo, p.cpf, p.dataNascimento, p.celular, p.email, p.tipo, p.dataCriacao, p.dataAlteracao, ");
		sql.append("    (select SUM(iv.quantidade) from importcg.itemVenda iv JOIN importcg.venda v ON iv.idVenda = v.idVenda where v.idFuncionario = p.idPessoa) quantidadeVendida "); 
		sql.append("FROM importcg.pessoa p "); 
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
			
			itens.add(pessoa);
		}
		
		return itens;
	}
}
