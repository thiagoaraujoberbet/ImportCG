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

import br.com.importcg.enumeration.EnumStatusBaixa;
import br.com.importcg.enumeration.EnumTipoBaixa;
import br.com.importcg.model.Baixa;
import br.com.importcg.model.Caixa;
import br.com.importcg.model.ItemBaixa;
import br.com.importcg.model.ItemDespesa;
import br.com.importcg.service.BaixaService;
import br.com.importcg.service.CaixaService;
import br.com.importcg.service.ItemBaixaService;
import br.com.importcg.service.ItemDespesaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class BaixaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8308576541860668374L;

	private Baixa baixa = new Baixa();
	private ItemBaixa itemBaixa = new ItemBaixa();
	
	private Long idBaixa;
	
	private List<ItemDespesa> itensDespesa = new ArrayList<>();
	private List<Caixa> caixas = new ArrayList<>();
	private List<ItemBaixa> itensBaixa = new ArrayList<>();
	private List<ItemBaixa> itensBaixaSelecionados = new ArrayList<>();
	
	private boolean edicaoItem = false;
	
	private BigDecimal valorAtual = BigDecimal.ZERO;
	
	@Inject
	private BaixaService baixaService;
	
	@Inject
	private ItemBaixaService itemBaixaService;
	
	@Inject
	private ItemDespesaService itemDespesaService;
	
	@Inject
	private CaixaService caixaService;
	
//	@Inject
//	private DespesaService despesaService;
	
	public void inicializar() {
		if (idBaixa != null) {
			baixa = baixaService.porId(idBaixa);
			itemBaixa.setBaixa(baixa);
			itemBaixa.setTipo(EnumTipoBaixa.BAIXAINTEGRAL);
			itensBaixa = itemBaixaService.porIdBaixa(idBaixa);
		} else {
			baixa.setDataCriacao(new Date());
			baixa.setStatus(EnumStatusBaixa.NAOBAIXADO);
			baixa.setValorTotal(BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN));
		}
		
		if (itensDespesa.isEmpty()) {
			itensDespesa = itemDespesaService.buscarItensDespesaNaoBaixadas();
		}
		
		if (caixas.isEmpty()) {
			caixas = caixaService.listarTodos();
		}
	}

	public String salvar(boolean msg) {
		baixa = baixaService.salvar(baixa);
		
		this.inicializarItemBaixa();
		
		if (msg)
			FacesUtil.addInfoMessage("Baixa cadastrada com sucesso!");
		
		return "";
	}

	public void salvarItem() {
		itemBaixa = itemBaixaService.salvar(itemBaixa);
		
		if (isEdicaoItem()) {
			if  (!itemBaixa.getValor().equals(valorAtual)) {
				if (itemBaixa.getValor().compareTo(valorAtual) == 1) {
					this.atualizarBaixaPositiva(itemBaixa.getValor().subtract(valorAtual));
				} else {
					this.atualizarBaixaNegativa(valorAtual.subtract(itemBaixa.getValor()));
				}
			}
			
			setEdicaoItem(false);
		} else {
			this.atualizarBaixaPositiva(itemBaixa.getValor());
		}
		
		itensBaixa = itemBaixaService.porIdBaixa(itemBaixa.getBaixa().getId());
		itensDespesa = itemDespesaService.buscarItensDespesaNaoBaixadas();
		
		FacesUtil.addInfoMessage("Item cadastrado com sucesso!");
	}
	
	public void editar() {
		itensDespesa = itemDespesaService.listarTodos();
	}
	
	private void atualizarBaixaPositiva(BigDecimal valor) {
		baixa.setValorTotal(baixa.getValorTotal().add(valor));
		this.salvar(false);
	}
	
	private void atualizarBaixaNegativa(BigDecimal valor) {
		baixa.setValorTotal(baixa.getValorTotal().subtract(valor));
		this.salvar(false);
	}
	
	private void inicializarItemBaixa() {
		itemBaixa = new ItemBaixa();
		itemBaixa.setBaixa(baixa);
		itemBaixa.setTipo(EnumTipoBaixa.BAIXAINTEGRAL);
	}
	
	public String excluir() {
		baixaService.excluir(baixa);
			
		return "listarBaixa.xhtml?faces-redirect=true";
	}
	
	public void excluirItensBaixaSelecionados() {
		for (ItemBaixa itemBaixa : itensBaixaSelecionados) {
			this.atualizarBaixaNegativa(itemBaixa.getValor());
			
			itemBaixaService.excluir(itemBaixa);
			itensBaixa.remove(itemBaixa);
		}
				
		FacesUtil.addInfoMessage("Item(s) excluido(s) com sucesso!");
	}
	
	public void setarValor() {
		itemBaixa.setValor(itemBaixa.getItemDespesa().getValor());
	}
	
	public void confirmarBaixa() {
		this.atualizarCaixa();
		this.atualizarItemBaixa();
//		this.atualizarItemDespesa();
//		this.atualizarDespesa();
		this.atualizarBaixa();
		this.inicializarItemBaixa();
	}
	
	private void atualizarCaixa() {
		Caixa caixa = new Caixa();
		caixa = itemBaixa.getCaixa();
		
		if (itemBaixa.isBaixado()) {
			caixa.setValor(caixa.getValor().add(itemBaixa.getValor()));
		} else {
			caixa.setValor(caixa.getValor().subtract(itemBaixa.getValor()));
		}
		
		caixaService.salvar(caixa);
	}
	
