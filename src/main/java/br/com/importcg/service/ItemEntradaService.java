package br.com.importcg.service;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.ItemEntradaDAO;
import br.com.importcg.model.ItemEntrada;
import br.com.importcg.util.Transacional;

public class ItemEntradaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5190449549437070193L;

	@Inject
	private ItemEntradaDAO itemEntradaDAO;

	@Transacional
	public ItemEntrada salvar(ItemEntrada itemEntrada) {
		return itemEntradaDAO.salvar(itemEntrada);
	}

	@Transacional
	public void excluir(ItemEntrada itemEntrada) {
		itemEntradaDAO.excluir(itemEntrada);
	}
	
	public List<ItemEntrada> porIdEntrada(Long idEntrada) {
		return itemEntradaDAO.porIdEntrada(idEntrada);
	}
	
	public ItemEntrada porId(Long id) {
		return itemEntradaDAO.porId(id);
	}

	public List<ItemEntrada> buscarItensParaVenda() {
		return itemEntradaDAO.buscarItensParaVenda();
	}

	public BigDecimal buscarQtdeItensDisponiveisParaVendaPorIdProduto(Long idProduto) {
		return itemEntradaDAO.buscarQtdeItensDisponiveisParaVendaPorIdProduto(idProduto);
	}
}
