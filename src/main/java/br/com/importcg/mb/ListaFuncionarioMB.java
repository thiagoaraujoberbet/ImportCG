package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Pessoa;
import br.com.importcg.service.PessoaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaFuncionarioMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4893639490487028890L;

	@Inject
	private PessoaService pessoaService;
	
	private List<Pessoa> funcionarios = new ArrayList<>();
	
	private List<Pessoa> funcionariosSelecionados = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		funcionarios = pessoaService.buscarInformacoesFuncionario();
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
}
