package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.ItemVenda;
import br.com.importcg.model.Venda;
import br.com.importcg.service.EstoqueService;
import br.com.importcg.service.ItemVendaService;
import br.com.importcg.service.VendaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaVendaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1110389189754661412L;

	@Inject
	private VendaService vendaService;
	
	@Inject
	private ItemVendaService itemVendaService;
	
	@Inject
	private EstoqueService estoqueService;
	
	private List<Venda> vendas = new ArrayList<>();
	
	private List<Venda> vendasSelecionadas = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		vendas = vendaService.listarTodos();
	}
	
	public void excluirSelecionadas() {
		for (Venda venda : vendasSelecionadas) {
			
			this.atualizarEstoque(venda.getId());
			
			vendaService.excluir(venda);
			vendas.remove(venda);
		}
		
		FacesUtil.addInfoMessage("Venda(s) excluida(s) com sucesso!");
	}
	
	private void atualizarEstoque(Long idVenda) {
		List<ItemVenda> itensVenda = itemVendaService.porIdVenda(idVenda);
		
		for (ItemVenda itemVenda : itensVenda) {
			estoqueService.atualizarEstoquePositivo(itemVenda.getQuantidade(), itemVenda.getProduto());
		} 
	}

	public List<Venda> getVendas() {
		return vendas;
	}

	public void setVendas(List<Venda> vendas) {
		this.vendas = vendas;
	}

	public List<Venda> getVendasSelecionadas() {
		return vendasSelecionadas;
	}

	public void setVendasSelecionadas(List<Venda> vendasSelecionadas) {
		this.vendasSelecionadas = vendasSelecionadas;
	}
}
