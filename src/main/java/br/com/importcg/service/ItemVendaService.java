package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.ItemVendaDAO;
import br.com.importcg.model.ItemVenda;
import br.com.importcg.util.Transacional;
import br.com.importcg.wrapper.QuantidadeVendidaFuncionarioWrapper;
import br.com.importcg.wrapper.ValorVendidoFuncionarioWrapper;
import br.com.importcg.wrapper.VendasRealizadasWrapper;

public class ItemVendaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8148799975769885445L;

	@Inject
	private ItemVendaDAO itemVendaDAO;

	@Transacional
	public ItemVenda salvar(ItemVenda itemVenda) {
		return itemVendaDAO.salvar(itemVenda);
	}

	@Transacional
	public void excluir(ItemVenda itemVenda) {
		itemVendaDAO.excluir(itemVenda);
	}
	
	public List<ItemVenda> porIdVenda(Long idVenda) {
		return itemVendaDAO.porIdVenda(idVenda);
	}
	
	public ItemVenda porId(Long id) {
		return itemVendaDAO.porId(id);
	}

	public boolean verificarProdutoVendido(Long idProduto) {
		return itemVendaDAO.verificarProdutoVendido(idProduto);
	}

	public List<ValorVendidoFuncionarioWrapper> buscarValorVendidoFuncionario(Long idPessoa) {
		return itemVendaDAO.buscarValorVendidoFuncionario(idPessoa);
	}

	public List<QuantidadeVendidaFuncionarioWrapper> buscarQuantidadeVendidaFuncionario(Long idPessoa) {
		return itemVendaDAO.buscarQuantidadeVendidaFuncionario(idPessoa);
	}

	public List<VendasRealizadasWrapper> buscarVendasRealizadasPorProduto(Long idProduto) {
		return itemVendaDAO.buscarVendasRealizadasPorProduto(idProduto);
	}
}
