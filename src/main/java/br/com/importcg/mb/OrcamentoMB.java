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
import br.com.importcg.model.Caixa;
import br.com.importcg.model.ItemOrcamento;
import br.com.importcg.model.Orcamento;
import br.com.importcg.model.Pessoa;
import br.com.importcg.service.CaixaService;
import br.com.importcg.service.EstoqueService;
import br.com.importcg.service.ItemOrcamentoService;
import br.com.importcg.service.OrcamentoService;
import br.com.importcg.service.PessoaService;
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
	
	private List<Caixa> caixas = new ArrayList<>();
	private List<Pessoa> clientes = new ArrayList<>();
	private List<Pessoa> funcionarios = new ArrayList<>();
	private List<ItemOrcamento> itensOrcamento = new ArrayList<>();
	private List<ItemOrcamento> itensOrcamentoSelecionados = new ArrayList<>();
	
	private boolean edicaoItem = false;
	
	private Long idOrcamento;
	private Integer quantidadeAtual = 0;
	private BigDecimal valorAtual = BigDecimal.ZERO;
	
	@Inject
	private OrcamentoService orcamentoService;
	
	@Inject
	private PessoaService pessoaService;
	
	@Inject
	private ItemOrcamentoService itemOrcamentoService;
	
	@Inject
	private EstoqueService estoqueService;
	
	@Inject
	private CaixaService caixaService;
	
	public void inicializar() {
		if (idOrcamento != null) {
			orcamento = orcamentoService.porId(idOrcamento);
			itemOrcamento.setOrcamento(orcamento);
			itensOrcamento = itemOrcamentoService.porIdOrcamento(idOrcamento);
		} else {
			orcamento.setData(new Date());
			orcamento.setValorTotal(BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN));
			orcamento.setQuantidadeTotal(new Integer(0));
		}
		
		if (clientes.isEmpty()) {
			clientes = pessoaService.listarTodos(null);
		}
		
		if (funcionarios.isEmpty()) {
			funcionarios = pessoaService.listarTodos(EnumTipoPessoa.FUNCIONARIO);
		}
		
		if (caixas.isEmpty()) {
			caixas = caixaService.listarTodos();
		}
	}

	public void salvar(boolean msg) {
		orcamento = orcamentoService.salvar(orcamento);
		
		this.inicializarItemOrcamento();
		
		if (msg)
			FacesUtil.addInfoMessage("Orcamento cadastrada com sucesso!");
	}
	
	public void salvarItem() {
		itemOrcamento = itemOrcamentoService.salvar(itemOrcamento);
		
		if (isEdicaoItem()) {
			this.salvarItemEditado();
		} else {
			this.salvarItemNovo();
		}
		
		itensOrcamento = itemOrcamentoService.porIdOrcamento(itemOrcamento.getOrcamento().getId());
		
		FacesUtil.addInfoMessage("Item cadastrado com sucesso!");
	}
	
	private void salvarItemEditado() {
		if (!itemOrcamento.getQuantidade().equals(quantidadeAtual)) {
			if (itemOrcamento.getQuantidade() > quantidadeAtual) {
				estoqueService.atualizarEstoqueNegativo(itemOrcamento.getQuantidade() - quantidadeAtual, itemOrcamento.getProduto().getId());
				this.atualizarOrcamentoPositiva(itemOrcamento.getQuantidade() - quantidadeAtual, itemOrcamento.getValor());
			} else {
				estoqueService.atualizarEstoquePositivo(quantidadeAtual - itemOrcamento.getQuantidade(), itemOrcamento.getProduto());
				this.atualizarOrcamentoNegativa(quantidadeAtual - itemOrcamento.getQuantidade(), itemOrcamento.getValor());
			}
		} else if  (!itemOrcamento.getValor().equals(valorAtual)) {
			if (itemOrcamento.getValor().compareTo(valorAtual) == 1) {
				this.atualizarOrcamentoPositiva(new Integer(0), itemOrcamento.getValor().subtract(valorAtual));
			} else {
				this.atualizarOrcamentoNegativa(new Integer(0), valorAtual.subtract(itemOrcamento.getValor()));
			}
		}
		
		setEdicaoItem(false);
	}
	
	private void salvarItemNovo() {
		estoqueService.atualizarEstoqueNegativo(itemOrcamento.getQuantidade(), itemOrcamento.getProduto().getId());
		this.atualizarOrcamentoPositiva(itemOrcamento.getQuantidade(), itemOrcamento.getValor());
	}

	private void atualizarOrcamentoPositiva(Integer quantidade, BigDecimal valor) {
		orcamento = orcamentoService.porId(orcamento.getId());
		orcamento.setValorTotal(orcamento.getValorTotal().add(valor.multiply(new BigDecimal(quantidade))));
		orcamento.setQuantidadeTotal(orcamento.getQuantidadeTotal() + quantidade);
		
		this.salvar(false);
	}
	
	private void atualizarOrcamentoNegativa(Integer quantidade, BigDecimal valor) {
		orcamento = orcamentoService.porId(orcamento.getId());
		orcamento.setValorTotal(orcamento.getValorTotal().subtract(valor.multiply(new BigDecimal(quantidade))));
		orcamento.setQuantidadeTotal(orcamento.getQuantidadeTotal() - quantidade);
		
		this.salvar(false);
	}
	
	private void inicializarItemOrcamento() {
		itemOrcamento = new ItemOrcamento();
		itemOrcamento.setOrcamento(orcamento);
	}
	
	public String excluir() {
		for (ItemOrcamento itemOrcamento : itensOrcamento) {
			estoqueService.atualizarEstoquePositivo(itemOrcamento.getQuantidade(), itemOrcamento.getProduto());
		} 
		
		orcamentoService.excluir(orcamento);
		
		return "listarOrcamento.xhtml?faces-redirect=true";
	}
	
	public void excluirItens() {
		itemOrcamentoService.excluir(itemOrcamento);
		itensOrcamento.remove(itemOrcamento);
		
		estoqueService.atualizarEstoquePositivo(itemOrcamento.getQuantidade(), itemOrcamento.getProduto());
		this.atualizarOrcamentoNegativa(itemOrcamento.getQuantidade(), itemOrcamento.getValor());
		
		FacesUtil.addInfoMessage("Item(s) excluido(s) com sucesso!");
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
	
	public List<Caixa> getCaixas() {
		return caixas;
	}

	public void setCaixas(List<Caixa> caixas) {
		this.caixas = caixas;
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
}
