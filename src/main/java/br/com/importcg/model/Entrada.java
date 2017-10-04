package br.com.importcg.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "entrada")
public class Entrada implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8641934955838642900L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idEntrada", nullable=false)
	private Long id;
	
	private Date dataCompra;
	
	private BigDecimal valorTotal;
	
	private Integer quantidadeTotal;
	
	private boolean despesaLancada = Boolean.FALSE;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy= "entrada", cascade = CascadeType.ALL)	
	private List<ItemEntrada> itensEntrada;
	
	public Entrada() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataCompra() {
		return dataCompra;
	}

	public void setDataCompra(Date dataCompra) {
		this.dataCompra = dataCompra;
	}

	public BigDecimal getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(BigDecimal valorTotal) {
		this.valorTotal = valorTotal;
	}
	
	public Integer getQuantidadeTotal() {
		return quantidadeTotal;
	}

	public void setQuantidadeTotal(Integer quantidadeTotal) {
		this.quantidadeTotal = quantidadeTotal;
	}	
	
	public boolean isDespesaLancada() {
		return despesaLancada;
	}

	public void setDespesaLancada(boolean despesaLancada) {
		this.despesaLancada = despesaLancada;
	}

	public boolean isInclusao() {
		return getId() == null ? true : false;
	}
	
	public boolean isEdicao() {
		return !isInclusao();
	}
	
	public String getDataCompraFormatada() {
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		return formato.format(this.dataCompra);
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
		Entrada other = (Entrada) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
