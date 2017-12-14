package br.com.importcg.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.importcg.enumeration.EnumStatusBaixa;

@Entity
@Table(name = "baixa")
public class Baixa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6245987678950468855L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idBaixa", nullable=false)
	private Long id;
	
	private String descricao;
	
	private BigDecimal valorTotal;
	
	private Date dataCriacao;
	
	@Enumerated(EnumType.STRING)
	private EnumStatusBaixa status;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy= "baixa", cascade = CascadeType.ALL)	
	private List<ItemBaixa> itensBaixa;
	
	@Transient
	private BigDecimal valorPago;
	
	@Transient
	private BigDecimal valorRestante;

	public Baixa() {
		super();
	}

	public Baixa(String descricao, BigDecimal valorTotal, Date dataCriacao, EnumStatusBaixa status) {
		this.descricao = descricao;
		this.valorTotal = valorTotal;
		this.dataCriacao = dataCriacao;
		this.status = status;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public BigDecimal getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(BigDecimal valorTotal) {
		this.valorTotal = valorTotal;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public EnumStatusBaixa getStatus() {
		return status;
	}

	public void setStatus(EnumStatusBaixa status) {
		this.status = status;
	}

	public boolean isInclusao() {
		return getId() == null ? true : false;
	}
	
	public BigDecimal getValorPago() {
		return valorPago;
	}

	public void setValorPago(BigDecimal valorPago) {
		this.valorPago = valorPago;
	}

	public BigDecimal getValorRestante() {
		return valorRestante;
	}

	public void setValorRestante(BigDecimal valorRestante) {
		this.valorRestante = valorRestante;
	}

	public boolean isEdicao() {
		return !isInclusao();
	}
	
	public String getDataCriacaoFormatada() {
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		return formato.format(this.dataCriacao);
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
		Baixa other = (Baixa) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
