package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.ItemOrcamentoDAO;
import br.com.importcg.model.ItemOrcamento;
import br.com.importcg.util.Transacional;

public class ItemOrcamentoService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7078454173301860133L;

	@Inject
	private ItemOrcamentoDAO itemOrcamentoDAO;

	@Transacional
	public ItemOrcamento salvar(ItemOrcamento itemOrcamento) {
		return itemOrcamentoDAO.salvar(itemOrcamento);
	}

	@Transacional
	public void excluir(ItemOrcamento itemOrcamento) {
		itemOrcamentoDAO.excluir(itemOrcamento);
	}
	
	public List<ItemOrcamento> porIdOrcamento(Long idOrcamento) {
		return itemOrcamentoDAO.porIdOrcamento(idOrcamento);
	}
	
	public ItemOrcamento porId(Long id) {
		return itemOrcamentoDAO.porId(id);
	}
}
