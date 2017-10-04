package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.BaixaDAO;
import br.com.importcg.model.Baixa;
import br.com.importcg.util.Transacional;

public class BaixaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3155947260750286329L;

	@Inject
	private BaixaDAO baixaDAO;
	
	@Transacional
	public Baixa salvar(Baixa baixa) {
		return baixaDAO.salvar(baixa);
	}

	@Transacional
	public void excluir(Baixa baixa) {
		baixaDAO.excluir(baixa);
	}
	
	public List<Baixa> listarTodos() {
		return baixaDAO.listarTodos();
	}
	
	public Baixa porId(Long id) {
		return baixaDAO.porId(id);
	}
}
