package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.PagamentoDAO;
import br.com.importcg.model.Pagamento;
import br.com.importcg.util.Transacional;

public class PagamentoService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6412817458295918043L;

	@Inject
	private PagamentoDAO pagamentoDAO;

	@Transacional
	public Pagamento salvar(Pagamento pagamento) {
		return pagamentoDAO.salvar(pagamento);
	}

	@Transacional
	public void excluir(Pagamento pagamento) {
		pagamentoDAO.excluir(pagamento);
	}
	
	public List<Pagamento> porIdVenda(Long idVenda) {
		return pagamentoDAO.porIdVenda(idVenda);
	}
	
	public Pagamento porId(Long id) {
		return pagamentoDAO.porId(id);
	}

	public List<Pagamento> buscarRecebimentosDiarioCliente() {
		return pagamentoDAO.buscarRecebimentosDiarioCliente();
	}

	public List<Pagamento> buscarRecebimentosDiarioPagSeguro() {
		return pagamentoDAO.buscarRecebimentosDiarioPagSeguro();
	}
}
