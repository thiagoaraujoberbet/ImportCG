package br.com.importcg.enumeration;

public enum EnumRole {
	ADMIN("Admin"),
	USER("Usuário");
	
	private String descricao;
	
	EnumRole(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
