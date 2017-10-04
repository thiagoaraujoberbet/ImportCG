package br.com.importcg.mb;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.enumeration.EnumTipoPessoa;
import br.com.importcg.model.Conta;
import br.com.importcg.model.Pessoa;
import br.com.importcg.service.ContaService;
import br.com.importcg.service.PessoaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class ContaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3945312924124792188L;

	private Conta conta = new Conta();
	
	private Long idConta;
	
	private List<Pessoa> funcionarios = new ArrayList<>();
	
	@Inject
	private ContaService contaService;
	
	@Inject
	private PessoaService pessoaService;
	
	public void inicializar() {
		if (idConta != null) 
			conta = contaService.porId(idConta);
		
		if (funcionarios.isEmpty()) {
			funcionarios = pessoaService.listarTodos(EnumTipoPessoa.FUNCIONARIO);
		}
	}

	public String salvar() {
		contaService.salvar(conta);
		
		if (conta.isEdicao())
			FacesUtil.addInfoMessage("Conta editada com sucesso!");
		else
			FacesUtil.addInfoMessage("Conta cadastrada com sucesso!");
		
		return "listarConta.xhtml?faces-redirect=true";
	}
	
	public String excluir() {
		contaService.excluir(conta);
		
		return "listarConta.xhtml?faces-redirect=true";
	}

	public Conta getConta() {
		return conta;
	}

	public void setConta(Conta conta) {
		this.conta = conta;
	}

	public Long getIdConta() {
		return idConta;
	}

	public void setIdConta(Long idConta) {
		this.idConta = idConta;
	}

	public List<Pessoa> getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(List<Pessoa> funcionarios) {
		this.funcionarios = funcionarios;
	}
}
