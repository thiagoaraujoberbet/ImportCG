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

import br.com.importcg.service.PrincipalService;
import br.com.importcg.wrapper.BalancoWrapper;

@Named
@ViewScoped
public class ListaPrincipalMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4650391850269131374L;
	
	@Inject
	private PrincipalService principalService;
	
	List<BalancoWrapper> mesAnterior = new ArrayList<>();
	
	List<BalancoWrapper> mesAtual = new ArrayList<>();
	
	List<BalancoWrapper> geral = new ArrayList<>();

	private PieChartModel pieModelMesAnterior;
	
	private PieChartModel pieModelMesAtual;
	
	private PieChartModel pieModelGeral;
	
	@PostConstruct
	public void inicializar() {
		mesAnterior = principalService.buscarBalancoMesAnterior();
		mesAtual = principalService.buscarBalancoMesAtual();
		geral = principalService.buscarBalancoGeral();
		
		this.createPieModelMesAnterior();
		this.createPieModelMesAtual();
		this.createPieModelGeral();
	}
	
    private void createPieModelMesAnterior() {
    	pieModelMesAnterior = new PieChartModel();
    	
		NumberFormat nf = NumberFormat.getCurrencyInstance();
       
        for (BalancoWrapper item : mesAnterior) {
        	String entrada  = (item.getValoresEntrada() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresEntrada()));
        	String saida    = (item.getValoresSaida() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresSaida()));
        	String recebido = (item.getValoresRecebido() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresRecebido()));
        	
        	pieModelMesAnterior.set("Entradas: " + entrada, (item.getValoresEntrada() == null ? new BigDecimal(0) : item.getValoresEntrada()));
        	pieModelMesAnterior.set("Saidas  : " + saida, item.getValoresSaida() == null ? new BigDecimal(0) : item.getValoresSaida());
        	pieModelMesAnterior.set("Recebido: " + recebido, item.getValoresRecebido() == null ? new BigDecimal(0) : item.getValoresRecebido());
        }
        
        pieModelMesAnterior.setTitle("Mês Anterior");
        pieModelMesAnterior.setLegendPosition("w");
        pieModelMesAnterior.setShowDataLabels(true);
        pieModelMesAnterior.setSeriesColors("93ABCD,FFCC33,58BA27");  //vermelho: F74A4A verde:58BA27 amarelo:FFCC33 azul:2758BA azul claro:93ABCD
    }
    
    private void createPieModelMesAtual() {
    	pieModelMesAtual = new PieChartModel();
    	
    	NumberFormat nf = NumberFormat.getCurrencyInstance();
       
        for (BalancoWrapper item : mesAtual) {
        	String entrada  = (item.getValoresEntrada() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresEntrada()));
        	String saida    = (item.getValoresSaida() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresSaida()));
        	String recebido = (item.getValoresRecebido() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresRecebido()));
        	
        	pieModelMesAtual.set("Entradas: " + entrada, (item.getValoresEntrada() == null ? new BigDecimal(0) : item.getValoresEntrada()));
        	pieModelMesAtual.set("Saidas  : " + saida, item.getValoresSaida() == null ? new BigDecimal(0) : item.getValoresSaida());
        	pieModelMesAtual.set("Recebido: " + recebido, item.getValoresRecebido() == null ? new BigDecimal(0) : item.getValoresRecebido());
        }
        
        pieModelMesAtual.setTitle("Mês Atual");
        pieModelMesAtual.setLegendPosition("w");
        pieModelMesAtual.setShowDataLabels(true);
        pieModelMesAtual.setSeriesColors("93ABCD,FFCC33,58BA27"); //vermelho: F74A4A verde:58BA27 amarelo:FFCC33 azul:2758BA azul claro:93ABCD
    }
    
    private void createPieModelGeral() {
    	pieModelGeral = new PieChartModel();
    	
    	NumberFormat nf = NumberFormat.getCurrencyInstance();
       
        for (BalancoWrapper item : geral) {
        	String entrada  = (item.getValoresEntrada() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresEntrada()));
        	String saida    = (item.getValoresSaida() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresSaida()));
        	String recebido = (item.getValoresRecebido() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresRecebido()));
        	
        	pieModelGeral.set("Entradas: " + entrada, (item.getValoresEntrada() == null ? new BigDecimal(0) : item.getValoresEntrada()));
        	pieModelGeral.set("Saidas  : " + saida, item.getValoresSaida() == null ? new BigDecimal(0) : item.getValoresSaida());
        	pieModelGeral.set("Recebido: " + recebido, item.getValoresRecebido() == null ? new BigDecimal(0) : item.getValoresRecebido());
        }
        
        pieModelGeral.setTitle("Geral");
        pieModelGeral.setLegendPosition("w");
        pieModelGeral.setShowDataLabels(true); 
        pieModelGeral.setSeriesColors("93ABCD,FFCC33,58BA27"); //vermelho: F74A4A verde:58BA27 amarelo:FFCC33 azul:2758BA azul claro:93ABCD
    }

	public List<BalancoWrapper> getMesAnterior() {
		return mesAnterior;
	}

	public void setMesAnterior(List<BalancoWrapper> mesAnterior) {
		this.mesAnterior = mesAnterior;
	}

	public List<BalancoWrapper> getMesAtual() {
		return mesAtual;
	}

	public void setMesAtual(List<BalancoWrapper> mesAtual) {
		this.mesAtual = mesAtual;
	}

	public List<BalancoWrapper> getGeral() {
		return geral;
	}

	public void setGeral(List<BalancoWrapper> geral) {
		this.geral = geral;
	}

	public PieChartModel getPieModelMesAnterior() {
		return pieModelMesAnterior;
	}

	public void setPieModelMesAnterior(PieChartModel pieModelMesAnterior) {
		this.pieModelMesAnterior = pieModelMesAnterior;
	}

	public PieChartModel getPieModelMesAtual() {
		return pieModelMesAtual;
	}

	public void setPieModelMesAtual(PieChartModel pieModelMesAtual) {
		this.pieModelMesAtual = pieModelMesAtual;
	}

	public PieChartModel getPieModelGeral() {
		return pieModelGeral;
	}

	public void setPieModelGeral(PieChartModel pieModelGeral) {
		this.pieModelGeral = pieModelGeral;
	}
	
}
