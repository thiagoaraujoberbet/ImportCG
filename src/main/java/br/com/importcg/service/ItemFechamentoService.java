package br.com.importcg.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.ItemFechamentoDAO;
import br.com.importcg.model.ItemFechamento;
import br.com.importcg.util.Transacional;

public class ItemFechamentoService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4578078945507792895L;

	@Inject
	private ItemFechamentoDAO itemFechamentoDAO;
	
	@Transacional
	public ItemFechamento salvar(ItemFechamento itemFechamento) {
		return itemFechamentoDAO.salvar(itemFechamento);
	}

	@Transacional
	public void excluir(ItemFechamento itemFechamento) {
		itemFechamentoDAO.excluir(itemFechamento);
	}
	
	public List<ItemFechamento> porIdFechamento(Long idFechamento) {
		return itemFechamentoDAO.porIdEntrada(idFechamento);
	}
	
	public ItemFechamento porId(Long id) {
		return itemFechamentoDAO.porId(id);
	}
}
