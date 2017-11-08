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

import br.com.importcg.enumeration.EnumStatusBaixa;

@Entity
@Table(name = "despesa")
public class Despesa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2183820202698837076L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idDespesa", nullable=false)
	private Long id;
	
	private String descricao;
	
	private BigDecimal valorTotal = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private Date dataDespesa;
	
	@Enumerated(EnumType.STRING)
	private EnumStatusBaixa status;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy= "despesa", cascade = CascadeType.ALL)	
	private List<ItemDespesa> itensDespesa;

	public Despesa() {
		super();
	}

	public Despesa(Date data, String descricao, BigDecimal valorTotal) {
		this.dataDespesa = data;
		this.descricao = descricao;
		this.valorTotal = valorTotal;
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

	public Date getDataDespesa() {
		return dataDespesa;
	}

	public void setDataDespesa(Date dataDespesa) {
		this.dataDespesa = dataDespesa;
	}
	
	public EnumStatusBaixa getStatus() {
		return status;
	}

	public void setStatus(EnumStatusBaixa status) {
		this.status = status;
	}

	public List<ItemDespesa> getItensDespesa() {
		return itensDespesa;
	}

	public void setItensDespesa(List<ItemDespesa> itensDespesa) {
		this.itensDespesa = itensDespesa;
	}

	public boolean isInclusao() {
		return getId() == null ? true : false;
	}
	
	public boolean isEdicao() {
		return !isInclusao();
	}
	
	public String getDataDespesaFormatada() {
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		return formato.format(this.dataDespesa);
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
		Despesa other = (Despesa) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
