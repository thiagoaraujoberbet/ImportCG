package br.com.importcg.enumeration;

public enum EnumFormaPagamento {
	DINHEIRO("Dinheiro"),
	DEBITO("Débito"),
	CREDITO("Crédito"),
	CHEQUE("Cheque");
	
	private String descricao;
	
	EnumFormaPagamento(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
