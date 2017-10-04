package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.DespesaDAO;
import br.com.importcg.model.Despesa;
import br.com.importcg.util.Transacional;

public class DespesaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5462336583694071745L;

	@Inject
	private DespesaDAO despesaDAO;
	
	@Transacional
	public Despesa salvar(Despesa despesa) {
		return despesaDAO.salvar(despesa);
	}

	@Transacional
	public void excluir(Despesa despesa) {
		despesaDAO.excluir(despesa);
	}
	
	public List<Despesa> listarTodos() {
		return despesaDAO.listarTodos();
	}
	
	public Despesa porId(Long id) {
		return despesaDAO.porId(id);
	}
}
