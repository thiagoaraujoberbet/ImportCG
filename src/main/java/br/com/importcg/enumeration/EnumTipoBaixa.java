package br.com.importcg.enumeration;

public enum EnumTipoBaixa {
	NAOBAIXADO("Não Baixado"),
	BAIXAPARCIAL("Baixa Parcial"),
	BAIXAINTEGRAL("Baixa Integral");
	
	private String descricao;
	
	EnumTipoBaixa(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
