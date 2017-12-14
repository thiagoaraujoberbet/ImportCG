package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.primefaces.model.chart.PieChartModel;

import br.com.importcg.model.Fornecedor;
import br.com.importcg.service.FornecedorService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaFornecedorMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 837400192434796337L;

	@Inject
	private FornecedorService fornecedorService;
	
	private List<Fornecedor> fornecedores = new ArrayList<>();
	
	private List<Fornecedor> fornecedoresSelecionados = new ArrayList<>();
	
	private PieChartModel pieModel1;
	private PieChartModel pieModel2;
	
	@PostConstruct
	public void inicializar() {
		fornecedores = fornecedorService.listarTodos();
		this.createPieModel1();
		this.createPieModel2();
	}
	
	public void excluirSelecionados() {
		for (Fornecedor fornecedor : fornecedoresSelecionados) {
			fornecedorService.excluir(fornecedor);
			fornecedores.remove(fornecedor);
		}
		
		FacesUtil.addInfoMessage("Produto(s) excluido(s) com sucesso!");
	}
	
    private void createPieModel1() {
        pieModel1 = new PieChartModel();
       
        for (Fornecedor fornecedor : fornecedores) {
             pieModel1.set(fornecedor.getNome(), fornecedor.getValorVendido());
        }
        
        pieModel1.setTitle("Fornecedores/Valores");
        pieModel1.setLegendPosition("w");
        pieModel1.setShowDataLabels(true);
    }
    
    private void createPieModel2() {
        pieModel2 = new PieChartModel();
       
        for (Fornecedor fornecedor : fornecedores) {
             pieModel2.set(fornecedor.getNome(), fornecedor.getQuantidadeVendida());
        }
        
        pieModel2.setTitle("Fornecedores/Quantidades");
        pieModel2.setLegendPosition("w");
        pieModel2.setShowDataLabels(true);
    }

	public List<Fornecedor> getFornecedores() {
		return fornecedores;
	}

	public void setFornecedores(List<Fornecedor> fornecedores) {
		this.fornecedores = fornecedores;
	}

	public List<Fornecedor> getFornecedoresSelecionados() {
		return fornecedoresSelecionados;
	}

	public void setFornecedoresSelecionados(List<Fornecedor> fornecedoresSelecionados) {
		this.fornecedoresSelecionados = fornecedoresSelecionados;
	}

	public PieChartModel getPieModel1() {
		return pieModel1;
	}

	public void setPieModel1(PieChartModel pieModel1) {
		this.pieModel1 = pieModel1;
	}

	public PieChartModel getPieModel2() {
		return pieModel2;
	}

	public void setPieModel2(PieChartModel pieModel2) {
		this.pieModel2 = pieModel2;
	}
}
