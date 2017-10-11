package br.com.importcg.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
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

import br.com.importcg.enumeration.EnumMes;

@Entity
@Table(name = "fechamento")
public class Fechamento implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2235842771471342257L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idFechamento", nullable=false)
	private Long id;
	
	private BigDecimal valorRecebido = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private BigDecimal valorEntradas = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private BigDecimal valorDespesas = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private BigDecimal saldo = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	@Enumerated(EnumType.STRING)
	private EnumMes mes;
	
	private int ano;
	
	private Date data = new Date();
	
	private boolean finalizado = Boolean.FALSE;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy= "fechamento", cascade = CascadeType.ALL)	
	private List<ItemFechamento> itensFechamento;

	public Fechamento() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getValorRecebido() {
		return valorRecebido;
	}

	public void setValorRecebido(BigDecimal valorRecebido) {
		this.valorRecebido = valorRecebido;
	}

	public BigDecimal getValorEntradas() {
		return valorEntradas;
	}

	public void setValorEntradas(BigDecimal valorEntradas) {
		this.valorEntradas = valorEntradas;
	}

	public BigDecimal getValorDespesas() {
		return valorDespesas;
	}

	public void setValorDespesas(BigDecimal valorDespesas) {
		this.valorDespesas = valorDespesas;
	}

	public BigDecimal getSaldo() {
		return saldo;
	}

	public void setSaldo(BigDecimal saldo) {
		this.saldo = saldo;
	}

	public EnumMes getMes() {
		return mes;
	}

	public void setMes(EnumMes mes) {
		this.mes = mes;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public boolean isFinalizado() {
		return finalizado;
	}

	public void setFinalizado(boolean finalizado) {
		this.finalizado = finalizado;
	}
	
	public boolean isInclusao() {
		return getId() == null ? true : false;
	}
	
	public boolean isEdicao() {
		return !isInclusao();
	}
	
	public String getDataFechamentoFormatada() {
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		return formato.format(this.data);
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
		Fechamento other = (Fechamento) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
