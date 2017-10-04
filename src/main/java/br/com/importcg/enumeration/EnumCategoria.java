package br.com.importcg.enumeration;

public enum EnumCategoria {
	CASA("Casa"),
	COSMETICOS("Cosméticos"),
	ELETRONICOS("Eletrônicos"),
	INFORMATICA("Informática"),
	JOIASERELOGIOS("Jóias e Relógios"),
	VESTUARIO("Vestuário");
	
	private String descricao;
	
	EnumCategoria(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
