package br.com.importcg.enumeration;

public enum EnumTipoItemFechamento {

	CAIXAEMPRESA("Caixa da Empresa"),
	DESPESAFIXA("Despesas Fixas"),
	PROLABORELUANA("Prolabore Luana Alves Teixeira"),
	PROLABORETHIAGO("Prolabore Thiago Araujo Berbet");
	
	private String descricao;
	
	EnumTipoItemFechamento(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
