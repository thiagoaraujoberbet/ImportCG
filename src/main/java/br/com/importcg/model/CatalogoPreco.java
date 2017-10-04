package br.com.importcg.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "catalogoPreco")
public class CatalogoPreco implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5081516481290959410L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idCatalogoPreco", nullable=false)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="idProduto")
	private Produto produto;
	
	private BigDecimal valorAVista = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private BigDecimal valorAPrazo = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);

	public CatalogoPreco() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public BigDecimal getValorAVista() {
		return valorAVista;
	}

	public void setValorAVista(BigDecimal valorAVista) {
		this.valorAVista = valorAVista;
	}
	
	public BigDecimal getValorAPrazo() {
		return valorAPrazo;
	}

	public void setValorAPrazo(BigDecimal valorAPrazo) {
		this.valorAPrazo = valorAPrazo;
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
		CatalogoPreco other = (CatalogoPreco) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
