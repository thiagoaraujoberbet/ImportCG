package br.com.importcg.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

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
}
