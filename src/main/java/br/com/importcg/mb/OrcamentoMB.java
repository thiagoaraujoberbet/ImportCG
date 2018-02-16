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

import br.com.importcg.enumeration.EnumTipoPessoa;
import br.com.importcg.model.CatalogoInternacional;
import br.com.importcg.model.ItemOrcamento;
import br.com.importcg.model.Orcamento;
import br.com.importcg.model.Pessoa;
import br.com.importcg.model.Produto;
import br.com.importcg.service.CatalogoInternacionalService;
import br.com.importcg.service.ItemOrcamentoService;
import br.com.importcg.service.OrcamentoService;
import br.com.importcg.service.PessoaService;
import br.com.importcg.service.ProdutoService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class OrcamentoMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7962856019751531682L;
	
	private Orcamento orcamento = new Orcamento();
	private ItemOrcamento itemOrcamento = new ItemOrcamento();
	
	private List<Pessoa> clientes = new ArrayList<>();
	private List<Pessoa> funcionarios = new ArrayList<>();
	private List<Produto> produtos = new ArrayList<>();
	private List<ItemOrcamento> itensOrcamento = new ArrayList<>();
	private List<ItemOrcamento> itensOrcamentoSelecionados = new ArrayList<>();
	private List<CatalogoInternacional> valores = new ArrayList<>();
	
	private boolean edicaoItem = false;
	
	private Long idOrcamento;
	private Integer quantidadeAtual = 0;
	private BigDecimal valorAtual = BigDecimal.ZERO;
	private BigDecimal valorVendaAtual = BigDecimal.ZERO;
	
	@Inject
	private OrcamentoService orcamentoService;
	
	@Inject
	private PessoaService pessoaService;
	
	@Inject
	private ItemOrcamentoService itemOrcamentoService;
	
	@Inject
	private ProdutoService produtoService;
	
	@Inject
	private CatalogoInternacionalService catalogoInternacionalService;
	
	public void inicializar() {
		if (idOrcamento != null) {
			orcamento = orcamentoService.porId(idOrcamento);
			itemOrcamento.setOrcamento(orcamento);
			itensOrcamento = itemOrcamentoService.porIdOrcamento(idOrcamento);
		} else {
			orcamento.setData(new Date());
			orcamento.setValorTotal(BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN));
			orcamento.setLucroTotal(BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN));
			orcamento.setQuantidadeTotal(new Integer(0));
		}
		
		if (clientes.isEmpty()) {
			clientes = pessoaService.listarTodos(null);
		}
		
		if (funcionarios.isEmpty()) {
			funcionarios = pessoaService.listarTodos(EnumTipoPessoa.FUNCIONARIO);
		}
		
		if (produtos.isEmpty()) {
			produtos = produtoService.listarTodos();
		}
	}

	public void salvar(boolean msg) {
		orcamento = orcamentoService.salvar(orcamento);
		
		this.inicializarItemOrcamento();
		
		if (msg)
			FacesUtil.addInfoMessage("Orçamento cadastrado com sucesso!");
	}
	
	public void salvarItem() {
		itemOrcamento = itemOrcamentoService.salvar(itemOrcamento);
		
		this.atualizarOrcamento();
		
		FacesUtil.addInfoMessage("Item cadastrado com sucesso!");
	}
	
	private void atualizarOrcamento() {
		itensOrcamento = itemOrcamentoService.porIdOrcamento(itemOrcamento.getOrcamento().getId());
		
		int quantidadeTotal = 0;
		BigDecimal valorTotal = new BigDecimal("0");
		BigDecimal valorVenda = new BigDecimal("0");
		
		for (ItemOrcamento item : itensOrcamento) {
			quantidadeTotal = quantidadeTotal + item.getQuantidade();
			valorTotal = valorTotal.add(item.getValor().multiply(new BigDecimal(item.getQuantidade())));
			valorVenda = valorVenda.add(item.getValorVenda().multiply(new BigDecimal(item.getQuantidade())));
		}
		
		orcamento = orcamentoService.porId(orcamento.getId());
		
		orcamento.setQuantidadeTotal(quantidadeTotal);
		orcamento.setValorTotal(valorTotal);
		orcamento.setLucroTotal(valorVenda.subtract(valorTotal));
		
		this.salvar(false);
		
		setEdicaoItem(false);
	}

	
	private void inicializarItemOrcamento() {
		itemOrcamento = new ItemOrcamento();
		itemOrcamento.setOrcamento(orcamento);
	}
	
	public String excluir() {
		orcamentoService.excluir(orcamento);
		
		return "listarOrcamento.xhtml?faces-redirect=true";
	}
	
	public void excluirItens() {
		itemOrcamentoService.excluir(itemOrcamento);
		itensOrcamento.remove(itemOrcamento);
		
		this.atualizarOrcamento();
		
		FacesUtil.addInfoMessage("Item(s) excluido(s) com sucesso!");
	}
	
	public void buscarValoresPagosPorIdProduto(Long idProduto) {
		valores = catalogoInternacionalService.buscarValoresPagosPorIdProduto(idProduto);
	}
	
	public void atualizarValor() {
		itemOrcamento.setValor(itemOrcamento.getCatalogoInternacional().getValorEmReal());
	}
	
	public Orcamento getOrcamento() {
		return orcamento;
	}

	public void setOrcamento(Orcamento orcamento) {
		this.orcamento = orcamento;
	}

	public ItemOrcamento getItemOrcamento() {
		return itemOrcamento;
	}

	public void setItemOrcamento(ItemOrcamento itemOrcamento) {
		this.itemOrcamento = itemOrcamento;
	}
	
	public Long getIdOrcamento() {
		return idOrcamento;
	}

	public void setIdOrcamento(Long idOrcamento) {
		this.idOrcamento = idOrcamento;
	}
	
	public List<Pessoa> getClientes() {
		return clientes;
	}

	public void setClientes(List<Pessoa> clientes) {
		this.clientes = clientes;
	}

	public List<Pessoa> getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(List<Pessoa> funcionarios) {
		this.funcionarios = funcionarios;
	}

	public List<ItemOrcamento> getItensOrcamento() {
		return itensOrcamento;
	}

	public void setItensOrcamento(List<ItemOrcamento> itensOrcamento) {
		this.itensOrcamento = itensOrcamento;
	}

	public List<ItemOrcamento> getItensOrcamentoSelecionados() {
		return itensOrcamentoSelecionados;
	}

	public void setItensOrcamentoSelecionados(List<ItemOrcamento> itensOrcamentoSelecionados) {
		this.itensOrcamentoSelecionados = itensOrcamentoSelecionados;
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

	public BigDecimal getValorVendaAtual() {
		return valorVendaAtual;
	}

	public void setValorVendaAtual(BigDecimal valorVendaAtual) {
		this.valorVendaAtual = valorVendaAtual;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

	public List<CatalogoInternacional> getValores() {
		return valores;
	}

	public void setValores(List<CatalogoInternacional> valores) {
		this.valores = valores;
	}
}
