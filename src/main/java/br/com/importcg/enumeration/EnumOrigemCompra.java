package br.com.importcg.enumeration;

public enum EnumOrigemCompra {
	INTERNET("Internet"),
	PEDROJUANCABALLERO("Pedro Juan Caballero");
	
	private String descricao;
	
	EnumOrigemCompra(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
