package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.AplicacaoDAO;
import br.com.importcg.model.Aplicacao;
import br.com.importcg.util.Transacional;

public class AplicacaoService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4660403470416896946L;

	@Inject
	private AplicacaoDAO aplicacaoDAO;
	
	@Transacional
	public void salvar(Aplicacao aplicacao) {
		aplicacaoDAO.salvar(aplicacao);
	}

	@Transacional
	public void excluir(Aplicacao aplicacao) {
		aplicacaoDAO.excluir(aplicacao);
	}
	
	public List<Aplicacao> listarTodos() {
		return aplicacaoDAO.listarTodos();
	}
	
	public Aplicacao porId(Long id) {
		return aplicacaoDAO.porId(id);
	}
}
