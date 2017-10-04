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

import br.com.importcg.enumeration.EnumTipoDespesa;
import br.com.importcg.model.CatalogoInternacional;
import br.com.importcg.model.Despesa;
import br.com.importcg.model.Entrada;
import br.com.importcg.model.Fornecedor;
import br.com.importcg.model.ItemDespesa;
import br.com.importcg.model.ItemEntrada;
import br.com.importcg.model.Produto;
import br.com.importcg.service.CatalogoInternacionalService;
import br.com.importcg.service.DespesaService;
import br.com.importcg.service.EntradaService;
import br.com.importcg.service.EstoqueService;
import br.com.importcg.service.FornecedorService;
import br.com.importcg.service.ItemDespesaService;
import br.com.importcg.service.ItemEntradaService;
import br.com.importcg.service.ProdutoService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class EntradaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8536988328007674484L;

	private Entrada entrada = new Entrada();
	private ItemEntrada itemEntrada = new ItemEntrada();
	private Despesa despesa = new Despesa();
	private ItemDespesa itemDespesa = new ItemDespesa();
	
	private Long idEntrada;
	
	private List<Produto> produtos = new ArrayList<>();
	private List<Fornecedor> fornecedores = new ArrayList<>();
	private List<ItemEntrada> itensEntrada = new ArrayList<>();
	private List<ItemEntrada> itensEntradaSelecionados = new ArrayList<>();
	
	private boolean edicaoItem = false;
	
	private Integer quantidadeAtual = 0;
	private BigDecimal valorAtual = BigDecimal.ZERO;
	
	@Inject
	private EntradaService entradaService;
	
	@Inject
	private ProdutoService produtoService;
	
	@Inject
	private FornecedorService fornecedorService;
	
	@Inject
	private ItemEntradaService itemEntradaService;
	
	@Inject
	private EstoqueService estoqueService;
	
	@Inject
	private CatalogoInternacionalService catalogoInternacionalService;
	
	@Inject
	private DespesaService despesaService;
	
	@Inject
	private ItemDespesaService itemdespesaService;
	
	public void inicializar() {
		if (idEntrada != null) {
			entrada = entradaService.porId(idEntrada);
			itemEntrada.setEntrada(entrada);
			itensEntrada = itemEntradaService.porIdEntrada(idEntrada);
		} else {
			entrada.setDataCompra(new Date());
			entrada.setValorTotal(BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN));
			entrada.setQuantidadeTotal(new Integer(0));
		}
		
		if (produtos.isEmpty()) {
			produtos = produtoService.listarTodos();
		}
		
		if (fornecedores.isEmpty()) {
			fornecedores = fornecedorService.listarTodos();
		}
	}

	public String salvar(boolean msg) {
		entrada = entradaService.salvar(entrada);
		
		this.inicializarItemEntrada();
		
		if (msg)
			FacesUtil.addInfoMessage("Entrada cadastrada com sucesso!");
		
		return "";
	}

	public String salvarItem() {
		itemEntrada = itemEntradaService.salvar(itemEntrada);
		
		if (isEdicaoItem()) {
			if (!itemEntrada.getQuantidade().equals(quantidadeAtual)) {
				if (itemEntrada.getQuantidade() > quantidadeAtual) {
					estoqueService.atualizarEstoquePositivo(itemEntrada.getQuantidade() - quantidadeAtual, itemEntrada.getProduto());
					this.atualizarEntradaPositiva(itemEntrada.getQuantidade() - quantidadeAtual, itemEntrada.getValorEmReal());
				} else {
					estoqueService.atualizarEstoqueNegativo(quantidadeAtual - itemEntrada.getQuantidade(), itemEntrada.getProduto().getId());
					this.atualizarEntradaNegativa(quantidadeAtual - itemEntrada.getQuantidade(), itemEntrada.getValorEmReal());
				}
			} else if  (!itemEntrada.getValorEmReal().equals(valorAtual)) {
				if (itemEntrada.getValorEmReal().compareTo(valorAtual) == 1) {
					this.atualizarEntradaPositiva(new Integer(0), itemEntrada.getValorEmReal().subtract(valorAtual));
				} else {
					this.atualizarEntradaNegativa(new Integer(0), valorAtual.subtract(itemEntrada.getValorEmReal()));
				}
			}
			
			setEdicaoItem(false);
		} else {
			this.salvarCatalogoInternacional();
			
			estoqueService.atualizarEstoquePositivo(itemEntrada.getQuantidade(), itemEntrada.getProduto());
			this.atualizarEntradaPositiva(itemEntrada.getQuantidade(), itemEntrada.getValorEmReal());
		}
		
		FacesUtil.addInfoMessage("Item cadastrado com sucesso!");
		
		return "";
	}
	
	private void atualizarEntradaPositiva(Integer quantidade, BigDecimal valor) {
		entrada.setValorTotal(entrada.getValorTotal().add(valor.multiply(new BigDecimal(quantidade))));
		entrada.setQuantidadeTotal(entrada.getQuantidadeTotal() + quantidade);
		
		this.salvar(false);
	}
	
	private void atualizarEntradaNegativa(Integer quantidade, BigDecimal valor) {
		entrada.setValorTotal(entrada.getValorTotal().subtract(valor.multiply(new BigDecimal(quantidade))));
		entrada.setQuantidadeTotal(entrada.getQuantidadeTotal() - quantidade);
		
		this.salvar(false);
	}
	
	private void salvarCatalogoInternacional() {
		CatalogoInternacional catalogoInternacional = new CatalogoInternacional(itemEntrada, entrada.getDataCompra());
		catalogoInternacionalService.salvar(catalogoInternacional);
	}
	
	private void inicializarItemEntrada() {
		itemEntrada = new ItemEntrada();
		itemEntrada.setEntrada(entrada);
	}
	
	public String excluir() {
		for (ItemEntrada itemEntrada : itensEntrada) {
			estoqueService.atualizarEstoqueNegativo(itemEntrada.getQuantidade(), itemEntrada.getProduto().getId());
		} 
		
		entradaService.excluir(entrada);
			
		return "listarEntrada.xhtml?faces-redirect=true";
	}
	
	public void excluirItensEntradaSelecionados() {
		for (ItemEntrada itemEntrada : itensEntradaSelecionados) {
			estoqueService.atualizarEstoqueNegativo(itemEntrada.getQuantidade(), itemEntrada.getProduto().getId());
			this.atualizarEntradaNegativa(itemEntrada.getQuantidade(), itemEntrada.getValorEmReal());
			
			itemEntradaService.excluir(itemEntrada);
			itensEntrada.remove(itemEntrada);
		}
				
		FacesUtil.addInfoMessage("Item(s) excluido(s) com sucesso!");
	}
	
	public void lancarDespesa() {
		this.salvarDespesa();
		this.salvarItemDespesa();
		this.setarDespesaEntrada();
		
		FacesUtil.addInfoMessage("Despesa lançada com sucesso!");
	}
	
	private void salvarDespesa() {
		despesa = new Despesa(entrada.getDataCompra(), "Lançamento de despesas", entrada.getValorTotal());
		despesa = despesaService.salvar(despesa);
	}
	
	private void salvarItemDespesa() {
		itemDespesa = new ItemDespesa(despesa, entrada, "Produtos para venda", EnumTipoDespesa.COMPRAPRODUTO, entrada.getValorTotal());
		itemDespesa = itemdespesaService.salvar(itemDespesa);
	}
	
	private void setarDespesaEntrada() {
		entrada.setDespesaLancada(Boolean.TRUE);
		entradaService.salvar(entrada);
	}

	public void calcularValorEmReal() {
		itemEntrada.setValorEmReal(itemEntrada.getCotacao().multiply(itemEntrada.getValorEmDolar()));	
	}

	public Entrada getEntrada() {
		return entrada;
	}

	public void setEntrada(Entrada entrada) {
		this.entrada = entrada;
	}
	
	public ItemEntrada getItemEntrada() {
		return itemEntrada;
	}

	public void setItemEntrada(ItemEntrada itemEntrada) {
		this.itemEntrada = itemEntrada;
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

	public Long getIdEntrada() {
		return idEntrada;
	}

	public void setIdEntrada(Long idEntrada) {
		this.idEntrada = idEntrada;
	}
	
	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}
	
	public List<Fornecedor> getFornecedores() {
		return fornecedores;
	}

	public void setFornecedores(List<Fornecedor> fornecedores) {
		this.fornecedores = fornecedores;
	}

	public List<ItemEntrada> getItensEntrada() {
		return itensEntrada;
	}

	public void setItens(List<ItemEntrada> itensEntrada) {
		this.itensEntrada = itensEntrada;
	}

	public List<ItemEntrada> getItensEntradaSelecionados() {
		return itensEntradaSelecionados;
	}

	public void setItensEntradaSelecionados(List<ItemEntrada> itensEntradaSelecionados) {
		this.itensEntradaSelecionados = itensEntradaSelecionados;
	}

	public boolean isEdicaoItem() {
		return edicaoItem;
	}

	public void setEdicaoItem(boolean edicaoItem) {
		this.edicaoItem = edicaoItem;
	}

	public Integer getQuantidadeAtual() {
		return quantidadeAtual;
	}

	public void setQuantidadeAtual(Integer quantidadeAtual) {
		this.quantidadeAtual = quantidadeAtual;
	}

	public BigDecimal getValorAtual() {
		return valorAtual;
	}

	public void setValorAtual(BigDecimal valorAtual) {
		this.valorAtual = valorAtual;
	}
}
