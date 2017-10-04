package br.com.importcg.enumeration;

public enum EnumInstituicao {
	BANCOBRADESCO("Banco Bradesco"),
	BANCODOBRASIL("Banco do Brasil"),
	BANCOHSBC("Banco HSBC"),
	BANCOITAU("Banco Itaú"),
	BANCOSANTANDER("Banco Santander"),
	PAGSEGURO("PagSeguro"),
	MERCADOPAGO("Mercado Pago"),
	IMPORTCG("ImportCG");
	
	private String descricao;
	
	EnumInstituicao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
