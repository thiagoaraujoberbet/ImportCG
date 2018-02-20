package br.com.importcg.mb;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;

import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.CategoryAxis;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.LineChartSeries;
import org.primefaces.model.chart.PieChartModel;

import br.com.importcg.model.ItemBaixa;
import br.com.importcg.model.Pagamento;
import br.com.importcg.model.Usuario;
import br.com.importcg.service.CaixaService;
import br.com.importcg.service.ItemBaixaService;
import br.com.importcg.service.PagamentoService;
import br.com.importcg.service.PrincipalService;
import br.com.importcg.wrapper.BalancoMensalWrapper;
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
	
	@Inject
	private ItemBaixaService itemBaixaService;
	
	@Inject
	private CaixaService caixaService;
	
	/* ***************** Gráfico Pie Mensal ******************************************* */
	private List<BalancoWrapper> mesAnterior = new ArrayList<>();
	private List<BalancoWrapper> mesAtual = new ArrayList<>();
	private List<BalancoWrapper> geral = new ArrayList<>();
	private PieChartModel pieModelMesAnterior;
	private PieChartModel pieModelMesAtual;
	private PieChartModel pieModelGeral;
	private BigDecimal saldoMensalAnterior;
	private BigDecimal saldoMensalAtual;
	private BigDecimal saldoMensalGeral;
	
	/* ***************** Gráfico Bar de Balanço **************************************** */
	private List<CalculoMensalWrapper> receber = new ArrayList<>();
	private List<CalculoMensalWrapper> pagar = new ArrayList<>();
	private BarChartModel barModelBalanco;
	private BigDecimal valorReceber;
	private BigDecimal valorPagar;
	
	/* ***************** Gráfico Pie de Cheque Emitidos ******************************** */
	private List<ItemBaixa> cheques = new ArrayList<>();
	private PieChartModel pieModelChequesEmitidos;
	
	/* ***************** Gráfico Line de Balanço Mensal ******************************** */
	private List<BalancoMensalWrapper> entradas = new ArrayList<>();
	private List<BalancoMensalWrapper> saidas = new ArrayList<>();
	private List<BalancoMensalWrapper> recebidos = new ArrayList<>();
	private List<BalancoMensalWrapper> despesas = new ArrayList<>();
	private List<BalancoMensalWrapper> pagos = new ArrayList<>();
	private LineChartModel lineModelBalanco;
	
	/* ********************************************************************************** */
	/* ********************************************************************************** */
	
	@PostConstruct
	public void inicializar() {
		this.inicializarGraficoPieMensal();
		this.inicializarGraficoPieCheques();
		this.inicializarGraficoBarBalanco();
		this.inicializarGraficoLineBalancoMensal();
	}
	
	public Usuario usuarioLogado() {
		FacesContext facesContext = FacesContext.getCurrentInstance(); 
		HttpSession session = (HttpSession) facesContext.getExternalContext().getSession(false);
		
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		
		return usuario;
	}

	/* ************************* Inicialização dos Componentes ************************** */
	/* ********************************************************************************** */
	
	private void inicializarGraficoBarBalanco() {
		receber = principalService.buscarValoresAReceber();
		pagar = principalService.buscarValoresAPagar();
		
		this.createBarModelBalanco();
	}
	
	private void inicializarGraficoPieMensal() {
		mesAnterior = principalService.buscarBalancoMesAnterior();
		mesAtual = principalService.buscarBalancoMesAtual();
		geral = principalService.buscarBalancoGeral();
		
		this.createPieModelMesAnterior();
		this.createPieModelMesAtual();
		this.createPieModelGeral();
	}
	
	private void inicializarGraficoPieCheques() {
		cheques = itemBaixaService.buscarChequesEmitidos();
		
		this.createPieModelChequesEmitidos();
	}
	
	private void inicializarGraficoLineBalancoMensal() {
		entradas = principalService.buscarEntradaPorMes();
		saidas = principalService.buscarSaidasPorMes();
		recebidos = principalService.buscarRecebidosPorMes();
		despesas = principalService.buscarDespesasPorMes();
		pagos = principalService.buscarPagosPorMes();
		
		this.createLineModelsBalanco();
	}
	
	/* ********************************************************************************** */
	
	/* ********************************* Métodos Uteis ********************************** */
	/* ********************************************************************************** */
	
	private int retornarMes(Date data) {
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.setTime(data);
		
		return calendar.get(GregorianCalendar.MONTH);
	}
	
    private String formatarData(int mes) {
        Calendar c = Calendar.getInstance();
        
        c.setTime(new Date());
        c.add(Calendar.MONTH, mes);
         
        DateFormat df = new SimpleDateFormat("MMMM 'de' yyyy");
        
        return df.format(c.getTime());
    }
	
	/* ********************************************************************************** */
    
	/* ************************************* Dashboard ********************************** */
    /* ********************************************************************************** */
    
    public BigDecimal buscarValorEmCaixa() {
    	return caixaService.obterSaldoTotalCaixa();
    }
    
    public BigDecimal buscarValorAReceber() {
    	return pagamentoService.obterSaldoTotalAReceber();
    }
    
    public BigDecimal buscarValorAPagar() {
    	return itemBaixaService.obterSaldoTotalAPagar();
    }
    
    /* ********************************************************************************** */
	
	/* ************************************* Avisos ************************************* */
    /* ********************************************************************************** */
	
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
	
	 /* ********************************************************************************** */

	/* ******************************** Gráfico Pie Mensal ******************************* */
	/* ********************************************************************************** */
	
	private void createPieModelMesAnterior() {
		pieModelMesAnterior = new PieChartModel();
    	
		pieModelMesAnterior = this.montarPieChartModel(pieModelMesAnterior, mesAnterior, "mesAnterior");
        
		NumberFormat nf = NumberFormat.getCurrencyInstance();
        pieModelMesAnterior.setTitle("Mês Anterior = " + nf.format(saldoMensalAnterior)); //R - (P + D)
        pieModelMesAnterior.setLegendPosition("w");
        pieModelMesAnterior.setShowDataLabels(true);
        pieModelMesAnterior.setSeriesColors("93ABCD,2758BA,FFCC33,58BA27,F74A4A"); //vermelho: F74A4A verde:58BA27 amarelo:FFCC33 azul:2758BA azul claro:93ABCD
    }
	
    private void createPieModelMesAtual() {
		pieModelMesAtual = new PieChartModel();
    	
		pieModelMesAtual = this.montarPieChartModel(pieModelMesAtual, mesAtual, "mesAtual");
        
		NumberFormat nf = NumberFormat.getCurrencyInstance();
        pieModelMesAtual.setTitle("Mês Atual = " + nf.format(saldoMensalAtual)); //R - (P + D)
        pieModelMesAtual.setLegendPosition("w");
        pieModelMesAtual.setShowDataLabels(true);
        pieModelMesAtual.setSeriesColors("93ABCD,2758BA,FFCC33,58BA27,F74A4A"); //vermelho: F74A4A verde:58BA27 amarelo:FFCC33 azul:2758BA azul claro:93ABCD
    }
    
    private void createPieModelGeral() {
		pieModelGeral = new PieChartModel();
    	
    	pieModelGeral = this.montarPieChartModel(pieModelGeral, geral, "geral");
        
    	NumberFormat nf = NumberFormat.getCurrencyInstance();
        pieModelGeral.setTitle("Geral = " + nf.format(saldoMensalGeral)); // R - (P + D)
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
    
    /* ********************************************************************************** */
    
    /* ******************************* Gráfico Pie de Cheques Emitidos ****************** */
	/* ********************************************************************************** */
    
	private void createPieModelChequesEmitidos() {
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		pieModelChequesEmitidos = new PieChartModel();

		BigDecimal totalGeral = new BigDecimal("0");
		BigDecimal totalMensal = new BigDecimal("0");
		int mesAtual = retornarMes(new Date());
		
        for (ItemBaixa item : cheques) {
			int mes = retornarMes(item.getData());
			
			totalGeral = totalGeral.add(item.getValor());
			
			if (mesAtual == mes) {
				totalMensal = totalMensal.add(item.getValor());
				
				SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
				pieModelChequesEmitidos.set(formato.format(item.getData()) + " - " + item.getDescricao(), item.getValor());
			}
        }
        
        pieModelChequesEmitidos.setTitle("Cheques a compensar neste mês: " + nf.format(totalMensal) + " de um total de " + nf.format(totalGeral));
        pieModelChequesEmitidos.setLegendPosition("w");
        pieModelChequesEmitidos.setShowDataLabels(true);
        pieModelChequesEmitidos.setDiameter(300);
	}
	
	/* ********************************************************************************** */
    
	/* ***************************** Gráfico Bar de Balanço ***************************** */
	/* ********************************************************************************** */
	
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
        yAxis.setMax(15000);
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
    
    /* ********************************************************************************** */
    
    /* ************************* Gráfico Line de Balanço Mensal ************************* */
	/* ********************************************************************************** */
    
	private void createLineModelsBalanco() {
		lineModelBalanco = initLinearModelBalanco();
		lineModelBalanco.setTitle("Balanço Mensal");
		lineModelBalanco.setLegendPosition("e");
		lineModelBalanco.setShowPointLabels(true);
		lineModelBalanco.setSeriesColors("93ABCD,2758BA,FFCC33,58BA27,F74A4A"); //vermelho: F74A4A verde:58BA27 amarelo:FFCC33 azul:2758BA azul claro:93ABCD
		lineModelBalanco.getAxes().put(AxisType.X, new CategoryAxis("Mês/Ano"));
        Axis yAxis = lineModelBalanco.getAxis(AxisType.Y);
        yAxis = lineModelBalanco.getAxis(AxisType.Y);
        yAxis.setLabel("Valor");
        yAxis.setMin(0);
        yAxis.setMax(30000);
	}
    
	private LineChartModel initLinearModelBalanco() {
        LineChartModel model = new LineChartModel();
        
        model.addSeries(montarEntrada());
        model.addSeries(montarPago());
        model.addSeries(montarSaidas());
        model.addSeries(montarRecebido());
        model.addSeries(montarDespesa());
         
        return model;
	}
	
	private LineChartSeries montarEntrada() {
        LineChartSeries entrada = new LineChartSeries();
        entrada.setLabel("Comprado");
 
        for (BalancoMensalWrapper item : entradas) {
        	entrada.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getValor());
		}
        
        return entrada;
	}
	
	private LineChartSeries montarSaidas() {
       LineChartSeries saida = new LineChartSeries();
        saida.setLabel("Vendido");
 
        for (BalancoMensalWrapper item : saidas) {
        	saida.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getValor());
		}
        
        return saida;
	}
	
	private LineChartSeries montarRecebido() {
        LineChartSeries recebido = new LineChartSeries();
        recebido.setLabel("Recebido");
 
        for (BalancoMensalWrapper item : recebidos) {
        	recebido.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getValor());
		}
        
        return recebido;
	}
	
	private LineChartSeries montarDespesa() {
        LineChartSeries despesa = new LineChartSeries();
        despesa.setLabel("Despesas");
 
        for (BalancoMensalWrapper item : despesas) {
        	despesa.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getValor());
		}
        
        return despesa;
	}
	
	private LineChartSeries montarPago() {
        LineChartSeries pago = new LineChartSeries();
        pago.setLabel("Pago");
 
        for (BalancoMensalWrapper item : pagos) {
        	pago.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getValor());
		}
        
        return pago;
	}
	
	private String retornarMesPorExtenso(int mes) {
		switch (mes) {
		case 1:
		    return "Janeiro";
		case 2:
			return "fevereiro";
		case 3:
			return "Março";
		case 4:
			return "Abril";
		case 5:
			return "Maio";
		case 6:
			return "Junho";
		case 7:
			return "Julho";
		case 8:
			return "Agosto";
		case 9:
			return "Setembro";
		case 10:
			return "Outubro";
		case 11:
			return "Novembro";
		case 12:
			return "Dezembro";
		default:
			return null;
		 }
	}
	
	/* ********************************************************************************** */
	
    /* ************************* Gráfico Meter de Record de Vendas ********************** */
	/* ********************************************************************************** 
	
    private void createMeterGaugeModels() {
    	meterRecordVendas = initMeterGaugeModel();
    	meterRecordVendas.setTitle("Custom Options");
    	meterRecordVendas.setGaugeLabel("R$");
    	meterRecordVendas.setGaugeLabelPosition("bottom");
    }
    
    @SuppressWarnings("serial")
	private MeterGaugeChartModel initMeterGaugeModel() {
    	BigDecimal valor = principalService.buscarRecordVendas();
    	
        List<Number> intervals = new ArrayList<Number>(){{
        	add(new BigInteger(valor.divide(new BigDecimal("4")).setScale(0, RoundingMode.HALF_EVEN).toString()));
            add(new BigInteger(valor.divide(new BigDecimal("3")).setScale(0, RoundingMode.HALF_EVEN).toString()));
            add(new BigInteger(valor.divide(new BigDecimal("4")).setScale(0, RoundingMode.HALF_EVEN).toString()));
            add(new BigInteger(valor.setScale(0, RoundingMode.HALF_EVEN).toString()));
        }};
         
        return new MeterGaugeChartModel(mesAtual.get(0).getValoresSaida(), intervals);
    }
    
    /* ********************************************************************************** */

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

	public List<ItemBaixa> getCheques() {
		return cheques;
	}

	public void setCheques(List<ItemBaixa> cheques) {
		this.cheques = cheques;
	}

	public List<BalancoMensalWrapper> getEntradas() {
		return entradas;
	}

	public void setEntradas(List<BalancoMensalWrapper> entradas) {
		this.entradas = entradas;
	}

	public List<BalancoMensalWrapper> getSaidas() {
		return saidas;
	}

	public void setSaidas(List<BalancoMensalWrapper> saidas) {
		this.saidas = saidas;
	}

	public List<BalancoMensalWrapper> getRecebidos() {
		return recebidos;
	}

	public void setRecebidos(List<BalancoMensalWrapper> recebidos) {
		this.recebidos = recebidos;
	}

	public List<BalancoMensalWrapper> getDespesas() {
		return despesas;
	}

	public void setDespesas(List<BalancoMensalWrapper> despesas) {
		this.despesas = despesas;
	}

	public List<BalancoMensalWrapper> getPagos() {
		return pagos;
	}

	public void setPagos(List<BalancoMensalWrapper> pagos) {
		this.pagos = pagos;
	}

	public LineChartModel getLineModelBalanco() {
		return lineModelBalanco;
	}

	public void setLineModelBalanco(LineChartModel lineModelBalanco) {
		this.lineModelBalanco = lineModelBalanco;
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

	public PieChartModel getPieModelChequesEmitidos() {
		return pieModelChequesEmitidos;
	}

	public void setPieModelChequesEmitidos(PieChartModel pieModelChequesEmitidos) {
		this.pieModelChequesEmitidos = pieModelChequesEmitidos;
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
