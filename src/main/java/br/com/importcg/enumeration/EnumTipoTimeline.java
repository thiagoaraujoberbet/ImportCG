package br.com.importcg.enumeration;

public enum EnumTipoTimeline {
	CADASTROCLIENTE("Cadastro de Clientes"),
	CADASTROFORNECEDOR("Cadastro de Fornecedores"),
	CADASTROFUNCIONARIO("Cadastro de Funcionários"),
	MOVIMENTACAOESTOQUE("Movimentação de Estoque"),
	ORCAMENTO("Orçamento"),
	CADASTROPRODUTO("Cadastro de Produtos"),
	COMPRA("Compras"),
	VENDA("Vendas"),
	FLUXOCAIXA("Fluxo de Caixa"),
	CADASTROCONTAS("Cadastro de Contas"),
	TRAMITE("Trâmites"),
	APLICACAO("Aplicações"),
	RETIRADA("Retiradas"),
	DESPESA("Despesas"),
	BAIXA("Baixas"),
	FECHAMENTO("Fechamentos");
	
	private String descricao;
	
	EnumTipoTimeline(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
