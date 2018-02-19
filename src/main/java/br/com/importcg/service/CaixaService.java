package br.com.importcg.service;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.CaixaDAO;
import br.com.importcg.enumeration.EnumTipoConta;
import br.com.importcg.model.Caixa;
import br.com.importcg.util.Transacional;

public class CaixaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5618152351297401598L;

	@Inject
	private CaixaDAO caixaDAO;
	
	@Transacional
	public void salvar(Caixa caixa) {
		caixaDAO.salvar(caixa);
	}

	@Transacional
	public void excluir(Caixa caixa) {
		caixaDAO.excluir(caixa);
	}
	
	public List<Caixa> listarTodos() {
		return caixaDAO.listarTodos();
	}
	
	public Caixa porId(Long id) {
		return caixaDAO.porId(id);
	}

	public Caixa porIdFuncionario(Long idFuncionario, EnumTipoConta tipoConta) {
		return caixaDAO.porIdFuncionario(idFuncionario, tipoConta);
	}

	public Caixa buscarContaPagSeguroAReceber() {
		return caixaDAO.buscarContaPagSeguroAReceber();
	}

	public Caixa buscarContaPagSeguroDisponivel() {
		return caixaDAO.buscarContaPagSeguroDisponivel();
	}

	public BigDecimal obterSaldoTotalCaixa() {
		return caixaDAO.obterSaldoTotalCaixa();
	}
}
