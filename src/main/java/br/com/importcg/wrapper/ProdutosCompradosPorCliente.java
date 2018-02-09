package br.com.importcg.wrapper;

import java.math.BigDecimal;
import java.util.Date;

public class ProdutosCompradosPorCliente {

	private Long idProduto;
	
	private String nomeProduto;
	
	private String marcaProduto;
	
	private String modeloProduto;
	
	private BigDecimal valorProduto;
	
	private Date dataVenda;

	public Long getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Long idProduto) {
		this.idProduto = idProduto;
	}

	public String getNomeProduto() {
		return nomeProduto;
	}

	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}

	public String getMarcaProduto() {
		return marcaProduto;
	}

	public void setMarcaProduto(String marcaProduto) {
		this.marcaProduto = marcaProduto;
	}

	public String getModeloProduto() {
		return modeloProduto;
	}

	public void setModeloProduto(String modeloProduto) {
		this.modeloProduto = modeloProduto;
	}

	public BigDecimal getValorProduto() {
		return valorProduto;
	}

	public void setValorProduto(BigDecimal valorProduto) {
		this.valorProduto = valorProduto;
	}

	public Date getDataVenda() {
		return dataVenda;
	}

	public void setDataVenda(Date dataVenda) {
		this.dataVenda = dataVenda;
	}
}
