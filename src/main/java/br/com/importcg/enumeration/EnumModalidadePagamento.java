package br.com.importcg.enumeration;

public enum EnumModalidadePagamento {
	AVISTA("À Vista"),
	APRAZO("À Prazo");
	
	private String descricao;
	
	EnumModalidadePagamento(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
