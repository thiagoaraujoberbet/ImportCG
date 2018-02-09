package br.com.importcg.service;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.PrincipalDAO;
import br.com.importcg.wrapper.CalculoMensalWrapper;
import br.com.importcg.wrapper.BalancoMensalWrapper;
import br.com.importcg.wrapper.BalancoWrapper;

public class PrincipalService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5421646002182506502L;

	@Inject
	private PrincipalDAO principalDAO;

	public List<BalancoWrapper> buscarBalancoMesAnterior() {
		return principalDAO.buscarBalancoMesAnterior();
	}

	public List<BalancoWrapper> buscarBalancoMesAtual() {
		return principalDAO.buscarBalancoMesAtual();
	}

	public List<BalancoWrapper> buscarBalancoGeral() {
		return principalDAO.buscarBalancoGeral();
	}

	public List<CalculoMensalWrapper> buscarValoresAReceber() {
		return principalDAO.buscarValoresAReceber();
	}

	public List<CalculoMensalWrapper> buscarValoresAPagar() {
		return principalDAO.buscarValoresAPagar();
	}

	public List<BalancoMensalWrapper> buscarEntradaPorMes() {
		return principalDAO.buscarEntradaPorMes();
	}

	public List<BalancoMensalWrapper> buscarSaidasPorMes() {
		return principalDAO.buscarSaidasPorMes();
	}

	public List<BalancoMensalWrapper> buscarRecebidosPorMes() {
		return principalDAO.buscarRecebidosPorMes();
	}

	public List<BalancoMensalWrapper> buscarDespesasPorMes() {
		return principalDAO.buscarDespesasPorMes();
	}

	public List<BalancoMensalWrapper> buscarPagosPorMes() {
		return principalDAO.buscarPagosPorMes();
	}

	public BigDecimal buscarRecordVendas() {
		return principalDAO.buscarRecordVendas();
	}
}
