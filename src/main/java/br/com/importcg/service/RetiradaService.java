package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.RetiradaDAO;
import br.com.importcg.model.Retirada;
import br.com.importcg.util.Transacional;

public class RetiradaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7954897844091277736L;

	@Inject
	private RetiradaDAO retiradaDAO;
	
	@Transacional
	public void salvar(Retirada retirada) {
		retiradaDAO.salvar(retirada);
	}

	@Transacional
	public void excluir(Retirada retirada) {
		retiradaDAO.excluir(retirada);
	}
	
	public List<Retirada> listarTodos() {
		return retiradaDAO.listarTodos();
	}
	
	public Retirada porId(Long id) {
		return retiradaDAO.porId(id);
	}
}
