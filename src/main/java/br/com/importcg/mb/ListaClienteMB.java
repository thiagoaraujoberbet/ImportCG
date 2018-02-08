package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.primefaces.model.chart.PieChartModel;

import br.com.importcg.model.Pessoa;
import br.com.importcg.service.PessoaService;
import br.com.importcg.util.FacesUtil;
import br.com.importcg.wrapper.QuantidadeCompradaWrapper;
import br.com.importcg.wrapper.ValorCompradoWrapper;

@Named
@ViewScoped
public class ListaClienteMB implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3410205653316191342L;

	@Inject
	private PessoaService pessoaService;
	
	private List<Pessoa> clientes = new ArrayList<>();
	
	private List<Pessoa> clientesSelecionados = new ArrayList<>();
	
	private List<QuantidadeCompradaWrapper> compradoresPorQtde = new ArrayList<>();
	
	private PieChartModel pcmCompradoresPorQtde;
	
	private List<ValorCompradoWrapper> compradoresPorValor = new ArrayList<>();
	
	private PieChartModel pcmCompradoresPorValor;
	
	@PostConstruct
	public void inicializar() {
		clientes = pessoaService.buscarInformacoesCliente();
		compradoresPorQtde = pessoaService.buscarMaioresCompradoresPorQtde();
		compradoresPorValor = pessoaService.buscarMaioresCompradoresPorValor();
		
		this.createPcmCompradoresPorQtde();
		this.createPcmCompradoresPorValor();
	}
	
	private void createPcmCompradoresPorQtde() {
		pcmCompradoresPorQtde = new PieChartModel();
        
        for (QuantidadeCompradaWrapper item : compradoresPorQtde) {
        	pcmCompradoresPorQtde.set(item.getNome() + " --> " + item.getQuantidade(), item.getQuantidade());
        }
        
        pcmCompradoresPorQtde.setTitle("Maiores Compradores por Quantidade");
        pcmCompradoresPorQtde.setLegendPosition("w");
        pcmCompradoresPorQtde.setShowDataLabels(true);
	}
	
	private void createPcmCompradoresPorValor() {
		pcmCompradoresPorValor = new PieChartModel();
        
        for (ValorCompradoWrapper item : compradoresPorValor) {
        	pcmCompradoresPorValor.set(item.getNome() + " --> " + item.getValor(), item.getValor());
        }
        
        pcmCompradoresPorValor.setTitle("Maiores Compradores por Valor");
        pcmCompradoresPorValor.setLegendPosition("w");
        pcmCompradoresPorValor.setShowDataLabels(true);
	}

	public void excluirSelecionados() {
		for (Pessoa cliente : clientesSelecionados) {
			pessoaService.excluir(cliente);
			clientes.remove(cliente);
		}
		
		FacesUtil.addInfoMessage("Cliente(s) excluido(s) com sucesso!");
	}

	public List<Pessoa> getClientes() {
		return clientes;
	}

	public void setClientes(List<Pessoa> clientes) {
		this.clientes = clientes;
	}

	public List<Pessoa> getClientesSelecionados() {
		return clientesSelecionados;
	}

	public void setClientesSelecionados(List<Pessoa> clientesSelecionados) {
		this.clientesSelecionados = clientesSelecionados;
	}

	public List<QuantidadeCompradaWrapper> getCompradoresPorQtde() {
		return compradoresPorQtde;
	}

	public void setCompradoresPorQtde(List<QuantidadeCompradaWrapper> compradoresPorQtde) {
		this.compradoresPorQtde = compradoresPorQtde;
	}

	public PieChartModel getPcmCompradoresPorQtde() {
		return pcmCompradoresPorQtde;
	}

	public void setPcmCompradoresPorQtde(PieChartModel pcmCompradoresPorQtde) {
		this.pcmCompradoresPorQtde = pcmCompradoresPorQtde;
	}

	public List<ValorCompradoWrapper> getCompradoresPorValor() {
		return compradoresPorValor;
	}

	public void setCompradoresPorValor(List<ValorCompradoWrapper> compradoresPorValor) {
		this.compradoresPorValor = compradoresPorValor;
	}

	public PieChartModel getPcmCompradoresPorValor() {
		return pcmCompradoresPorValor;
	}

	public void setPcmCompradoresPorValor(PieChartModel pcmCompradoresPorValor) {
		this.pcmCompradoresPorValor = pcmCompradoresPorValor;
	}
}
