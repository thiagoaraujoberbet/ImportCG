package br.com.importcg.enumeration;

public enum EnumCategoria {
	ACESSORIOS("Acessórios"),
	BEBIDAS("Bebidas"),
	BRINQUEDOS("Brinquedos"),
	CAMERAS("Câmeras/Acessórios"),
	CASA("Casa"),
	CELULARES("Celulares/Telefones"),
	COSMETICOS("Cosméticos/Perfumes"),
	ELETRODOMESTICOS("Eletrodomésticos"),
	ELETRONICOS("Eletrônicos/Áudio/Vídeo"),
	ESPORTEFITNESS("Esporte/Fitness"),
	FERRAMENTAS("Ferramentas/Construção"),
	GAMES("Games"),
	INFORMATICA("Informática"),
	INSTRUMENTOSMUSICAIS("Instrumentos Musicais"),
	JOIASERELOGIOS("Jóias e Relógios"),
	VESTUARIO("Vestuário");
	
	private String descricao;
	
	EnumCategoria(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