//	private void atualizarItemDespesa() {
//		ItemDespesa itemDespesa = new ItemDespesa();
//		itemDespesa = itemBaixa.getItemDespesa();
//		
//		if (EnumTipoBaixa.BAIXAINTEGRAL.equals(itemBaixa.getTipo())) {
//			itemDespesa.setStatus(EnumStatusBaixa.BAIXATOTALMENTE);
//		} else if (EnumTipoBaixa.BAIXAPARCIAL.equals(itemBaixa.getTipo())) {
//			itemDespesa.setStatus(EnumStatusBaixa.BAIXAPARCIALMENTE);
//		}
//		
//		itemDespesaService.salvar(itemDespesa);
//	}
	
//	private void atualizarDespesa() {
//		Despesa despesa = new Despesa();
//		despesa = itemBaixa.getItemDespesa().getDespesa();
//		
//		EnumStatusBaixa status = EnumStatusBaixa.BAIXATOTALMENTE;
//		
//		List<ItemDespesa> itensDespesa = new ArrayList<>();
//		itensDespesa = itemDespesaService.porIdDespesa(despesa.getId());
//		
//		for (ItemDespesa item : itensDespesa) {
//			if (EnumStatusBaixa.NAOBAIXADO.equals(item.getStatus()) || EnumStatusBaixa.BAIXAPARCIALMENTE.equals(item.getStatus())) {
//				status = EnumStatusBaixa.BAIXAPARCIALMENTE;
//				break;
//			}
//		}
//		
//		despesa.setStatus(status);
//		
//		despesaService.salvar(despesa);
//	}
	
	private void atualizarItemBaixa() {
		itemBaixa.setBaixado(itemBaixa.isBaixado() ? Boolean.FALSE : Boolean.TRUE);
		itemBaixa.setData(new Date());
		itemBaixaService.salvar(itemBaixa);
	}

	private void atualizarBaixa() {
		EnumStatusBaixa status = EnumStatusBaixa.BAIXATOTALMENTE;
		
		for (ItemBaixa item : itensBaixa) {
			if (!item.isBaixado()) {
				status = EnumStatusBaixa.BAIXAPARCIALMENTE;
				break;
			}
		}
		
		baixa.setStatus(status);
		baixaService.salvar(baixa);
	}
	
	public Baixa getBaixa() {
		return baixa;
	}

	public void setBaixa(Baixa baixa) {
		this.baixa = baixa;
	}

	public ItemBaixa getItemBaixa() {
		return itemBaixa;
	}

	public void setItemBaixa(ItemBaixa itemBaixa) {
		this.itemBaixa = itemBaixa;
	}

	public Long getIdBaixa() {
		return idBaixa;
	}

	public void setIdBaixa(Long idBaixa) {
		this.idBaixa = idBaixa;
	}

	public List<ItemDespesa> getItensDespesa() {
		return itensDespesa;
	}

	public void setItensDespesa(List<ItemDespesa> itensDespesa) {
		this.itensDespesa = itensDespesa;
	}

	public List<Caixa> getCaixas() {
		return caixas;
	}

	public void setCaixas(List<Caixa> caixas) {
		this.caixas = caixas;
	}

	public List<ItemBaixa> getItensBaixa() {
		return itensBaixa;
	}

	public void setItensBaixa(List<ItemBaixa> itensBaixa) {
		this.itensBaixa = itensBaixa;
	}

	public List<ItemBaixa> getItensBaixaSelecionados() {
		return itensBaixaSelecionados;
	}

	public void setItensBaixaSelecionados(List<ItemBaixa> itensBaixaSelecionados) {
		this.itensBaixaSelecionados = itensBaixaSelecionados;
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
