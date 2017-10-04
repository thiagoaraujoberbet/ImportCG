package br.com.importcg.mb;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.primefaces.model.chart.PieChartModel;

import br.com.importcg.model.Caixa;
import br.com.importcg.service.CaixaService;

@Named
@ViewScoped
public class ListaCaixaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5095905358928612927L;

	@Inject
	private CaixaService caixaService;
	
	private List<Caixa> caixas = new ArrayList<>();
	
	private PieChartModel pieModel;
	
	@PostConstruct
	public void inicializar() {
		caixas = caixaService.listarTodos();
		this.createPieModel();
	}
	
	public String totalizar() {
		BigDecimal total = new BigDecimal(0);
		
		for (Caixa caixa : caixas) {
			total = total.add(caixa.getValor());
		}
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		String formatado = nf.format(total);
		
		return formatado;
	}
	
    private void createPieModel() {
        pieModel = new PieChartModel();
       
        for (Caixa caixa : caixas) {
             pieModel.set(caixa.getConta().getNome() + " - " + caixa.getConta().getInstituicao() + " - " + caixa.getConta().getFuncionario().getNome(), caixa.getValor());
        }
        
        pieModel.setTitle("Caixas");
        pieModel.setLegendPosition("w");
        pieModel.setShowDataLabels(true);
    }

	public List<Caixa> getCaixas() {
		return caixas;
	}

	public void setCaixas(List<Caixa> caixas) {
		this.caixas = caixas;
	}

	public PieChartModel getPieModel() {
		return pieModel;
	}

	public void setPieModel(PieChartModel pieModel) {
		this.pieModel = pieModel;
	}
}
