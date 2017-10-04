package br.com.importcg.wrapper;

import br.com.importcg.enumeration.EnumCategoria;

public class EstoqueWrapper {

	private Long idEstoque;
	
	private Long idProduto;
	
	private Integer quantidade;
	
	private String nomeProduto;
	
	private String marcaProduto;
	
	private String modeloProduto;
	
	private EnumCategoria categoriaProduto;
	
	private String descricaoProduto;
	
	private Integer quantidadeTotalVenda;

	public Long getIdEstoque() {
		return idEstoque;
	}

	public void setIdEstoque(Long idEstoque) {
		this.idEstoque = idEstoque;
	}

	public Long getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Long idProduto) {
		this.idProduto = idProduto;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
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

	public EnumCategoria getCategoriaProduto() {
		return categoriaProduto;
	}

	public void setCategoriaProduto(EnumCategoria categoriaProduto) {
		this.categoriaProduto = categoriaProduto;
	}

	public String getDescricaoProduto() {
		return descricaoProduto;
	}

	public void setDescricaoProduto(String descricaoProduto) {
		this.descricaoProduto = descricaoProduto;
	}

	public Integer getQuantidadeTotalVenda() {
		return quantidadeTotalVenda;
	}

	public void setQuantidadeTotalVenda(Integer quantidadeTotalVenda) {
		this.quantidadeTotalVenda = quantidadeTotalVenda;
	}
}
