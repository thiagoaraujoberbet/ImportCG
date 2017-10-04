package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Despesa;
import br.com.importcg.service.DespesaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaDespesaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5420914882579232272L;

	@Inject
	private DespesaService despesaService;
	
	private List<Despesa> despesas = new ArrayList<>();
	
	private List<Despesa> despesasSelecionadas = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		despesas = despesaService.listarTodos();
	}
	
	public void excluirSelecionadas() {
		for (Despesa despesa : despesasSelecionadas) {
			despesaService.excluir(despesa);
			despesas.remove(despesa);
		}
		
		FacesUtil.addInfoMessage("Despesa(s) excluida(s) com sucesso!");
	}

	public List<Despesa> getDespesas() {
		return despesas;
	}

	public void setDespesas(List<Despesa> despesas) {
		this.despesas = despesas;
	}

	public List<Despesa> getDespesasSelecionadas() {
		return despesasSelecionadas;
	}

	public void setDespesasSelecionadas(List<Despesa> despesasSelecionadas) {
		this.despesasSelecionadas = despesasSelecionadas;
	}
}
