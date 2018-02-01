package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Caixa;
import br.com.importcg.model.Retirada;
import br.com.importcg.service.CaixaService;
import br.com.importcg.service.RetiradaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class RetiradaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1885676199950420611L;

	private Retirada retirada = new Retirada();
	private Caixa caixaRetirada = new Caixa();
	
	private List<Caixa> caixasRetirada = new ArrayList<>();
	
	@Inject
	private RetiradaService retiradaService;
	
	@Inject
	private CaixaService caixaService;
	
	public void inicializar() {
		retirada.setData(new Date());
		
		if (caixasRetirada.isEmpty()) {
			caixasRetirada = caixaService.listarTodos();
		}
	}
	
	public String salvar() {
		if (caixaRetirada == null) {
			FacesUtil.addErrorMessage("É obrigatório selecionar uma conta!");
			return null;
		} else 
			this.efetivarRetirada();
		
		FacesUtil.addInfoMessage("Retirada realizada com sucesso!");
		
		return "listarRetirada.xhtml?faces-redirect=true";
	}
	
	private void efetivarRetirada() {
		this.atualizarCaixa();
		
		retirada.setCaixa(caixaRetirada);
		retiradaService.salvar(retirada);
	}
	
	private void atualizarCaixa() {
		caixaRetirada.setValor(caixaRetirada.getValor().subtract(retirada.getValor()));
		caixaService.salvar(caixaRetirada);
	}
	
	public Retirada getRetirada() {
		return retirada;
	}

	public void setRetirada(Retirada retirada) {
		this.retirada = retirada;
	}

	public Caixa getCaixaRetirada() {
		return caixaRetirada;
	}

	public void setCaixaRetirada(Caixa caixaRetirada) {
		this.caixaRetirada = caixaRetirada;
	}

	public List<Caixa> getCaixasRetirada() {
		return caixasRetirada;
	}

	public void setCaixasRetirada(List<Caixa> caixasRetirada) {
		this.caixasRetirada = caixasRetirada;
	}
}
