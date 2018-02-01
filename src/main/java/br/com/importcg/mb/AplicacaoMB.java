package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Aplicacao;
import br.com.importcg.model.Caixa;
import br.com.importcg.service.AplicacaoService;
import br.com.importcg.service.CaixaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class AplicacaoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2508833359423159451L;

	private Aplicacao aplicacao = new Aplicacao();
	private Caixa caixaAplicacao = new Caixa();
	
	private List<Caixa> caixasAplicacao = new ArrayList<>();
	
	@Inject
	private AplicacaoService aplicacaoService;
	
	@Inject
	private CaixaService caixaService;
	
	public void inicializar() {
		aplicacao.setData(new Date());
		
		if (caixasAplicacao.isEmpty()) {
			caixasAplicacao = caixaService.listarTodos();
		}
	}
	
	public String salvar() {
		if (caixaAplicacao == null) {
			FacesUtil.addErrorMessage("É obrigatório selecionar uma conta!");
			return null;
		} else 
			this.efetivarAplicacao();
		
		FacesUtil.addInfoMessage("Aplicação realizada com sucesso!");
		
		return "listarAplicacao.xhtml?faces-redirect=true";
	}
	
	private void efetivarAplicacao() {
		this.atualizarCaixa();
		
		aplicacao.setCaixa(caixaAplicacao);
		aplicacaoService.salvar(aplicacao);
	}
	
	private void atualizarCaixa() {
		caixaAplicacao.setValor(caixaAplicacao.getValor().add(aplicacao.getValor()));
		caixaService.salvar(caixaAplicacao);
	}
	
	public Aplicacao getAplicacao() {
		return aplicacao;
	}

	public void setAplicacao(Aplicacao aplicacao) {
		this.aplicacao = aplicacao;
	}

	public Caixa getCaixaAplicacao() {
		return caixaAplicacao;
	}

	public void setCaixaAplicacao(Caixa caixaAplicacao) {
		this.caixaAplicacao = caixaAplicacao;
	}

	public List<Caixa> getCaixasAplicacao() {
		return caixasAplicacao;
	}

	public void setCaixasAplicacao(List<Caixa> caixasAplicacao) {
		this.caixasAplicacao = caixasAplicacao;
	}
}
