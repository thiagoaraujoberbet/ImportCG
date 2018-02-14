package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Orcamento;
import br.com.importcg.service.OrcamentoService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaOrcamentoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1110389189754661412L;

	@Inject
	private OrcamentoService orcamentoService;
	
	private List<Orcamento> orcamentos = new ArrayList<>();
	
	private List<Orcamento> orcamentosSelecionados = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		orcamentos = orcamentoService.listarTodos();
	}
	
	public void excluirSelecionados() {
		for (Orcamento orcamento : orcamentosSelecionados) {
			orcamentoService.excluir(orcamento);
			orcamentos.remove(orcamento);
		}
		
		FacesUtil.addInfoMessage("Orçamento(s) excluida(s) com sucesso!");
	}
	
	public List<Orcamento> getOrcamentos() {
		return orcamentos;
	}

	public void setOrcamentos(List<Orcamento> orcamentos) {
		this.orcamentos = orcamentos;
	}

	public List<Orcamento> getOrcamentosSelecionados() {
		return orcamentosSelecionados;
	}

	public void setOrcamentosSelecionados(List<Orcamento> orcamentosSelecionados) {
		this.orcamentosSelecionados = orcamentosSelecionados;
	}
}
