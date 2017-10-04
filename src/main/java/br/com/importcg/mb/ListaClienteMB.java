package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.enumeration.EnumTipoPessoa;
import br.com.importcg.model.Pessoa;
import br.com.importcg.service.PessoaService;
import br.com.importcg.util.FacesUtil;

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
	
	@PostConstruct
	public void inicializar() {
		clientes = pessoaService.listarTodos(EnumTipoPessoa.CLIENTE);
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
}
