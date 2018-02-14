package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.CatalogoInternacionalDAO;
import br.com.importcg.model.CatalogoInternacional;
import br.com.importcg.util.Transacional;

public class CatalogoInternacionalService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 775717310330860341L;

	@Inject
	private CatalogoInternacionalDAO catalogoInternacionalDAO;
	
	@Transacional
	public void salvar(CatalogoInternacional catalogoInternacional) {
		catalogoInternacionalDAO.salvar(catalogoInternacional);
	}

	@Transacional
	public void excluir(CatalogoInternacional catalogoInternacional) {
		catalogoInternacionalDAO.excluir(catalogoInternacional);
	}
	
	public List<CatalogoInternacional> listarTodos() {
		return catalogoInternacionalDAO.listarTodos();
	}
	
	public CatalogoInternacional porId(Long id) {
		return catalogoInternacionalDAO.porId(id);
	}

	public List<CatalogoInternacional> porIdProduto(Long idProduto) {
		return catalogoInternacionalDAO.porIdProduto(idProduto);		
	}

	public List<CatalogoInternacional> buscarValoresPagosPorIdProduto(Long idProduto) {
		return catalogoInternacionalDAO.buscarValoresPagosPorIdProduto(idProduto);
	}
}
