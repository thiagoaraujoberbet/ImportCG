package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Fechamento;
import br.com.importcg.service.FechamentoService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaFechamentoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5389201024378219832L;

	private List<Fechamento> fechamentos = new ArrayList<>();
	
	private List<Fechamento> fechamentosSelecionados = new ArrayList<>();
	
	@Inject
	private FechamentoService fechamentoService;
	
	@PostConstruct
	public void inicializar() {
		fechamentos = fechamentoService.listarTodos();
	}
	
	public void excluirSelecionados() {
		for (Fechamento fechamento : fechamentosSelecionados) {
			fechamentoService.excluir(fechamento);
			fechamentos.remove(fechamento);
		}
		
		FacesUtil.addInfoMessage("Fechamento(s) excluido(s) com sucesso!");
	}

	public List<Fechamento> getFechamentos() {
		return fechamentos;
	}

	public void setFechamentos(List<Fechamento> fechamentos) {
		this.fechamentos = fechamentos;
	}

	public List<Fechamento> getFechamentosSelecionados() {
		return fechamentosSelecionados;
	}

	public void setFechamentosSelecionados(List<Fechamento> fechamentosSelecionados) {
		this.fechamentosSelecionados = fechamentosSelecionados;
	}
}
