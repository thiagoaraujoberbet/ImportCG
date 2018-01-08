package br.com.importcg.enumeration;

public enum EnumTipoDespesa {
	ALIMENTACAO("Alimentação"),
	ALMOXARIFADO("Almoxarifado"),
	COMBUSTIVEL("Combustível"),
	COMPRAPRODUTO("Compra de Produtos"),
	FRETE("Frete"),
	IMPOSTO("Imposto"),
	MARKETING("Marketing"),
	MANUTENCAOCARRO("Manutenção do Carro"),
	OUTROS("Outros"),
	REDESOCIAL("Rede Social"),
	TAXA("Taxa");
	
	private String descricao;
	
	EnumTipoDespesa(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
