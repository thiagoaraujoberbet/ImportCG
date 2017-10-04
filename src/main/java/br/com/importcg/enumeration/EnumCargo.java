package br.com.importcg.enumeration;

public enum EnumCargo {
	SOCIO("Sócio"),
	VENDEDOR("Vendedor");
	
	private String descricao;
	
	EnumCargo(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
