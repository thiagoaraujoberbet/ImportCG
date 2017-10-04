package br.com.importcg.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;

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

import br.com.importcg.enumeration.EnumTipoDespesa;

@Entity
@Table(name = "itemDespesa")
public class ItemDespesa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2666149743550987508L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idItemDespesa", nullable=false)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="idDespesa")
	private Despesa despesa;
	
	@ManyToOne
	@JoinColumn(name="idEntrada")
	private Entrada entrada;
	
	private String descricao;
	
	@Enumerated(EnumType.STRING)
	private EnumTipoDespesa tipo;
	
	private BigDecimal valor = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
//	@Enumerated(EnumType.STRING)
//	private EnumStatusBaixa status = EnumStatusBaixa.NAOBAIXADO;

	public ItemDespesa() {
		super();
	}

	public ItemDespesa(Despesa despesa, Entrada entrada, String descricao, EnumTipoDespesa tipo, BigDecimal valor) {
		this.despesa = despesa;
		this.entrada = entrada;
		this.descricao = descricao;
		this.tipo = tipo;
		this.valor = valor;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Despesa getDespesa() {
		return despesa;
	}

	public void setDespesa(Despesa despesa) {
		this.despesa = despesa;
	}

	public Entrada getEntrada() {
		return entrada;
	}

	public void setEntrada(Entrada entrada) {
		this.entrada = entrada;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public EnumTipoDespesa getTipo() {
		return tipo;
	}

	public void setTipo(EnumTipoDespesa tipo) {
		this.tipo = tipo;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	
//	public EnumStatusBaixa getStatus() {
//		return status;
//	}
//
//	public void setStatus(EnumStatusBaixa status) {
//		this.status = status;
//	}

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
		ItemDespesa other = (ItemDespesa) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
