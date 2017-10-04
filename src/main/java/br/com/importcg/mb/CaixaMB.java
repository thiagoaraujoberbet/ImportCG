package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Caixa;
import br.com.importcg.model.Conta;
import br.com.importcg.service.CaixaService;
import br.com.importcg.service.ContaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class CaixaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4830946570994767036L;

	private Caixa caixa = new Caixa();
	
	private List<Conta> contas = new ArrayList<>();
	
	@Inject
	private CaixaService caixaService;
	
	@Inject
	private ContaService contaService;
	
	public void inicializar() {
		if (contas.isEmpty()) {
			contas = contaService.listarTodos();
		}
	}

	public String salvar() {
		caixaService.salvar(caixa);
		
		FacesUtil.addInfoMessage("Caixa cadastrado com sucesso!");
		
		return "listarCaixa.xhtml?faces-redirect=true";
	}
	
	public Caixa getCaixa() {
		return caixa;
	}

	public void setCaixa(Caixa caixa) {
		this.caixa = caixa;
	}

	public List<Conta> getContas() {
		return contas;
	}

	public void setContas(List<Conta> contas) {
		this.contas = contas;
	}
}
