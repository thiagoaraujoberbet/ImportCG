package br.com.importcg.enumeration;

public enum EnumTipoConta {
	CONTABANCARIA("Conta Bancária"),
	CONTAMANUAL("Conta Manual"),
	CONTAWEB("Conta da Web");
	
	private String descricao;
	
	EnumTipoConta(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
