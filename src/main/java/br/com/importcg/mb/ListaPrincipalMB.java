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

import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.PieChartModel;

import br.com.importcg.service.PrincipalService;
import br.com.importcg.wrapper.AReceberWrapper;
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
	
	List<AReceberWrapper> receber = new ArrayList<>();

	private PieChartModel pieModelMesAnterior;
	
	private PieChartModel pieModelMesAtual;
	
	private PieChartModel pieModelGeral;
	
	private PieChartModel pieModelAReceber;
	
	private BarChartModel barModelBalanco;
	
	@PostConstruct
	public void inicializar() {
		mesAnterior = principalService.buscarBalancoMesAnterior();
		mesAtual = principalService.buscarBalancoMesAtual();
		geral = principalService.buscarBalancoGeral();
		
		receber = principalService.buscarValoresAReceber();
		
		this.createBarModelBalanco();
		
		this.createPieModelMesAnterior();
		this.createPieModelMesAtual();
		this.createPieModelGeral();
		
		this.createPieModelAReceber();
	}
	
	private void createBarModelBalanco() {
		barModelBalanco = initBarModelBalanco();
		
		barModelBalanco.setTitle("Bar Chart");
		barModelBalanco.setLegendPosition("ne");
         
        Axis xAxis = barModelBalanco.getAxis(AxisType.X);
        xAxis.setLabel("Meses");
         
        Axis yAxis = barModelBalanco.getAxis(AxisType.Y);
        yAxis.setLabel("Valores");
        yAxis.setMin(0);
        yAxis.setMax(100000);
	}

	private BarChartModel initBarModelBalanco() {
		BarChartModel model = new BarChartModel();
		
		ChartSeries mesAnterior = new ChartSeries();
		mesAnterior.setLabel("Mês Anterior");
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
	       
        for (BalancoWrapper item : this.mesAnterior) {
        	String entrada  = (item.getValoresEntrada() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresEntrada()));
        	String saida    = (item.getValoresSaida() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresSaida()));
        	String recebido = (item.getValoresRecebido() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresRecebido()));
        	
        	mesAnterior.set("Entradas: " + entrada, (item.getValoresEntrada() == null ? new BigDecimal(0) : item.getValoresEntrada()));
        	mesAnterior.set("Saidas  : " + saida, item.getValoresSaida() == null ? new BigDecimal(0) : item.getValoresSaida());
        	mesAnterior.set("Recebido: " + recebido, item.getValoresRecebido() == null ? new BigDecimal(0) : item.getValoresRecebido());
        }
        
        model.addSeries(mesAnterior);
        
		ChartSeries mesAtual = new ChartSeries();
		mesAtual.setLabel("Mês Atual");
		
		nf = NumberFormat.getCurrencyInstance();
	       
        for (BalancoWrapper item : this.mesAtual) {
        	String entrada  = (item.getValoresEntrada() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresEntrada()));
        	String saida    = (item.getValoresSaida() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresSaida()));
        	String recebido = (item.getValoresRecebido() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresRecebido()));
        	
        	mesAtual.set("Entradas: " + entrada, (item.getValoresEntrada() == null ? new BigDecimal(0) : item.getValoresEntrada()));
        	mesAtual.set("Saidas  : " + saida, item.getValoresSaida() == null ? new BigDecimal(0) : item.getValoresSaida());
        	mesAtual.set("Recebido: " + recebido, item.getValoresRecebido() == null ? new BigDecimal(0) : item.getValoresRecebido());
        }
        
        model.addSeries(mesAtual);
        
		ChartSeries geral = new ChartSeries();
		geral.setLabel("Geral");
		
		nf = NumberFormat.getCurrencyInstance();
	       
        for (BalancoWrapper item : this.geral) {
        	String entrada  = (item.getValoresEntrada() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresEntrada()));
        	String saida    = (item.getValoresSaida() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresSaida()));
        	String recebido = (item.getValoresRecebido() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresRecebido()));
        	
        	geral.set("Entradas: " + entrada, (item.getValoresEntrada() == null ? new BigDecimal(0) : item.getValoresEntrada()));
        	geral.set("Saidas  : " + saida, item.getValoresSaida() == null ? new BigDecimal(0) : item.getValoresSaida());
        	geral.set("Recebido: " + recebido, item.getValoresRecebido() == null ? new BigDecimal(0) : item.getValoresRecebido());
        }
        
        model.addSeries(geral);
        
        return model;
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
    
    private void createPieModelAReceber() {
    	pieModelAReceber = new PieChartModel();
    	
    	NumberFormat nf = NumberFormat.getCurrencyInstance();
       
        for (AReceberWrapper item : receber) {
        	String aReceberMesAtual   = (item.getValoresAReceberMesAtual() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresAReceberMesAtual()));
        	String aReceberProximoMes = (item.getValoresAReceberProximoMes() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresAReceberProximoMes()));
        	String aReceberTodosMeses = (item.getValoresAReceberTodosMeses() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresAReceberTodosMeses()));
        	
        	pieModelAReceber.set("Mês Atual: " + aReceberMesAtual, (item.getValoresAReceberMesAtual() == null ? new BigDecimal(0) : item.getValoresAReceberMesAtual()));
        	pieModelAReceber.set("Proximo Mês: " + aReceberProximoMes, item.getValoresAReceberProximoMes() == null ? new BigDecimal(0) : item.getValoresAReceberProximoMes());
        	pieModelAReceber.set("Todos os Meses: " + aReceberTodosMeses, item.getValoresAReceberTodosMeses() == null ? new BigDecimal(0) : item.getValoresAReceberTodosMeses());
        }
        
        pieModelAReceber.setTitle("Valores a Receber");
        pieModelAReceber.setLegendPosition("w");
        pieModelAReceber.setShowDataLabels(true); 
        pieModelAReceber.setSeriesColors("93ABCD,FFCC33,58BA27"); //vermelho: F74A4A verde:58BA27 amarelo:FFCC33 azul:2758BA azul claro:93ABCD
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
	
	public List<AReceberWrapper> getReceber() {
		return receber;
	}

	public void setReceber(List<AReceberWrapper> receber) {
		this.receber = receber;
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

	public PieChartModel getPieModelAReceber() {
		return pieModelAReceber;
	}

	public void setPieModelAReceber(PieChartModel pieModelAReceber) {
		this.pieModelAReceber = pieModelAReceber;
	}

	public BarChartModel getBarModelBalanco() {
		return barModelBalanco;
	}

	public void setBarModelBalanco(BarChartModel barModelBalanco) {
		this.barModelBalanco = barModelBalanco;
	}
	
}
