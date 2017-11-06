package br.com.importcg.wrapper;

import java.math.BigDecimal;

public class AReceberWrapper {

	private BigDecimal valoresAReceberMesAtual;
	
	private BigDecimal valoresAReceberProximoMes;
	
	private BigDecimal valoresAReceberTodosMeses;

	public BigDecimal getValoresAReceberMesAtual() {
		return valoresAReceberMesAtual;
	}

	public void setValoresAReceberMesAtual(BigDecimal valoresAReceberMesAtual) {
		this.valoresAReceberMesAtual = valoresAReceberMesAtual;
	}

	public BigDecimal getValoresAReceberProximoMes() {
		return valoresAReceberProximoMes;
	}

	public void setValoresAReceberProximoMes(BigDecimal valoresAReceberProximoMes) {
		this.valoresAReceberProximoMes = valoresAReceberProximoMes;
	}

	public BigDecimal getValoresAReceberTodosMeses() {
		return valoresAReceberTodosMeses;
	}

	public void setValoresAReceberTodosMeses(BigDecimal valoresAReceberTodosMeses) {
		this.valoresAReceberTodosMeses = valoresAReceberTodosMeses;
	}
}
