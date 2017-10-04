package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Conta;
import br.com.importcg.service.ContaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ListaContaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4969647373281054761L;

	@Inject
	private ContaService contaService;
	
	private List<Conta> contas = new ArrayList<>();
	
	private List<Conta> contasSelecionadas = new ArrayList<>();
	
	@PostConstruct
	public void inicializar() {
		contas = contaService.listarTodos();
	}
	
	public void excluirSelecionados() {
		for (Conta conta : contasSelecionadas) {
			contaService.excluir(conta);
			contas.remove(conta);
		}
		
		FacesUtil.addInfoMessage("Conta(s) excluida(s) com sucesso!");
	}

	public List<Conta> getContas() {
		return contas;
	}

	public void setContas(List<Conta> contas) {
		this.contas = contas;
	}

	public List<Conta> getContasSelecionadas() {
		return contasSelecionadas;
	}

	public void setContasSelecionadas(List<Conta> contasSelecionadas) {
		this.contasSelecionadas = contasSelecionadas;
	}
}
