package br.com.importcg.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.FornecedorDAO;
import br.com.importcg.model.Fornecedor;
import br.com.importcg.util.Transacional;

public class FornecedorService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7602261019156142344L;

	@Inject
	private FornecedorDAO fornecedorDAO;
	
	@Transacional
	public void salvar(Fornecedor fornecedor) {
		if (fornecedor.isInclusao())
			fornecedor.setDataCriacao(new Date());
		else 
			fornecedor.setDataAlteracao(new Date());
		
		fornecedorDAO.salvar(fornecedor);
	}

	@Transacional
	public void excluir(Fornecedor fornecedor) {
		fornecedorDAO.excluir(fornecedor);
	}
	
	public List<Fornecedor> listarTodos() {
		return fornecedorDAO.listarTodos();
	}
	
	public Fornecedor porId(Long id) {
		return fornecedorDAO.porId(id);
	}
}
