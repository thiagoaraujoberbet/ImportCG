package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.VendaDAO;
import br.com.importcg.model.Venda;
import br.com.importcg.util.Transacional;

public class VendaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 70849271243239728L;

	@Inject
	private VendaDAO vendaDAO;
	
	@Transacional
	public Venda salvar(Venda venda) {
		return vendaDAO.salvar(venda);
	}

	@Transacional
	public void excluir(Venda venda) {
		vendaDAO.excluir(venda);
	}
	
	public List<Venda> listarTodos() {
		return vendaDAO.listarTodos();
	}
	
	public Venda porId(Long id) {
		return vendaDAO.porId(id);
	}
}
