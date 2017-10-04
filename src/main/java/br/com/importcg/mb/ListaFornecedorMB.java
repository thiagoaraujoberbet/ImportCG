package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

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
	
	@PostConstruct
	public void inicializar() {
		fornecedores = fornecedorService.listarTodos();
	}
	
	public void excluirSelecionados() {
		for (Fornecedor fornecedor : fornecedoresSelecionados) {
			fornecedorService.excluir(fornecedor);
			fornecedores.remove(fornecedor);
		}
		
		FacesUtil.addInfoMessage("Produto(s) excluido(s) com sucesso!");
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
}
