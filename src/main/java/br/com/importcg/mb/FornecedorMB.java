package br.com.importcg.mb;

import java.io.Serializable;
import java.util.Date;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.enumeration.EnumTipoMsgTimeline;
import br.com.importcg.enumeration.EnumTipoTimeline;
import br.com.importcg.model.Fornecedor;
import br.com.importcg.model.Timeline;
import br.com.importcg.service.FornecedorService;
import br.com.importcg.service.TimelineService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class FornecedorMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8156425169158709868L;

	private Fornecedor fornecedor = new Fornecedor();
	
	private Long idFornecedor;
	
	@Inject
	private FornecedorService fornecedorService;
	
	@Inject
	private TimelineService timelineService;
	
	public void inicializar() {
		if (idFornecedor != null) 
			fornecedor = fornecedorService.porId(idFornecedor);
		else
			fornecedor.setDataCriacao(new Date());
	}

	public String salvar() {
		fornecedorService.salvar(fornecedor);
		
		if (fornecedor.isEdicao()) {
			FacesUtil.addInfoMessage("Fornecedor editado com sucesso!");
		} else {
			this.gerarTimeline();
			FacesUtil.addInfoMessage("Fornecedor cadastrado com sucesso!");
		}
		
		return "listarFornecedor.xhtml?faces-redirect=true";
	}
	
	private void gerarTimeline() {
		timelineService.salvar(new Timeline(EnumTipoTimeline.CADASTROFORNECEDOR, EnumTipoMsgTimeline.SIMPLES,"fa fa-truck bg-aqua", "Novo Fornecedor!", 
				fornecedor.getNome() + " é nosso(a) mais novo(a) fornecedor.", new Date()));
	}
	
	public String excluir() {
		fornecedorService.excluir(fornecedor);
		
		return "listarFornecedor.xhtml?faces-redirect=true";
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public Long getIdFornecedor() {
		return idFornecedor;
	}

	public void setIdFornecedor(Long idFornecedor) {
		this.idFornecedor = idFornecedor;
	}
}
