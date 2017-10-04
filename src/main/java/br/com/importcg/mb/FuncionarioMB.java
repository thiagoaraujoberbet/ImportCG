package br.com.importcg.mb;

import java.io.Serializable;
import java.util.Date;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.enumeration.EnumTipoPessoa;
import br.com.importcg.model.Pessoa;
import br.com.importcg.service.PessoaService;
import br.com.importcg.util.FacesUtil;

@Named
@ViewScoped
public class FuncionarioMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7717211921027208569L;

	private Pessoa funcionario = new Pessoa();
	
	private Long idFuncionario;
	
	@Inject
	private PessoaService pessoaService;
	
	public void inicializar() {
		if (idFuncionario != null) {
			funcionario = pessoaService.porId(idFuncionario);
		} else {
			funcionario.setTipo(EnumTipoPessoa.FUNCIONARIO);
			funcionario.setDataCriacao(new Date());
		}
	}

	public String salvar() {
		pessoaService.salvar(funcionario);
		
		if (funcionario.isEdicao())
			FacesUtil.addInfoMessage("Funcionário editado com sucesso!");
		else
			FacesUtil.addInfoMessage("Funcionário cadastrado com sucesso!");
		
		return "listarFuncionario.xhtml?faces-redirect=true";
	}
	
	public String excluir() {
		pessoaService.excluir(funcionario);
		
		return "listarFuncionario.xhtml?faces-redirect=true";
	}

	public Pessoa getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(Pessoa funcionario) {
		this.funcionario = funcionario;
	}

	public Long getIdFuncionario() {
		return idFuncionario;
	}

	public void setIdFuncionario(Long idFuncionario) {
		this.idFuncionario = idFuncionario;
	}
	
	
}
