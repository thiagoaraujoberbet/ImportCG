package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Baixa;
import br.com.importcg.service.BaixaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaBaixaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1579648736289579874L;

	@Inject
	private BaixaService baixaService;
	
	private List<Baixa> baixas = new ArrayList<>();
	
	private List<Baixa> baixasSelecionadas = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		baixas = baixaService.listarTodos();
	}
	
	public void excluirSelecionadas() {
		for (Baixa baixa : baixasSelecionadas) {
			baixaService.excluir(baixa);
			baixas.remove(baixa);
		}
		
		FacesUtil.addInfoMessage("Baixa(s) excluida(s) com sucesso!");
	}

	public List<Baixa> getBaixas() {
		return baixas;
	}

	public void setBaixas(List<Baixa> baixas) {
		this.baixas = baixas;
	}

	public List<Baixa> getBaixasSelecionadas() {
		return baixasSelecionadas;
	}

	public void setBaixasSelecionadas(List<Baixa> baixasSelecionadas) {
		this.baixasSelecionadas = baixasSelecionadas;
	}
}
