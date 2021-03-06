package br.com.importcg.mb;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.enumeration.EnumMes;
import br.com.importcg.model.Entrada;
import br.com.importcg.model.Fechamento;
import br.com.importcg.model.ItemBaixa;
import br.com.importcg.model.ItemFechamento;
import br.com.importcg.service.EntradaService;
import br.com.importcg.service.FechamentoService;
import br.com.importcg.service.ItemBaixaService;
import br.com.importcg.service.ItemFechamentoService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class FechamentoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8832511062375096718L;

	private Fechamento fechamento = new Fechamento();
	private ItemFechamento itemFechamento = new ItemFechamento();
	
	private List<ItemFechamento> itensFechamento = new ArrayList<>();
	private List<ItemFechamento> itensFechamentoSelecionados = new ArrayList<>();
	
	private List<ItemBaixa> despesasBaixadas = new ArrayList<>();
	private List<ItemBaixa> despesasABaixar = new ArrayList<>();
	private List<Entrada> entradas = new ArrayList<>();
	
	private boolean edicaoItem = false;
	
	private Long idFechamento;
	
	@Inject
	private FechamentoService fechamentoService;
	
	@Inject
	private ItemFechamentoService itemFechamentoService;
	
	@Inject
	private ItemBaixaService itemBaixaService;
	
	@Inject
	private EntradaService entradaService;
	
	public void inicializar() {
		if (idFechamento != null) {
			fechamento = fechamentoService.porId(idFechamento);
			itemFechamento.setFechamento(fechamento);
			itensFechamento = itemFechamentoService.porIdFechamento(idFechamento);
		} else {
			fechamento.setData(new Date());
			fechamento.setAno(setarAnoReferente());
			fechamento.setMes(tratarEnumMes(setarMesReferente()));

			fechamento = this.montarListas(fechamento);
			
			this.calcularSaldo();
		}
	}
	
	private Fechamento montarListas(Fechamento fechamento) {
		fechamento = fechamentoService.buscarValoresFechamento(fechamento);
		despesasBaixadas = itemBaixaService.buscarDespesasMensaisBaixadas();
		despesasABaixar = itemBaixaService.buscarDespesasABaixar();
		entradas = entradaService.buscarEntradasMensais();
		
		return fechamento;
	}
	
	private void calcularSaldo() {
		fechamento.setSaldo(fechamento.getValorRecebido().subtract(fechamento.getValorDespesasABaixar().add(fechamento.getValorDespesasBaixadas())));
	}
	
	public String totalizarDespesasBaixadas() {
		BigDecimal total = new BigDecimal(0);
		
		for (ItemBaixa itemBaixa : despesasBaixadas) {
			total = total.add(itemBaixa.getValor());
		}
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		String formatado = nf.format(total);
		
		return formatado;
	}
	
	public String totalizarDespesasABaixar() {
		BigDecimal total = new BigDecimal(0);
		
		for (ItemBaixa itemBaixa : despesasABaixar) {
			total = total.add(itemBaixa.getValor());
		}
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		String formatado = nf.format(total);
		
		return formatado;
	}
	
	public String totalizarEntradas() {
		BigDecimal total = new BigDecimal(0);
		
		for (Entrada entrada : entradas) {
			total = total.add(entrada.getValorTotal());
		}
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		String formatado = nf.format(total);
		
		return formatado;
	}

	private int setarAnoReferente() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.YEAR);
	}
	
	private int setarMesReferente() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.MONTH);
	}
	
	private EnumMes tratarEnumMes(int mes) {
		for (EnumMes e : EnumMes.values()) {
			if(e.getOrdinal() == mes){
				return e;
			}
		}
		
		return EnumMes.JANEIRO;
	}

	public void salvar(boolean msg) {
		fechamento = fechamentoService.salvar(fechamento);
		
		this.inicializarItemFechamento();
		
		if (msg)
			FacesUtil.addInfoMessage("Fechamento cadastrado com sucesso!");
	}
	
	public void salvarItem() {
		itemFechamento = itemFechamentoService.salvar(itemFechamento);
		
		FacesUtil.addInfoMessage("Item cadastrado com sucesso!");
	}
	
	private void inicializarItemFechamento() {
		itemFechamento = new ItemFechamento();
		itemFechamento.setFechamento(fechamento);
	}

	public String excluir() {
		fechamentoService.excluir(fechamento);
		
		return "listarFechamento.xhtml?faces-redirect=true";
	}
	
	public void excluirItensFechamentoSelecionados() {
		for (ItemFechamento itemFechamento : itensFechamentoSelecionados) {
			itemFechamentoService.excluir(itemFechamento);
			itensFechamento.remove(itemFechamento);
		}
				
		FacesUtil.addInfoMessage("Item(s) excluido(s) com sucesso!");
	}

	public Fechamento getFechamento() {
		return fechamento;
	}

	public void setFechamento(Fechamento fechamento) {
		this.fechamento = fechamento;
	}

	public ItemFechamento getItemFechamento() {
		return itemFechamento;
	}

	public void setItemFechamento(ItemFechamento itemFechamento) {
		this.itemFechamento = itemFechamento;
	}

	public List<ItemFechamento> getItensFechamento() {
		return itensFechamento;
	}

	public void setItensFechamento(List<ItemFechamento> itensFechamento) {
		this.itensFechamento = itensFechamento;
	}

	public List<ItemFechamento> getItensFechamentoSelecionados() {
		return itensFechamentoSelecionados;
	}

	public void setItensFechamentoSelecionados(List<ItemFechamento> itensFechamentoSelecionados) {
		this.itensFechamentoSelecionados = itensFechamentoSelecionados;
	}

	public List<ItemBaixa> getDespesasBaixadas() {
		return despesasBaixadas;
	}

	public void setDespesasBaixadas(List<ItemBaixa> despesasBaixadas) {
		this.despesasBaixadas = despesasBaixadas;
	}

	public List<ItemBaixa> getDespesasABaixar() {
		return despesasABaixar;
	}

	public void setDespesasABaixar(List<ItemBaixa> despesasABaixar) {
		this.despesasABaixar = despesasABaixar;
	}

	public List<Entrada> getEntradas() {
		return entradas;
	}

	public void setEntradas(List<Entrada> entradas) {
		this.entradas = entradas;
	}

	public boolean isEdicaoItem() {
		return edicaoItem;
	}

	public void setEdicaoItem(boolean edicaoItem) {
		this.edicaoItem = edicaoItem;
	}

	public Long getIdFechamento() {
		return idFechamento;
	}

	public void setIdFechamento(Long idFechamento) {
		this.idFechamento = idFechamento;
	}
}
