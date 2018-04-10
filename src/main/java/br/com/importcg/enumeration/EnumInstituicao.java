package br.com.importcg.enumeration;

public enum EnumInstituicao {
	BANCOBRADESCO("Banco Bradesco"),
	BANCODOBRASIL("Banco do Brasil"),
	BANCOHSBC("Banco HSBC"),
	BANCOITAU("Banco Itaú"),
	BANCOSANTANDER("Banco Santander"),
	IMPORTCG("ImportCG"),
	MERCADOPAGO("Mercado Pago"),
	NUBANK("Nubank"),
	PAGSEGURO("PagSeguro"),
	PICPAY("Pic Pay");
	
	private String descricao;
	
	EnumInstituicao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
