package br.com.importcg.enumeration;

public enum EnumTipoPessoa {
	CLIENTE("Cliente"),
	FUNCIONARIO("Funcionário");
	
	private String descricao;
	
	EnumTipoPessoa(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
