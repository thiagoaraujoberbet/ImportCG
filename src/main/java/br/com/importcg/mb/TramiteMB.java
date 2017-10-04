package br.com.importcg.mb;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.enumeration.EnumOperacao;
import br.com.importcg.model.Caixa;
import br.com.importcg.model.Tramite;
import br.com.importcg.service.CaixaService;
import br.com.importcg.service.TramiteService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class TramiteMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4045854284852849976L;

	private Tramite tramite = new Tramite();
	private Caixa caixaOrigem = new Caixa();
	private Caixa caixaDestino = new Caixa();
	
	private List<Caixa> caixasOrigem = new ArrayList<>();
	private List<Caixa> caixasDestino = new ArrayList<>();
	
	@Inject
	private TramiteService tramiteService;
	
	@Inject
	private CaixaService caixaService;
	
	public void inicializar() {
		tramite.setOperacao(EnumOperacao.CREDITO);
		tramite.setData(new Date());
		
		if (caixasOrigem.isEmpty()) {
			caixasOrigem = caixaService.listarTodos();
		}
		
		if (caixasDestino.isEmpty()) {
			caixasDestino = caixaService.listarTodos();
		}
	}

	public String salvar() {
		if (caixaOrigem == null && caixaDestino == null) {
			FacesUtil.addErrorMessage("É obrigatório selecionar ao menos uma conta!");
			return null;
		} else if (caixaOrigem == null) {
			this.tramitarEntradaExterna();
		} else if (caixaDestino == null) {
			this.tramitarSaidaExterna();
		} else {
			this.tramitarInterno();
		}
		
		FacesUtil.addInfoMessage("Trâmite realizado com sucesso!");
		
		return "listarTramite.xhtml?faces-redirect=true";
	}
	
	private void tramitarInterno() {
		this.atualizarCaixasMovimentacaoInterna();
		this.tramitarMovimentacaoInterna();
	}
	
	private void tramitarEntradaExterna() {
		this.atualizarCaixasMovimentacaoEntradaExterna();
		this.tramitarMovimentacaoEntradaExterna();
	}
	
	private void tramitarSaidaExterna() {
		this.atualizarCaixasMovimentacaoSaidaExterna();
		this.tramitarMovimentacaoSaidaExterna();
	}

	private void tramitarMovimentacaoInterna() {
		Tramite tramiteCredito = new Tramite();
		tramiteCredito = tramite;
		tramiteCredito.setCaixa(caixaDestino);
		tramiteCredito.setOperacao(EnumOperacao.CREDITO);
		tramiteService.salvar(tramiteCredito);
		
		Tramite tramiteDebito = new Tramite();
		tramiteDebito = tramite;
		tramiteCredito.setCaixa(caixaOrigem);
		tramiteCredito.setOperacao(EnumOperacao.DEBITO);
		tramiteService.salvar(tramiteDebito);
	}
	
	private void tramitarMovimentacaoEntradaExterna() {
		Tramite tramiteCredito = new Tramite();
		tramiteCredito = tramite;
		tramiteCredito.setCaixa(caixaDestino);
		tramiteCredito.setOperacao(EnumOperacao.CREDITO);
		tramiteService.salvar(tramiteCredito);
	}
	
	private void tramitarMovimentacaoSaidaExterna() {
		Tramite tramiteCredito = new Tramite();
		tramiteCredito = tramite;
		tramiteCredito.setCaixa(caixaOrigem);
		tramiteCredito.setOperacao(EnumOperacao.DEBITO);
		tramiteService.salvar(tramiteCredito);
	}

	private void atualizarCaixasMovimentacaoInterna() {
		caixaDestino.setValor(caixaDestino.getValor().add(tramite.getValor()));
		caixaOrigem.setValor(caixaOrigem.getValor().subtract(tramite.getValor()));
		
		caixaService.salvar(caixaOrigem);
		caixaService.salvar(caixaDestino);
	}
	
	private void atualizarCaixasMovimentacaoEntradaExterna() {
		caixaDestino.setValor(caixaDestino.getValor().add(tramite.getValor()));
		caixaService.salvar(caixaDestino);
	}
	
	private void atualizarCaixasMovimentacaoSaidaExterna() {
		caixaOrigem.setValor(caixaOrigem.getValor().subtract(tramite.getValor()));
		caixaService.salvar(caixaOrigem);
	}
	
	public void autoCompletarValor() {
		if (caixaOrigem == null)
			tramite.setValor(new BigDecimal(0));
		else
			tramite.setValor(caixaOrigem.getValor());
	}

	public Tramite getTramite() {
		return tramite;
	}

	public void setTramite(Tramite tramite) {
		this.tramite = tramite;
	}

	public Caixa getCaixaOrigem() {
		return caixaOrigem;
	}

	public void setCaixaOrigem(Caixa caixaOrigem) {
		this.caixaOrigem = caixaOrigem;
	}

	public Caixa getCaixaDestino() {
		return caixaDestino;
	}

	public void setCaixaDestino(Caixa caixaDestino) {
		this.caixaDestino = caixaDestino;
	}

	public List<Caixa> getCaixasOrigem() {
		return caixasOrigem;
	}

	public void setCaixasOrigem(List<Caixa> caixasOrigem) {
		this.caixasOrigem = caixasOrigem;
	}

	public List<Caixa> getCaixasDestino() {
		return caixasDestino;
	}

	public void setCaixasDestino(List<Caixa> caixasDestino) {
		this.caixasDestino = caixasDestino;
	}
	
	
}
