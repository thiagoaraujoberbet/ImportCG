package br.com.importcg.enumeration;

public enum EnumMes {
	JANEIRO(1, "Janeiro"),
	FEVEREIRO(2, "Fevereiro"),
	MARCO(3, "Março"),
	ABRIL(4, "Abril"),
	MAIO(5, "Maio"),
	JUNHO(6, "Junho"),
	JULHO(7, "Julho"),
	AGOSTO(8, "Agosto"),
	SETEMBRO(9, "Setembro"),
	OUTUBRO(10, "Outubro"),
	NOVEMBRO(11, "Novembro"),
	DEZEMBRO(12, "Dezembro");
	
	private int ordinal;
	private String descricao;
	
	EnumMes(int ordinal, String descricao) {
		this.ordinal = ordinal;
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public int getOrdinal() {
		return ordinal;
	}
}
