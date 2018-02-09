package br.com.importcg.wrapper;

import java.math.BigDecimal;

public class BalancoMensalWrapper {

	private int mes;
	
	private int ano;
	
	private BigDecimal valor;

	public int getMes() {
		return mes;
	}

	public void setMes(int mes) {
		this.mes = mes;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
}
