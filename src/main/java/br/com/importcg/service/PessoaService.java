package br.com.importcg.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import br.com.importcg.dao.PessoaDAO;
import br.com.importcg.enumeration.EnumTipoPessoa;
import br.com.importcg.model.Pessoa;
import br.com.importcg.util.Transacional;

public class PessoaService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5458744967062405893L;

	@Inject
	private PessoaDAO pessoaDAO;
	
	@Transacional
	public void salvar(Pessoa pessoa) {
		if (pessoa.isInclusao())
			pessoa.setDataCriacao(new Date());
		else 
			pessoa.setDataAlteracao(new Date());
		
		pessoaDAO.salvar(pessoa);
	}

	@Transacional
	public void excluir(Pessoa produto) {
		pessoaDAO.excluir(produto);
	}
	
	public List<Pessoa> listarTodos(EnumTipoPessoa tipo) {
		return pessoaDAO.listarTodos(tipo);
	}
	
	public Pessoa porId(Long id) {
		return pessoaDAO.porId(id);
	}

	public List<Pessoa> buscarInformacoesFuncionario() {
		return pessoaDAO.buscarInformacoesFuncionario();
	}

	public List<Pessoa> buscarInformacoesCliente() {
		return pessoaDAO.buscarInformacoesCliente();
	}
}
