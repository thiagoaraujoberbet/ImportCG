package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Venda;
import br.com.importcg.service.VendaService;

@Named
@ViewScoped
public class ListaVendaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1110389189754661412L;

	@Inject
	private VendaService vendaService;
	
	private List<Venda> vendas = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		vendas = vendaService.listarTodos();
	}
	
	public List<Venda> getVendas() {
		return vendas;
	}

	public void setVendas(List<Venda> vendas) {
		this.vendas = vendas;
	}
}
