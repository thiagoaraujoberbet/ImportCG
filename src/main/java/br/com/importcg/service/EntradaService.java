package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.EntradaDAO;
import br.com.importcg.model.Entrada;
import br.com.importcg.util.Transacional;

public class EntradaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 762610350191657516L;

	@Inject
	private EntradaDAO entradaDAO;
	
	@Transacional
	public Entrada salvar(Entrada entrada) {
		return entradaDAO.salvar(entrada);
	}

	@Transacional
	public void excluir(Entrada entrada) {
		entradaDAO.excluir(entrada);
	}
	
	public List<Entrada> listarTodos() {
		return entradaDAO.listarTodos();
	}
	
	public Entrada porId(Long id) {
		return entradaDAO.porId(id);
	}

	public List<Entrada> buscarEntradasNaoLancadas() {
		return entradaDAO.buscarEntradasNaoLancadas();
	}
}
