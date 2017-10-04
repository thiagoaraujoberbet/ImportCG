package br.com.importcg.enumeration;

public enum EnumOperacao {
	DEBITO("Débito"),
	CREDITO("Crédito");
	
	private String descricao;
	
	EnumOperacao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
