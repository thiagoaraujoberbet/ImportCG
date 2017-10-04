package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Entrada;
import br.com.importcg.model.ItemEntrada;
import br.com.importcg.service.EntradaService;
import br.com.importcg.service.EstoqueService;
import br.com.importcg.service.ItemEntradaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaEntradaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7716223882648115291L;

	@Inject
	private EntradaService entradaService;
	
	@Inject
	private ItemEntradaService itemEntradaService;
	
	@Inject
	private EstoqueService estoqueService;
	
	private List<Entrada> entradas = new ArrayList<>();
	
	private List<Entrada> entradasSelecionadas = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		entradas = entradaService.listarTodos();
	}
	
	public void excluirSelecionadas() {
		for (Entrada entrada : entradasSelecionadas) {
			
			this.atualizarEstoque(entrada.getId());
			
			entradaService.excluir(entrada);
			entradas.remove(entrada);
		}
		
		FacesUtil.addInfoMessage("Entrada(s) excluida(s) com sucesso!");
	}

	private void atualizarEstoque(Long idEntrada) {
		List<ItemEntrada> itensEntrada = itemEntradaService.porIdEntrada(idEntrada);
		
		for (ItemEntrada itemEntrada : itensEntrada) {
			estoqueService.atualizarEstoqueNegativo(itemEntrada.getQuantidade(), itemEntrada.getProduto().getId());
		} 
	}

	public List<Entrada> getEntradas() {
		return entradas;
	}

	public void setEntradas(List<Entrada> entradas) {
		this.entradas = entradas;
	}

	public List<Entrada> getEntradasSelecionadas() {
		return entradasSelecionadas;
	}

	public void setEntradasSelecionadas(List<Entrada> entradasSelecionadas) {
		this.entradasSelecionadas = entradasSelecionadas;
	}
}
