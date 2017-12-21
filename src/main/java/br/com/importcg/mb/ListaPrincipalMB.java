package br.com.importcg.mb;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.PieChartModel;

import br.com.importcg.model.Pagamento;
import br.com.importcg.service.PagamentoService;
import br.com.importcg.service.PrincipalService;
import br.com.importcg.wrapper.BalancoWrapper;
import br.com.importcg.wrapper.CalculoMensalWrapper;

@Named
@ViewScoped
public class ListaPrincipalMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4650391850269131374L;
	
	@Inject
	private PrincipalService principalService;
	
	@Inject
	private PagamentoService pagamentoService;
	
	List<BalancoWrapper> mesAnterior = new ArrayList<>();
	
	List<BalancoWrapper> mesAtual = new ArrayList<>();
	
	List<BalancoWrapper> geral = new ArrayList<>();
	
	List<CalculoMensalWrapper> receber = new ArrayList<>();
	
	List<CalculoMensalWrapper> pagar = new ArrayList<>();

	private PieChartModel pieModelMesAnterior;
	
	private PieChartModel pieModelMesAtual;
	
	private PieChartModel pieModelGeral;
	
	private BarChartModel barModelBalanco;
	
	private BigDecimal valorReceber;
	
	private BigDecimal valorPagar;
	
	private BigDecimal saldoMensalAnterior;
	
	private BigDecimal saldoMensalAtual;
	
	private BigDecimal saldoMensalGeral;
	
	@PostConstruct
	public void inicializar() {
		mesAnterior = principalService.buscarBalancoMesAnterior();
		mesAtual = principalService.buscarBalancoMesAtual();
		geral = principalService.buscarBalancoGeral();
		
		receber = principalService.buscarValoresAReceber();
		pagar = principalService.buscarValoresAPagar();
		
		this.createPieModelMesAnterior();
		this.createPieModelMesAtual();
		this.createPieModelGeral();
		this.createBarModelBalanco();
	}
	
	public void emitirAvisos() {
		this.pagamentosAReceberCliente();
		this.pagamentosAReceberPagSeguro();
	}
	
	private void pagamentosAReceberCliente() {
		List<Pagamento> pagamentos = new ArrayList<>();
		pagamentos = pagamentoService.buscarRecebimentosDiarioCliente();
		
		for (Pagamento pagamento : pagamentos) {
			FacesContext context = FacesContext.getCurrentInstance();
			context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Pagamento a Receber!", "Há um pagamento para a ser realizado na data de hoje no valor de R$ " + pagamento.getValor() + " em nome de " + pagamento.getNomePagante() + "."));
		}
	}
	
	private void pagamentosAReceberPagSeguro() {
		List<Pagamento> pagamentos = new ArrayList<>();
		pagamentos = pagamentoService.buscarRecebimentosDiarioPagSeguro();
		
		for (Pagamento pagamento : pagamentos) {
			FacesContext context = FacesContext.getCurrentInstance();
			context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Crédito Liberado!", "Crédito PagSeguro liberado na data de hoje no valor de R$ " + pagamento.getSaldo() + " referente a compra em nome de " + pagamento.getNomePagante() + "."));
		}
	}

	private void createPieModelMesAnterior() {
		pieModelMesAnterior = new PieChartModel();
    	
    		pieModelMesAnterior = this.montarPieChartModel(pieModelMesAnterior, mesAnterior, "mesAnterior");
        
		NumberFormat nf = NumberFormat.getCurrencyInstance();
        pieModelMesAnterior.setTitle("Mês Anterior -> R - (P + D) = " + nf.format(saldoMensalAnterior));
        pieModelMesAnterior.setLegendPosition("w");
        pieModelMesAnterior.setShowDataLabels(true);
        pieModelMesAnterior.setSeriesColors("93ABCD,2758BA,FFCC33,58BA27,F74A4A"); //vermelho: F74A4A verde:58BA27 amarelo:FFCC33 azul:2758BA azul claro:93ABCD
    }
	
    private void createPieModelMesAtual() {
    		pieModelMesAtual = new PieChartModel();
    	
		pieModelMesAtual = this.montarPieChartModel(pieModelMesAtual, mesAtual, "mesAtual");
        
		NumberFormat nf = NumberFormat.getCurrencyInstance();
        pieModelMesAtual.setTitle("Mês Atual -> R - (P + D) = " + nf.format(saldoMensalAtual));
        pieModelMesAtual.setLegendPosition("w");
        pieModelMesAtual.setShowDataLabels(true);
        pieModelMesAtual.setSeriesColors("93ABCD,2758BA,FFCC33,58BA27,F74A4A"); //vermelho: F74A4A verde:58BA27 amarelo:FFCC33 azul:2758BA azul claro:93ABCD
    }
    
    private void createPieModelGeral() {
    		pieModelGeral = new PieChartModel();
    	
    		pieModelGeral = this.montarPieChartModel(pieModelGeral, geral, "geral");
        
    		NumberFormat nf = NumberFormat.getCurrencyInstance();
        pieModelGeral.setTitle("Geral -> R - (P + D) = " + nf.format(saldoMensalGeral));
        pieModelGeral.setLegendPosition("w");
        pieModelGeral.setShowDataLabels(true); 
        pieModelGeral.setSeriesColors("93ABCD,2758BA,FFCC33,58BA27,F74A4A"); //vermelho: F74A4A verde:58BA27 amarelo:FFCC33 azul:2758BA azul claro:93ABCD
    }
    
	private PieChartModel montarPieChartModel(PieChartModel pieModel, List<BalancoWrapper> lista, String referencia) {
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		
        for (BalancoWrapper item : lista) {
        	String entrada  = (item.getValoresEntrada() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresEntrada()));
        	String pago     = (item.getValoresPago() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresPago()));
        	String saida    = (item.getValoresSaida() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresSaida()));
        	String recebido = (item.getValoresRecebido() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresRecebido()));
        	String despesa  = (item.getValoresDespesa() == null ? nf.format(new BigDecimal(0)) : nf.format(item.getValoresDespesa()));
        	
        	BigDecimal saldo = (item.getValoresRecebido() == null ? new BigDecimal(0) : item.getValoresRecebido()).
        			subtract((item.getValoresPago() == null ? new BigDecimal(0) : item.getValoresPago()).
        					add((item.getValoresDespesa() == null ? new BigDecimal(0) : item.getValoresDespesa())));
        	
        	if ("mesAnterior".equals(referencia))
        		saldoMensalAnterior =  saldo;
        	if ("mesAtual".equals(referencia))
        		saldoMensalAtual = saldo;
        	if ("geral".equals(referencia))
        		saldoMensalGeral = saldo;
        	
        	pieModel.set("Comprado:  " + entrada, (item.getValoresEntrada() == null ? new BigDecimal(0) : item.getValoresEntrada()));
        	pieModel.set("Pago:  " + pago, (item.getValoresPago() == null ? new BigDecimal(0) : item.getValoresPago()));
        	pieModel.set("Vendido:   " + saida, item.getValoresSaida() == null ? new BigDecimal(0) : item.getValoresSaida());
        	pieModel.set("Recebido: " + recebido, item.getValoresRecebido() == null ? new BigDecimal(0) : item.getValoresRecebido());
        	pieModel.set("Despesas: " + despesa, item.getValoresDespesa() == null ? new BigDecimal(0) : item.getValoresDespesa());
        }
        
        return pieModel;
	}
	
	private void createBarModelBalanco() {
		barModelBalanco = initBarModelBalanco();
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		barModelBalanco.setTitle("Total a Receber: " + nf.format(valorReceber) + " / " + "Total a Pagar: " + nf.format(valorPagar));
		barModelBalanco.setLegendPosition("ne");
         
        Axis xAxis = barModelBalanco.getAxis(AxisType.X);
        xAxis.setLabel("Meses");
         
        Axis yAxis = barModelBalanco.getAxis(AxisType.Y);
        yAxis.setLabel("Valores");
        yAxis.setMin(0);
        yAxis.setMax(10000);
	}	
	
	private BarChartModel initBarModelBalanco() {
		BarChartModel model = new BarChartModel();
		
		ChartSeries receber = new ChartSeries();
		receber.setLabel("A Receber");
		
        for (CalculoMensalWrapper item : this.receber) {
        	receber.set(this.formatarData(0), (item.getValoresMesAtual() == null ? new BigDecimal(0) : item.getValoresMesAtual()));
        	receber.set(this.formatarData(1), item.getValoresProximoMes1() == null ? new BigDecimal(0) : item.getValoresProximoMes1());
        	receber.set(this.formatarData(2), item.getValoresProximoMes2() == null ? new BigDecimal(0) : item.getValoresProximoMes2());
        	receber.set(this.formatarData(3), item.getValoresProximoMes3() == null ? new BigDecimal(0) : item.getValoresProximoMes3());
        	
        	valorReceber = item.getValoresTodosMeses() == null ? new BigDecimal(0) : item.getValoresTodosMeses();
        }
        
        model.addSeries(receber);
        
		ChartSeries pagar = new ChartSeries();
		pagar.setLabel("A Pagar");
		
       for (CalculoMensalWrapper item : this.pagar) {
        	pagar.set(this.formatarData(0), (item.getValoresMesAtual() == null ? new BigDecimal(0) : item.getValoresMesAtual()));
        	pagar.set(this.formatarData(1), item.getValoresProximoMes1() == null ? new BigDecimal(0) : item.getValoresProximoMes1());
        	pagar.set(this.formatarData(2), item.getValoresProximoMes2() == null ? new BigDecimal(0) : item.getValoresProximoMes2());
        	pagar.set(this.formatarData(3), item.getValoresProximoMes3() == null ? new BigDecimal(0) : item.getValoresProximoMes3());
        	
        	valorPagar = item.getValoresTodosMeses() == null ? new BigDecimal(0) : item.getValoresTodosMeses();
        }
        
        model.addSeries(pagar);
        
        return model;
	}
    
    private String formatarData(int mes) {
        Calendar c = Calendar.getInstance();
        
        c.setTime(new Date());
        c.add(Calendar.MONTH, mes);
         
        DateFormat df = new SimpleDateFormat("MMMM 'de' yyyy");
        
        return df.format(c.getTime());
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
	
	public List<CalculoMensalWrapper> getReceber() {
		return receber;
	}

	public void setReceber(List<CalculoMensalWrapper> receber) {
		this.receber = receber;
	}
	
	public List<CalculoMensalWrapper> getPagar() {
		return pagar;
	}

	public void setPagar(List<CalculoMensalWrapper> pagar) {
		this.pagar = pagar;
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

	public BarChartModel getBarModelBalanco() {
		return barModelBalanco;
	}

	public void setBarModelBalanco(BarChartModel barModelBalanco) {
		this.barModelBalanco = barModelBalanco;
	}

	public BigDecimal getValorReceber() {
		return valorReceber;
	}

	public void setValorReceber(BigDecimal valorReceber) {
		this.valorReceber = valorReceber;
	}

	public BigDecimal getValorPagar() {
		return valorPagar;
	}

	public void setValorPagar(BigDecimal valorPagar) {
		this.valorPagar = valorPagar;
	}

	public BigDecimal getSaldoMensalAnterior() {
		return saldoMensalAnterior;
	}

	public void setSaldoMensalAnterior(BigDecimal saldoMensalAnterior) {
		this.saldoMensalAnterior = saldoMensalAnterior;
	}

	public BigDecimal getSaldoMensalAtual() {
		return saldoMensalAtual;
	}

	public void setSaldoMensalAtual(BigDecimal saldoMensalAtual) {
		this.saldoMensalAtual = saldoMensalAtual;
	}

	public BigDecimal getSaldoMensalGeral() {
		return saldoMensalGeral;
	}

	public void setSaldoMensalGeral(BigDecimal saldoMensalGeral) {
		this.saldoMensalGeral = saldoMensalGeral;
	}
}
