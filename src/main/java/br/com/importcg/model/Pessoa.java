package br.com.importcg.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.importcg.enumeration.EnumCargo;
import br.com.importcg.enumeration.EnumTipoPessoa;

@Entity
@Table(name = "pessoa")
public class Pessoa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8843329865241309284L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idPessoa", nullable=false, unique=true)
	private Long id;
	
	@Column(nullable=false)
	@NotEmpty
	private String nome;
	
	@Enumerated(EnumType.STRING)
	private EnumCargo cargo;
	
	private String cpf;
	
	private Date dataNascimento;
	
	private String celular;
	
	private String email;
	
	@Column(nullable=false)
	@Enumerated(EnumType.STRING)
	private EnumTipoPessoa tipo;
	
	@Temporal(value = TemporalType.DATE)
	private Date dataCriacao;
	
	@Temporal(value = TemporalType.DATE)
	private Date dataAlteracao;	
	
	private String enderecoResidencial;
	
	private String enderecoComercial;
	
	private String linkImgFacebook;
	
	// Utilizado na consulta de listagem de clientes (ListaClienteMB -> listarCliente.xhtml)
	@Transient
	private Integer quantidadeComprada;
	
	// Utilizado na consulta de listagem de funcionários (ListaFuncionarioMB -> listarFuncionario.xhtml)
	@Transient
	private Integer quantidadeVendida;
	
	// Utilizado na consulta de listagem de clientes (ListaClienteMB -> listarCliente.xhtml)
	@Transient
	private BigDecimal valorComprado;
	
	// Utilizado na consulta de listagem de funcionários (ListaFuncionarioMB -> listarFuncionario.xhtml)
	@Transient
	private BigDecimal valorVendido;
	
	// Utilizado na consulta de listagem de clientes (ListaClienteMB -> listarCliente.xhtml)
	@Transient
	private BigDecimal valorDevido;

	public Pessoa() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public EnumCargo getCargo() {
		return cargo;
	}

	public void setCargo(EnumCargo cargo) {
		this.cargo = cargo;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public EnumTipoPessoa getTipo() {
		return tipo;
	}

	public void setTipo(EnumTipoPessoa tipo) {
		this.tipo = tipo;
	}
	
	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Date getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}
	
	public Integer getQuantidadeComprada() {
		return quantidadeComprada;
	}

	public void setQuantidadeComprada(Integer quantidadeComprada) {
		this.quantidadeComprada = quantidadeComprada;
	}

	public Integer getQuantidadeVendida() {
		return quantidadeVendida;
	}

	public void setQuantidadeVendida(Integer quantidadeVendida) {
		this.quantidadeVendida = quantidadeVendida;
	}

	public String getEnderecoResidencial() {
		return enderecoResidencial;
	}

	public void setEnderecoResidencial(String enderecoResidencial) {
		this.enderecoResidencial = enderecoResidencial;
	}

	public String getEnderecoComercial() {
		return enderecoComercial;
	}

	public void setEnderecoComercial(String enderecoComercial) {
		this.enderecoComercial = enderecoComercial;
	}
	
	public String getLinkImgFacebook() {
		return linkImgFacebook;
	}

	public void setLinkImgFacebook(String linkImgFacebook) {
		this.linkImgFacebook = linkImgFacebook;
	}
	
	public BigDecimal getValorComprado() {
		return valorComprado;
	}

	public void setValorComprado(BigDecimal valorComprado) {
		this.valorComprado = valorComprado;
	}

	public BigDecimal getValorVendido() {
		return valorVendido;
	}

	public void setValorVendido(BigDecimal valorVendido) {
		this.valorVendido = valorVendido;
	}

	public BigDecimal getValorDevido() {
		return valorDevido;
	}

	public void setValorDevido(BigDecimal valorDevido) {
		this.valorDevido = valorDevido;
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
		Pessoa other = (Pessoa) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
