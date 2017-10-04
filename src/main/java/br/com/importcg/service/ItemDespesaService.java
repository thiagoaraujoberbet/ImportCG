package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.ItemDespesaDAO;
import br.com.importcg.model.ItemDespesa;
import br.com.importcg.util.Transacional;

public class ItemDespesaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5462336583694071745L;

	@Inject
	private ItemDespesaDAO itemDespesaDAO;
	
	@Transacional
	public ItemDespesa salvar(ItemDespesa itemDespesa) {
		return itemDespesaDAO.salvar(itemDespesa);
	}

	@Transacional
	public void excluir(ItemDespesa itemDespesa) {
		itemDespesaDAO.excluir(itemDespesa);
	}
	
	public List<ItemDespesa> listarTodos() {
		return itemDespesaDAO.listarTodos();
	}
	
	public ItemDespesa porId(Long id) {
		return itemDespesaDAO.porId(id);
	}

	public List<ItemDespesa> porIdDespesa(Long idDespesa) {
		return itemDespesaDAO.porIdDespesa(idDespesa);
	}

	public List<ItemDespesa> buscarItensDespesaNaoBaixadas() {
		return itemDespesaDAO.buscarItensDespesaNaoBaixadas();
	}
}
