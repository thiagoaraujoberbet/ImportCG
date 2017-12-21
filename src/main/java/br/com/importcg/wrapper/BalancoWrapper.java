package br.com.importcg.wrapper;

import java.math.BigDecimal;

public class BalancoWrapper {

	private BigDecimal valoresEntrada;
	
	private BigDecimal valoresPago;
	
	private BigDecimal valoresSaida;
	
	private BigDecimal valoresRecebido;
	
	private BigDecimal valoresDespesa;

	public BigDecimal getValoresEntrada() {
		return valoresEntrada;
	}

	public void setValoresEntrada(BigDecimal valoresEntrada) {
		this.valoresEntrada = valoresEntrada;
	}

	public BigDecimal getValoresPago() {
		return valoresPago;
	}

	public void setValoresPago(BigDecimal valoresPago) {
		this.valoresPago = valoresPago;
	}

	public BigDecimal getValoresSaida() {
		return valoresSaida;
	}

	public void setValoresSaida(BigDecimal valoresSaida) {
		this.valoresSaida = valoresSaida;
	}

	public BigDecimal getValoresRecebido() {
		return valoresRecebido;
	}

	public void setValoresRecebido(BigDecimal valoresRecebido) {
		this.valoresRecebido = valoresRecebido;
	}

	public BigDecimal getValoresDespesa() {
		return valoresDespesa;
	}

	public void setValoresDespesa(BigDecimal valoresDespesa) {
		this.valoresDespesa = valoresDespesa;
	}
}
