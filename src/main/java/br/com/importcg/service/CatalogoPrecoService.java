package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.CatalogoPrecoDAO;
import br.com.importcg.model.CatalogoPreco;
import br.com.importcg.util.Transacional;

public class CatalogoPrecoService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3123342956175069257L;

	@Inject
	private CatalogoPrecoDAO catalogoPrecoDAO;
	
	@Transacional
	public void salvar(CatalogoPreco catalogoPreco) {
		catalogoPrecoDAO.salvar(catalogoPreco);
	}

	@Transacional
	public void excluir(CatalogoPreco catalogoPreco) {
		catalogoPrecoDAO.excluir(catalogoPreco);
	}
	
	public List<CatalogoPreco> listarTodos() {
		return catalogoPrecoDAO.listarTodos();
	}
	
	public CatalogoPreco porId(Long id) {
		return catalogoPrecoDAO.porId(id);
	}
}
