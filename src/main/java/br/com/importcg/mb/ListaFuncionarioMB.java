package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.CategoryAxis;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.LineChartSeries;

import br.com.importcg.model.Pessoa;
import br.com.importcg.service.ItemVendaService;
import br.com.importcg.service.PessoaService;
import br.com.importcg.util.FacesUtil;
import br.com.importcg.wrapper.QuantidadeVendidaFuncionarioWrapper;
import br.com.importcg.wrapper.ValorVendidoFuncionarioWrapper;

@Named
@ViewScoped
public class ListaFuncionarioMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4893639490487028890L;

	@Inject
	private PessoaService pessoaService;
	
	@Inject
	private ItemVendaService itemVendaService;
	
	private List<Pessoa> funcionarios = new ArrayList<>();
	
	private List<Pessoa> funcionariosSelecionados = new ArrayList<>();
	
	private List<ValorVendidoFuncionarioWrapper> valorVendidoFuncionario1 = new ArrayList<>();
	
	private List<ValorVendidoFuncionarioWrapper> valorVendidoFuncionario2 = new ArrayList<>();
	
	private List<ValorVendidoFuncionarioWrapper> valorVendidoFuncionario3 = new ArrayList<>();
	
	private LineChartModel lineModelValor;
	
	private List<QuantidadeVendidaFuncionarioWrapper> quantidadeVendidaFuncionario1 = new ArrayList<>();
	
	private List<QuantidadeVendidaFuncionarioWrapper> quantidadeVendidaFuncionario2 = new ArrayList<>();
	
	private List<QuantidadeVendidaFuncionarioWrapper> quantidadeVendidaFuncionario3 = new ArrayList<>();
	
	private LineChartModel lineModelQuantidade;
	
	@PostConstruct
	public void inicializar() {
		funcionarios = pessoaService.buscarInformacoesFuncionario();
		
		valorVendidoFuncionario1 = itemVendaService.buscarValorVendidoFuncionario(3L);
		valorVendidoFuncionario2 = itemVendaService.buscarValorVendidoFuncionario(4L);
		valorVendidoFuncionario3 = itemVendaService.buscarValorVendidoFuncionario(33L);
		
		quantidadeVendidaFuncionario1 = itemVendaService.buscarQuantidadeVendidaFuncionario(3L);
		quantidadeVendidaFuncionario2 = itemVendaService.buscarQuantidadeVendidaFuncionario(4L);
		quantidadeVendidaFuncionario3 = itemVendaService.buscarQuantidadeVendidaFuncionario(33L);
		
		this.createLineModelsValor();
		this.createLineModelsQuantidade();
	}
	
	private void createLineModelsValor() {
		lineModelValor = initLinearModelValor();
		lineModelValor.setTitle("Vendas por Mês (Valor Vendido)");
		lineModelValor.setLegendPosition("e");
		lineModelValor.setShowPointLabels(true);
		lineModelValor.getAxes().put(AxisType.X, new CategoryAxis("Mês/Ano"));
        Axis yAxis = lineModelValor.getAxis(AxisType.Y);
        yAxis = lineModelValor.getAxis(AxisType.Y);
        yAxis.setLabel("Valor");
        yAxis.setMin(0);
        yAxis.setMax(30000);
	}

	private LineChartModel initLinearModelValor() {
        LineChartModel model = new LineChartModel();
        
        model.addSeries(montarFuncionario1());
        model.addSeries(montarFuncionario2());
        model.addSeries(montarFuncionario3());
         
        return model;
	}
	
	private LineChartSeries montarFuncionario1() {
        LineChartSeries funcionario1 = new LineChartSeries();
        funcionario1.setLabel("Thiago");
 
        for (ValorVendidoFuncionarioWrapper item : valorVendidoFuncionario1) {
        	funcionario1.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getValor());
		}
        
        return funcionario1;
	}
	
	private LineChartSeries montarFuncionario2() {
        LineChartSeries funcionario2 = new LineChartSeries();
        funcionario2.setLabel("Luana");
 
        for (ValorVendidoFuncionarioWrapper item : valorVendidoFuncionario2) {
        	funcionario2.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getValor());
		}
        
        return funcionario2;
	}
	
	private LineChartSeries montarFuncionario3() {
        LineChartSeries funcionario3 = new LineChartSeries();
        funcionario3.setLabel("Izabel");
 
        for (ValorVendidoFuncionarioWrapper item : valorVendidoFuncionario3) {
        	funcionario3.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getValor());
		}
        
        return funcionario3;
	}
	
	private void createLineModelsQuantidade() {
		lineModelQuantidade = initLinearModelQuantidade();
		lineModelQuantidade.setTitle("Vendas por Mês (Quantidade Vendida)");
		lineModelQuantidade.setLegendPosition("e");
		lineModelQuantidade.setShowPointLabels(true);
		lineModelQuantidade.getAxes().put(AxisType.X, new CategoryAxis("Mês/Ano"));
        Axis yAxis = lineModelQuantidade.getAxis(AxisType.Y);
        yAxis = lineModelQuantidade.getAxis(AxisType.Y);
        yAxis.setLabel("Quantidade");
        yAxis.setMin(0);
        yAxis.setMax(100);
	}

	private LineChartModel initLinearModelQuantidade() {
		LineChartModel model = new LineChartModel();
	        
        LineChartSeries funcionario1 = new LineChartSeries();
        funcionario1.setLabel("Thiago");
 
        for (QuantidadeVendidaFuncionarioWrapper item : quantidadeVendidaFuncionario1) {
        	funcionario1.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getQuantidade());
		}
        
        LineChartSeries funcionario2 = new LineChartSeries();
        funcionario2.setLabel("Luana");
 
        for (QuantidadeVendidaFuncionarioWrapper item : quantidadeVendidaFuncionario2) {
        	funcionario2.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getQuantidade());
		}
        
        LineChartSeries funcionario3 = new LineChartSeries();
        funcionario3.setLabel("Izabel");
 
        for (QuantidadeVendidaFuncionarioWrapper item : quantidadeVendidaFuncionario3) {
        	funcionario3.set(retornarMesPorExtenso(item.getMes()) + "/" + item.getAno(), item.getQuantidade());
		}
        
        model.addSeries(funcionario1);
        model.addSeries(funcionario2);
        model.addSeries(funcionario3);
         
        return model;
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

	public void excluirSelecionados() {
		for (Pessoa funcionario : funcionariosSelecionados) {
			pessoaService.excluir(funcionario);
			funcionarios.remove(funcionario);
		}
		
		FacesUtil.addInfoMessage("Funcionario(s) excluido(s) com sucesso!");
	}

	public List<Pessoa> getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(List<Pessoa> funcionarios) {
		this.funcionarios = funcionarios;
	}

	public List<Pessoa> getFuncionariosSelecionados() {
		return funcionariosSelecionados;
	}

	public void setFuncionariosSelecionados(List<Pessoa> funcionariosSelecionados) {
		this.funcionariosSelecionados = funcionariosSelecionados;
	}

	public List<ValorVendidoFuncionarioWrapper> getValorVendidoFuncionario1() {
		return valorVendidoFuncionario1;
	}

	public void setValorVendidoFuncionario1(List<ValorVendidoFuncionarioWrapper> valorVendidoFuncionario1) {
		this.valorVendidoFuncionario1 = valorVendidoFuncionario1;
	}

	public List<ValorVendidoFuncionarioWrapper> getValorVendidoFuncionario2() {
		return valorVendidoFuncionario2;
	}

	public void setValorVendidoFuncionario2(List<ValorVendidoFuncionarioWrapper> valorVendidoFuncionario2) {
		this.valorVendidoFuncionario2 = valorVendidoFuncionario2;
	}

	public List<ValorVendidoFuncionarioWrapper> getValorVendidoFuncionario3() {
		return valorVendidoFuncionario3;
	}

	public void setValorVendidoFuncionario3(List<ValorVendidoFuncionarioWrapper> valorVendidoFuncionario3) {
		this.valorVendidoFuncionario3 = valorVendidoFuncionario3;
	}

	public LineChartModel getLineModelValor() {
		return lineModelValor;
	}

	public void setLineModelValor(LineChartModel lineModelValor) {
		this.lineModelValor = lineModelValor;
	}

	public List<QuantidadeVendidaFuncionarioWrapper> getQuantidadeVendidaFuncionario1() {
		return quantidadeVendidaFuncionario1;
	}

	public void setQuantidadeVendidaFuncionario1(List<QuantidadeVendidaFuncionarioWrapper> quantidadeVendidaFuncionario1) {
		this.quantidadeVendidaFuncionario1 = quantidadeVendidaFuncionario1;
	}

	public List<QuantidadeVendidaFuncionarioWrapper> getQuantidadeVendidaFuncionario2() {
		return quantidadeVendidaFuncionario2;
	}

	public void setQuantidadeVendidaFuncionario2(List<QuantidadeVendidaFuncionarioWrapper> quantidadeVendidaFuncionario2) {
		this.quantidadeVendidaFuncionario2 = quantidadeVendidaFuncionario2;
	}

	public List<QuantidadeVendidaFuncionarioWrapper> getQuantidadeVendidaFuncionario3() {
		return quantidadeVendidaFuncionario3;
	}

	public void setQuantidadeVendidaFuncionario3(List<QuantidadeVendidaFuncionarioWrapper> quantidadeVendidaFuncionario3) {
		this.quantidadeVendidaFuncionario3 = quantidadeVendidaFuncionario3;
	}

	public LineChartModel getLineModelQuantidade() {
		return lineModelQuantidade;
	}

	public void setLineModelQuantidade(LineChartModel lineModelQuantidade) {
		this.lineModelQuantidade = lineModelQuantidade;
	}
}
