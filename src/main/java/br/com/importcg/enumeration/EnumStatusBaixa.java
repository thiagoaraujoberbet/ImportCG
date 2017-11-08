package br.com.importcg.enumeration;

public enum EnumStatusBaixa {
	NAOBAIXADO("Não Baixado"),
	BAIXAPARCIALMENTE("Baixado Parcialmente"),
	BAIXATOTALMENTE("Baixado");
	
	private String descricao;
	
	EnumStatusBaixa(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
