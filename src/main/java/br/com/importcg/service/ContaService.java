package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.ContaDAO;
import br.com.importcg.model.Conta;
import br.com.importcg.util.Transacional;

public class ContaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3494532770329402577L;

	@Inject
	private ContaDAO contaDAO;
	
	@Transacional
	public void salvar(Conta conta) {
		contaDAO.salvar(conta);
	}

	@Transacional
	public void excluir(Conta conta) {
		contaDAO.excluir(conta);
	}
	
	public List<Conta> listarTodos() {
		return contaDAO.listarTodos();
	}
	
	public Conta porId(Long id) {
		return contaDAO.porId(id);
	}
}
