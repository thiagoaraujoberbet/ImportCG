package br.com.importcg.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.importcg.enumeration.EnumInstituicao;
import br.com.importcg.enumeration.EnumTipoConta;

@Entity
@Table(name = "conta")
public class Conta implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 494667261806064217L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idConta", nullable=false, unique=true)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="idFuncionario", nullable=false)
	private Pessoa funcionario;
	
	@Column(nullable=false)
	@NotEmpty
	private String nome;
	
	@Column(nullable=false)
	@Enumerated(EnumType.STRING)
	private EnumTipoConta tipo;
	
	@Enumerated(EnumType.STRING)
	private EnumInstituicao instituicao;
	
	private String agencia;
	
	private String numero;
	
	public Conta() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Pessoa getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(Pessoa funcionario) {
		this.funcionario = funcionario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public EnumTipoConta getTipo() {
		return tipo;
	}

	public void setTipo(EnumTipoConta tipo) {
		this.tipo = tipo;
	}

	public EnumInstituicao getInstituicao() {
		return instituicao;
	}

	public void setInstituicao(EnumInstituicao instituicao) {
		this.instituicao = instituicao;
	}

	public String getAgencia() {
		return agencia;
	}

	public void setAgencia(String agencia) {
		this.agencia = agencia;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}
	
	public boolean isInclusao() {
		return getId() == null ? true : false;
	}
	
	public boolean isEdicao() {
		return !isInclusao();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Conta other = (Conta) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
