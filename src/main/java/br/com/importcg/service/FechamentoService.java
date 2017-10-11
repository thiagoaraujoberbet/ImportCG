package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.FechamentoDAO;
import br.com.importcg.model.Fechamento;
import br.com.importcg.util.Transacional;

public class FechamentoService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6160413036432489840L;

	@Inject
	private FechamentoDAO fechamentoDAO;
	
	@Transacional
	public Fechamento salvar(Fechamento fechamento) {
		return fechamentoDAO.salvar(fechamento);
	}

	@Transacional
	public void excluir(Fechamento fechamento) {
		fechamentoDAO.excluir(fechamento);
	}
	
	public List<Fechamento> listarTodos() {
		return fechamentoDAO.listarTodos();
	}
	
	public Fechamento porId(Long id) {
		return fechamentoDAO.porId(id);
	}

	public Fechamento buscarValoresFechamento(Fechamento fechamento) {
		return fechamentoDAO.buscarValoresFechamento(fechamento);
	}
}
