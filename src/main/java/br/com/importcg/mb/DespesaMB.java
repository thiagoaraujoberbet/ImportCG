package br.com.importcg.mb;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Despesa;
import br.com.importcg.model.Entrada;
import br.com.importcg.model.ItemDespesa;
import br.com.importcg.service.DespesaService;
import br.com.importcg.service.EntradaService;
import br.com.importcg.service.ItemDespesaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class DespesaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8536988328007674484L;

	private Despesa despesa = new Despesa();
	private ItemDespesa itemDespesa = new ItemDespesa();
	
	private Long idDespesa;
	
	private List<Entrada> entradas = new ArrayList<>();
	private List<ItemDespesa> itensDespesa = new ArrayList<>();
	private List<ItemDespesa> itensDespesaSelecionados = new ArrayList<>();
	
	private boolean edicaoItem = false;
	
	private BigDecimal valorAtual = BigDecimal.ZERO;
	
	@Inject
	private DespesaService despesaService;
	
	@Inject
	private ItemDespesaService itemDespesaService;
	
	@Inject
	private EntradaService entradaService;
	
	public void inicializar() {
		if (idDespesa != null) {
			despesa = despesaService.porId(idDespesa);
			itemDespesa.setDespesa(despesa);
			itensDespesa = itemDespesaService.porIdDespesa(idDespesa);
		} else {
			despesa.setDataDespesa(new Date());
//			despesa.setStatus(EnumStatusBaixa.NAOBAIXADO);
			despesa.setValorTotal(BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN));
		}
		
		if (entradas.isEmpty()) {
			entradas = entradaService.buscarEntradasNaoLancadas();
		}
	}

	public String salvar(boolean msg) {
		despesa = despesaService.salvar(despesa);
		
		this.inicializarItemDespesa();
		
		if (msg)
			FacesUtil.addInfoMessage("Despesa cadastrada com sucesso!");
		
		return "";
	}

	public String salvarItem() {
		itemDespesa = itemDespesaService.salvar(itemDespesa);
		
		if (isEdicaoItem()) {
			if  (!itemDespesa.getValor().equals(valorAtual)) {
				if (itemDespesa.getValor().compareTo(valorAtual) == 1) {
					this.atualizarDespesaPositiva(itemDespesa.getValor().subtract(valorAtual));
				} else {
					this.atualizarDespesaNegativa(valorAtual.subtract(itemDespesa.getValor()));
				}
			}
			
			setEdicaoItem(false);
		} else {
			this.atualizarDespesaPositiva(itemDespesa.getValor());
		}
		
		FacesUtil.addInfoMessage("Item cadastrado com sucesso!");
		
		return "";
	}
	
	private void atualizarDespesaPositiva(BigDecimal valor) {
		despesa.setValorTotal(despesa.getValorTotal().add(valor));
		this.salvar(false);
	}
	
	private void atualizarDespesaNegativa(BigDecimal valor) {
		despesa.setValorTotal(despesa.getValorTotal().subtract(valor));
		this.salvar(false);
	}
	
	private void inicializarItemDespesa() {
		itemDespesa = new ItemDespesa();
		itemDespesa.setDespesa(despesa);
	}
	
	public String excluir() {
		despesaService.excluir(despesa);
			
		return "listarDespesa.xhtml?faces-redirect=true";
	}
	
	public void excluirItensDespesaSelecionados() {
		for (ItemDespesa itemDespesa : itensDespesaSelecionados) {
			this.atualizarDespesaNegativa(itemDespesa.getValor());
			itemDespesaService.excluir(itemDespesa);
			itensDespesa.remove(itemDespesa);
		}
				
		FacesUtil.addInfoMessage("Item(s) excluido(s) com sucesso!");
	}

	public Despesa getDespesa() {
		return despesa;
	}

	public void setDespesa(Despesa despesa) {
		this.despesa = despesa;
	}

	public ItemDespesa getItemDespesa() {
		return itemDespesa;
	}

	public void setItemDespesa(ItemDespesa itemDespesa) {
		this.itemDespesa = itemDespesa;
	}

	public Long getIdDespesa() {
		return idDespesa;
	}

	public void setIdDespesa(Long idDespesa) {
		this.idDespesa = idDespesa;
	}

	public List<Entrada> getEntradas() {
		return entradas;
	}

	public void setEntradas(List<Entrada> entradas) {
		this.entradas = entradas;
	}

	public List<ItemDespesa> getItensDespesa() {
		return itensDespesa;
	}

	public void setItensDespesa(List<ItemDespesa> itensDespesa) {
		this.itensDespesa = itensDespesa;
	}

	public List<ItemDespesa> getItensDespesaSelecionados() {
		return itensDespesaSelecionados;
	}

	public void setItensDespesaSelecionados(List<ItemDespesa> itensDespesaSelecionados) {
		this.itensDespesaSelecionados = itensDespesaSelecionados;
	}

	public boolean isEdicaoItem() {
		return edicaoItem;
	}

	public void setEdicaoItem(boolean edicaoItem) {
		this.edicaoItem = edicaoItem;
	}

	public BigDecimal getValorAtual() {
		return valorAtual;
	}

	public void setValorAtual(BigDecimal valorAtual) {
		this.valorAtual = valorAtual;
	}
}
