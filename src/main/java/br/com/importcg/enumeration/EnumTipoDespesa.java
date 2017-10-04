package br.com.importcg.enumeration;

public enum EnumTipoDespesa {
	ALIMENTACAO("Alimentação"),
	ALMOXARIFADO("Almoxarifado"),
	COMBUSTIVEL("Combustível"),
	COMPRAPRODUTO("Compra de Produtos"),
	MARKETING("Marketing");
	
	private String descricao;
	
	EnumTipoDespesa(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
