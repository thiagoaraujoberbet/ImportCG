package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.OrcamentoDAO;
import br.com.importcg.model.Orcamento;
import br.com.importcg.util.Transacional;

public class OrcamentoService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8635775100354845873L;

	@Inject
	private OrcamentoDAO orcamentoDAO;
	
	@Transacional
	public Orcamento salvar(Orcamento orcamento) {
		return orcamentoDAO.salvar(orcamento);
	}

	@Transacional
	public void excluir(Orcamento orcamento) {
		orcamentoDAO.excluir(orcamento);
	}
	
	public List<Orcamento> listarTodos() {
		return orcamentoDAO.listarTodos();
	}
	
	public Orcamento porId(Long id) {
		return orcamentoDAO.porId(id);
	}
}
