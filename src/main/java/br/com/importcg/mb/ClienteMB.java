package br.com.importcg.mb;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.enumeration.EnumTipoPessoa;
import br.com.importcg.model.Pessoa;
import br.com.importcg.service.PessoaService;
import br.com.importcg.util.FacesUtil;
import br.com.importcg.wrapper.ProdutosCompradosPorCliente;

@Named
@ViewScoped
public class ClienteMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2468889433073865690L;

	private Pessoa cliente = new Pessoa();
	
	private Long idCliente;
	
	private List<ProdutosCompradosPorCliente> produtosCompradosPorCliente = new ArrayList<>();
	
	@Inject
	private PessoaService pessoaService;
	
	public void inicializar() {
		if (idCliente != null) {
			cliente = pessoaService.porId(idCliente);
			produtosCompradosPorCliente = pessoaService.buscarProdutosCompradosPorCliente(idCliente);
		} else {
			cliente.setTipo(EnumTipoPessoa.CLIENTE);
			cliente.setDataCriacao(new Date());
		}
	}
	
	public String totalizar() {
		BigDecimal total = new BigDecimal(0);
		
		for (ProdutosCompradosPorCliente produto : produtosCompradosPorCliente) {
			total = total.add(produto.getValorProduto());
		}
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		String formatado = nf.format(total);
		
		return formatado;
	}
	
	public String salvar() {
		pessoaService.salvar(cliente);
		
		if (cliente.isEdicao())
			FacesUtil.addInfoMessage("Cliente editado com sucesso!");
		else
			FacesUtil.addInfoMessage("Cliente cadastrado com sucesso!");
		
		return "listarCliente.xhtml?faces-redirect=true";
	}
	
	public String excluir() {
		pessoaService.excluir(cliente);
		
		return "listarCliente.xhtml?faces-redirect=true";
	}

	public Pessoa getCliente() {
		return cliente;
	}

	public void setCliente(Pessoa cliente) {
		this.cliente = cliente;
	}

	public Long getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}

	public List<ProdutosCompradosPorCliente> getProdutosCompradosPorCliente() {
		return produtosCompradosPorCliente;
	}

	public void setProdutosCompradosPorCliente(List<ProdutosCompradosPorCliente> produtosCompradosPorCliente) {
		this.produtosCompradosPorCliente = produtosCompradosPorCliente;
	}
}
