package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.ItemBaixaDAO;
import br.com.importcg.model.ItemBaixa;
import br.com.importcg.util.Transacional;

public class ItemBaixaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7245051509439173098L;

	@Inject
	private ItemBaixaDAO itemBaixaDAO;
	
	@Transacional
	public ItemBaixa salvar(ItemBaixa itemBaixa) {
		return itemBaixaDAO.salvar(itemBaixa);
	}

	@Transacional
	public void excluir(ItemBaixa itemBaixa) {
		itemBaixaDAO.excluir(itemBaixa);
	}
	
	public List<ItemBaixa> listarTodos() {
		return itemBaixaDAO.listarTodos();
	}
	
	public ItemBaixa porId(Long id) {
		return itemBaixaDAO.porId(id);
	}

	public List<ItemBaixa> porIdBaixa(Long idBaixa) {
		return itemBaixaDAO.porIdBaixa(idBaixa);
	}

	public List<ItemBaixa> buscarDespesasBaixadas() {
		return itemBaixaDAO.buscarDespesasBaixadas();
	}

	public List<ItemBaixa> buscarDespesasABaixar() {
		return itemBaixaDAO.buscarDespesasABaixar();
	}
}
