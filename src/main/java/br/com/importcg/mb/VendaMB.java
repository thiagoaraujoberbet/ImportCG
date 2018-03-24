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

import br.com.importcg.enumeration.EnumFormaPagamento;
import br.com.importcg.enumeration.EnumStatusVenda;
import br.com.importcg.enumeration.EnumTipoPessoa;
import br.com.importcg.model.Caixa;
import br.com.importcg.model.ItemEntrada;
import br.com.importcg.model.ItemVenda;
import br.com.importcg.model.Pagamento;
import br.com.importcg.model.Pessoa;
import br.com.importcg.model.Venda;
import br.com.importcg.service.CaixaService;
import br.com.importcg.service.EstoqueService;
import br.com.importcg.service.ItemEntradaService;
import br.com.importcg.service.ItemVendaService;
import br.com.importcg.service.PagamentoService;
import br.com.importcg.service.PessoaService;
import br.com.importcg.service.VendaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class VendaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7962856019751531682L;
	
	private Venda venda = new Venda();
	private ItemVenda itemVenda = new ItemVenda();
	private Pagamento pagamento = new Pagamento();
	
	private List<Caixa> caixas = new ArrayList<>();
	private List<Pessoa> clientes = new ArrayList<>();
	private List<Pessoa> funcionarios = new ArrayList<>();
	private List<ItemVenda> itensVenda = new ArrayList<>();
	private List<Pagamento> pagamentos = new ArrayList<>();
	private List<ItemEntrada> itensEntrada = new ArrayList<>();
	private List<ItemVenda> itensVendaSelecionados = new ArrayList<>();
	
	private boolean edicaoItem = false;
	private boolean edicaoPagamento = false;
	
	private Long idVenda;
	private Integer quantidadeAtual = 0;
	private BigDecimal valorAtual = BigDecimal.ZERO;
	
	@Inject
	private VendaService vendaService;
	
	@Inject
	private ItemEntradaService itemEntradaService;
	
	@Inject
	private PessoaService pessoaService;
	
	@Inject
	private ItemVendaService itemVendaService;
	
	@Inject
	private EstoqueService estoqueService;
	
	@Inject
	private PagamentoService pagamentoService;
	
	@Inject
	private CaixaService caixaService;
	
	public void inicializar() {
		if (idVenda != null) {
			venda = vendaService.porId(idVenda);
			itemVenda.setVenda(venda);
			itensVenda = itemVendaService.porIdVenda(idVenda);
		} else {
			venda.setDataVenda(new Date());
			venda.setValorTotal(BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN));
			venda.setQuantidadeTotal(new Integer(0));
		}
		
		if (clientes.isEmpty()) {
			clientes = pessoaService.listarTodos(null);
		}
		
		if (funcionarios.isEmpty()) {
			funcionarios = pessoaService.listarTodos(EnumTipoPessoa.FUNCIONARIO);
		}
		
		if (itensEntrada.isEmpty()) {
			itensEntrada = itemEntradaService.buscarItensParaVenda();
		}
		
		if (pagamentos.isEmpty()) {
			pagamentos = pagamentoService.porIdVenda(idVenda);
		}
		
		if (caixas.isEmpty()) {
			caixas = caixaService.listarTodos();
		}
		
		this.calcularValorPago();
		this.calcularValorRestante();
	}

	public void salvar(boolean msg) {
		venda = vendaService.salvar(venda);
		
		this.inicializarItemVenda();
		
		if (msg)
			FacesUtil.addInfoMessage("Venda cadastrada com sucesso!");
	}
	
	public void salvarItem() {
		itemVenda.setProduto(itemVenda.getItemEntrada().getProduto());
		itemVenda = itemVendaService.salvar(itemVenda);
		
		if (isEdicaoItem()) {
			this.salvarItemEditado();
		} else {
			this.salvarItemNovo();
		}
		
		itensEntrada = itemEntradaService.buscarItensParaVenda();
		itensVenda = itemVendaService.porIdVenda(itemVenda.getVenda().getId());
		
		FacesUtil.addInfoMessage("Item cadastrado com sucesso!");
	}
	
	private void salvarItemEditado() {
		if (!itemVenda.getQuantidade().equals(quantidadeAtual)) {
			if (itemVenda.getQuantidade() > quantidadeAtual) {
//				estoqueService.atualizarEstoqueNegativo(itemVenda.getQuantidade() - quantidadeAtual, itemVenda.getProduto().getId());
				this.atualizarVendaPositiva(itemVenda.getQuantidade() - quantidadeAtual, itemVenda.getValor());
			} else {
//				estoqueService.atualizarEstoquePositivo(quantidadeAtual - itemVenda.getQuantidade(), itemVenda.getProduto());
				this.atualizarVendaNegativa(quantidadeAtual - itemVenda.getQuantidade(), itemVenda.getValor());
			}
		} else if  (!itemVenda.getValor().equals(valorAtual)) {
			if (itemVenda.getValor().compareTo(valorAtual) == 1) {
				this.atualizarVendaPositiva(new Integer(0), itemVenda.getValor().subtract(valorAtual));
			} else {
				this.atualizarVendaNegativa(new Integer(0), valorAtual.subtract(itemVenda.getValor()));
			}
		}
		
		setEdicaoItem(false);
	}
	
	private void salvarItemNovo() {
//		estoqueService.atualizarEstoqueNegativo(itemVenda.getQuantidade(), itemVenda.getProduto().getId());
		this.atualizarVendaPositiva(itemVenda.getQuantidade(), itemVenda.getValor());
	}

	private void atualizarVendaPositiva(Integer quantidade, BigDecimal valor) {
		venda = vendaService.porId(venda.getId());
		venda.setValorTotal(venda.getValorTotal().add(valor.multiply(new BigDecimal(quantidade))));
		venda.setQuantidadeTotal(venda.getQuantidadeTotal() + quantidade);
		
		this.salvar(false);
	}
	
	private void atualizarVendaNegativa(Integer quantidade, BigDecimal valor) {
		venda = vendaService.porId(venda.getId());
		venda.setValorTotal(venda.getValorTotal().subtract(valor.multiply(new BigDecimal(quantidade))));
		venda.setQuantidadeTotal(venda.getQuantidadeTotal() - quantidade);
		
		this.salvar(false);
	}
	
	private void inicializarItemVenda() {
		itemVenda = new ItemVenda();
		itemVenda.setVenda(venda);
		
		pagamento = new Pagamento();
		pagamento.setVenda(venda);
	}
	
	public void salvarPagamento() {
		pagamento.setVenda(venda);
		
		if (EnumFormaPagamento.DINHEIRO.equals(pagamento.getForma()) || EnumFormaPagamento.CHEQUE.equals(pagamento.getForma()))
			pagamento.setSaldo(pagamento.getValor());
		
		pagamento = pagamentoService.salvar(pagamento);
		
		if (!isEdicaoPagamento()) {
			if (EnumFormaPagamento.DEBITO.equals(pagamento.getForma()) || EnumFormaPagamento.CREDITO.equals(pagamento.getForma())) {
				this.atualizarCaixaPositivoPagSeguroAReceberNoCartao();
			}
		}
		
		pagamento = new Pagamento();
		pagamentos = pagamentoService.porIdVenda(venda.getId());
		
		this.edicaoPagamento = false;
		
		FacesUtil.addInfoMessage("Pagamento cadastrado com sucesso!");
	}
	
	private void atualizarCaixaPositivoPagSeguroAReceberNoCartao() {
		Caixa caixa = caixaService.buscarContaPagSeguroAReceber();
		caixa.setValor(caixa.getValor().add(pagamento.getSaldo()));
		caixaService.salvar(caixa);
	}
	
	private void atualizarCaixaNegativoPagSeguroAReceberNoCartao() {
		Caixa caixa = caixaService.buscarContaPagSeguroAReceber();
		caixa.setValor(caixa.getValor().subtract(pagamento.getSaldo()));
		caixaService.salvar(caixa);
	}

	public String excluir() {
		for (ItemVenda itemVenda : itensVenda) {
//			estoqueService.atualizarEstoquePositivo(itemVenda.getQuantidade(), itemVenda.getProduto());
		} 
		
		vendaService.excluir(venda);
		
		return "listarVenda.xhtml?faces-redirect=true";
	}
	
	public void excluirItens() {
		itemVendaService.excluir(itemVenda);
		itensVenda.remove(itemVenda);
		
//		estoqueService.atualizarEstoquePositivo(itemVenda.getQuantidade(), itemVenda.getProduto());
		this.atualizarVendaNegativa(itemVenda.getQuantidade(), itemVenda.getValor());
		
		FacesUtil.addInfoMessage("Item(s) excluido(s) com sucesso!");
	}
	
	public void excluirPagamento() {
		if (EnumFormaPagamento.DEBITO.equals(pagamento.getForma()) || EnumFormaPagamento.CREDITO.equals(pagamento.getForma())) {
			this.atualizarCaixaNegativoPagSeguroAReceberNoCartao();
		}
		
		pagamentoService.excluir(pagamento);
		pagamentos.remove(pagamento);
		
		pagamento = new Pagamento();
		
		FacesUtil.addInfoMessage("Pagamento(s) excluido(s) com sucesso!");
	}
	
	public void confirmarRecebimento() {
		pagamento.setPago(pagamento.isPago() ? Boolean.FALSE : Boolean.TRUE);
		pagamento = pagamentoService.salvar(pagamento);	
		
		this.atualizarStatusVenda();
		
		if (EnumFormaPagamento.DINHEIRO.equals(pagamento.getForma())) {
			this.confirmarRecebimentoCaixaFuncionarioEmDinheiro();
		} else if (EnumFormaPagamento.CHEQUE.equals(pagamento.getForma())) {
			this.confirmarRecebimentoCaixaCreditoEmCheque();
		} else if (EnumFormaPagamento.DEBITO.equals(pagamento.getForma()) || EnumFormaPagamento.CREDITO.equals(pagamento.getForma())) {
			this.confirmarRecebimentoCaixaPagSeguroNoCartao();
		}
	}
	
	private void atualizarStatusVenda() {
		BigDecimal valorPagamento = new BigDecimal(0);
		for (Pagamento item : pagamentos) {
			if (item.isPago())
				valorPagamento = valorPagamento.add(item.getValor());
		}
		
		if (valorPagamento.compareTo(new BigDecimal(0)) == 0) {
			venda.setStatus(EnumStatusVenda.AGUARDANDOPAGAMENTO);
		} else if (valorPagamento.compareTo(venda.getValorTotal()) == -1) {
			venda.setStatus(EnumStatusVenda.PAGAMENTOPARCIAL);
		} else if (valorPagamento.compareTo(venda.getValorTotal()) ==  0) {
			venda.setStatus(EnumStatusVenda.VENDACONCLUIDA);
		}
		
		venda = vendaService.salvar(venda);
	}
	
	private void confirmarRecebimentoCaixaFuncionarioEmDinheiro() {
		Caixa caixa = pagamento.getCaixa();
		
		if (pagamento.isPago())
			caixa.setValor(caixa.getValor().add(pagamento.getValor()));
		else 
			caixa.setValor(caixa.getValor().subtract(pagamento.getValor()));
		
		caixaService.salvar(caixa);
	}
	
	private void confirmarRecebimentoCaixaCreditoEmCheque() {
		Caixa caixa = pagamento.getCaixa();
		
		if (pagamento.isPago())
			caixa.setValor(caixa.getValor().add(pagamento.getValor()));
		else 
			caixa.setValor(caixa.getValor().subtract(pagamento.getValor()));
		
		caixaService.salvar(caixa);
	}
	
	private void confirmarRecebimentoCaixaPagSeguroNoCartao() {
		// Recebimento em cartão para caixa PagSeguro Conta Digital (Disponível)
		this.confirmarRecebimentoCaixaPagSeguroDisponivelNoCartao();
		
		// Recebimento em cartão para caixa PagSeguro Conta Digital (A Receber)
		this.confirmarRecebimentoCaixaPagSeguroAReceberNoCartao();
	}

	private void confirmarRecebimentoCaixaPagSeguroDisponivelNoCartao() {
		Caixa caixaDisponivel = caixaService.buscarContaPagSeguroDisponivel();
		
		if (pagamento.isPago())
			caixaDisponivel.setValor(caixaDisponivel.getValor().add(pagamento.getSaldo()));
		else 
			caixaDisponivel.setValor(caixaDisponivel.getValor().subtract(pagamento.getSaldo()));
		
		caixaService.salvar(caixaDisponivel);
	}
	
	private void confirmarRecebimentoCaixaPagSeguroAReceberNoCartao() {
		Caixa caixaAReceber = caixaService.buscarContaPagSeguroAReceber();
		
		if (pagamento.isPago())
			caixaAReceber.setValor(caixaAReceber.getValor().subtract(pagamento.getSaldo()));
		else 
			caixaAReceber.setValor(caixaAReceber.getValor().add(pagamento.getSaldo()));
		
		caixaService.salvar(caixaAReceber);
	}
	
	public BigDecimal calcularValorPago() {
		BigDecimal valorPago = new BigDecimal(0);
		for (Pagamento item : pagamentos) {
			if (item.isPago())
				valorPago = valorPago.add(item.getValor());
		}
		return valorPago;
	}

	public BigDecimal calcularValorRestante() {
		BigDecimal valorRestante = new BigDecimal(0);
		for (Pagamento item : pagamentos) {
			if (!item.isPago())
				valorRestante = valorRestante.add(item.getSaldo());
		}
		return valorRestante;
	}
	
	public void calcularTaxaCartao() {
		pagamento.setTaxa(pagamento.getValor().subtract(pagamento.getSaldo()));
	}
	
	public Venda getVenda() {
		return venda;
	}

	public void setVenda(Venda venda) {
		this.venda = venda;
	}

	public ItemVenda getItemVenda() {
		return itemVenda;
	}

	public void setItemVenda(ItemVenda itemVenda) {
		this.itemVenda = itemVenda;
	}
	
	public Pagamento getPagamento() {
		return pagamento;
	}

	public void setPagamento(Pagamento pagamento) {
		this.pagamento = pagamento;
	}

	public Long getIdVenda() {
		return idVenda;
	}

	public void setIdVenda(Long idVenda) {
		this.idVenda = idVenda;
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

	public List<ItemVenda> getItensVenda() {
		return itensVenda;
	}

	public void setItensVenda(List<ItemVenda> itensVenda) {
		this.itensVenda = itensVenda;
	}

	public List<ItemEntrada> getItensEntrada() {
		return itensEntrada;
	}

	public void setItensEntrada(List<ItemEntrada> itensEntrada) {
		this.itensEntrada = itensEntrada;
	}
	
	public List<Pagamento> getPagamentos() {
		return pagamentos;
	}

	public void setPagamentos(List<Pagamento> pagamentos) {
		this.pagamentos = pagamentos;
	}

	public List<ItemVenda> getItensVendaSelecionados() {
		return itensVendaSelecionados;
	}

	public void setItensVendaSelecionados(List<ItemVenda> itensVendaSelecionados) {
		this.itensVendaSelecionados = itensVendaSelecionados;
	}

	public boolean isEdicaoItem() {
		return edicaoItem;
	}

	public void setEdicaoItem(boolean edicaoItem) {
		this.edicaoItem = edicaoItem;
	}
	
	public boolean isEdicaoPagamento() {
		return edicaoPagamento;
	}

	public void setEdicaoPagamento(boolean edicaoPagamento) {
		this.edicaoPagamento = edicaoPagamento;
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
