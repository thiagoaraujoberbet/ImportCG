package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Aplicacao;
import br.com.importcg.service.AplicacaoService;

@Named
@ViewScoped
public class ListaAplicacaoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3633825699120165378L;

	@Inject
	private AplicacaoService aplicacaoService;
	
	private List<Aplicacao> aplicacoes = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		aplicacoes = aplicacaoService.listarTodos();
	}
	
	public List<Aplicacao> getAplicacoes() {
		return aplicacoes;
	}

	public void setAplicacoes(List<Aplicacao> aplicacoes) {
		this.aplicacoes = aplicacoes;
	}
}
