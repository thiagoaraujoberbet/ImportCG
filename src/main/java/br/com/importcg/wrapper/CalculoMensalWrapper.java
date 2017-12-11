package br.com.importcg.wrapper;

import java.math.BigDecimal;

public class CalculoMensalWrapper {

	private BigDecimal valoresMesAtual;
	
	private BigDecimal valoresProximoMes1;
	
	private BigDecimal valoresProximoMes2;
	
	private BigDecimal valoresProximoMes3;
	
	private BigDecimal valoresTodosMeses;

	public BigDecimal getValoresMesAtual() {
		return valoresMesAtual;
	}

	public void setValoresMesAtual(BigDecimal valoresMesAtual) {
		this.valoresMesAtual = valoresMesAtual;
	}

	public BigDecimal getValoresProximoMes1() {
		return valoresProximoMes1;
	}

	public void setValoresProximoMes1(BigDecimal valoresProximoMes1) {
		this.valoresProximoMes1 = valoresProximoMes1;
	}
	
	public BigDecimal getValoresProximoMes2() {
		return valoresProximoMes2;
	}

	public void setValoresProximoMes2(BigDecimal valoresProximoMes2) {
		this.valoresProximoMes2 = valoresProximoMes2;
	}

	public BigDecimal getValoresProximoMes3() {
		return valoresProximoMes3;
	}

	public void setValoresProximoMes3(BigDecimal valoresProximoMes3) {
		this.valoresProximoMes3 = valoresProximoMes3;
	}

	public BigDecimal getValoresTodosMeses() {
		return valoresTodosMeses;
	}

	public void setValoresTodosMeses(BigDecimal valoresTodosMeses) {
		this.valoresTodosMeses = valoresTodosMeses;
	}
}
