package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.PrincipalDAO;
import br.com.importcg.wrapper.AReceberWrapper;
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

	public List<AReceberWrapper> buscarValoresAReceber() {
		return principalDAO.buscarValoresAReceber();
	}
}
