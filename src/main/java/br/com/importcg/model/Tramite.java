package br.com.importcg.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.importcg.enumeration.EnumOperacao;

@Entity
@Table(name = "tramite")
public class Tramite implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4889531580260768005L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idTramite", nullable=false, unique=true)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="idCaixa", nullable=false)
	private Caixa caixa;
	
	@Column(nullable=false)
	@Enumerated(EnumType.STRING)
	private EnumOperacao operacao;
	
	@Column(nullable=false)
	@Temporal(value = TemporalType.DATE)
	private Date data;
	
	@Column(nullable=false)
	private BigDecimal valor = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private String motivo;

	public Tramite() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Caixa getCaixa() {
		return caixa;
	}

	public void setCaixa(Caixa caixa) {
		this.caixa = caixa;
	}

	public EnumOperacao getOperacao() {
		return operacao;
	}

	public void setOperacao(EnumOperacao operacao) {
		this.operacao = operacao;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	
	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
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
		Tramite other = (Tramite) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
