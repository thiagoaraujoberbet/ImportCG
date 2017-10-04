package br.com.importcg.enumeration;

public enum EnumStatusVenda {
	AGUARDANDOPAGAMENTO("Aguardando Pagamento"),
	PAGAMENTOPARCIAL("Pagamento Parcial"),
	VENDACONCLUIDA("Venda Concluída");
	
	private String descricao;
	
	EnumStatusVenda(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
