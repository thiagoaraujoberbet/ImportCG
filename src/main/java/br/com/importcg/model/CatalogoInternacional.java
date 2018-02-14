package br.com.importcg.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name = "catalogoInternacional")
public class CatalogoInternacional implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4877787559400189464L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idCatalogoInternacional", nullable=false, unique=true)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="idProduto", nullable=false)
	private Produto produto;
	
	@ManyToOne
	@JoinColumn(name="idFornecedor", nullable=false)
	private Fornecedor fornecedor;
	
	@ManyToOne
	@JoinColumn(name="idItemEntrada")
	private ItemEntrada itemEntrada;
	
	@Column(nullable=false)
	private BigDecimal valorEmDolar = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	@Column(nullable=false)
	private BigDecimal valorEmReal = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	@Column(nullable=false)
	private BigDecimal cotacao = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	@Column(nullable=false)
	@Temporal(value = TemporalType.DATE)
	private Date data;
	
	@Transient
	private String nomeFornecedor;

	public CatalogoInternacional() {
		super();
	}

	public CatalogoInternacional(ItemEntrada itemEntrada, Date data) {
		this.data = data;
		this.itemEntrada = itemEntrada;
		this.cotacao = itemEntrada.getCotacao();
		this.produto = itemEntrada.getProduto();
		this.fornecedor = itemEntrada.getFornecedor();
		this.valorEmReal = itemEntrada.getValorEmReal();
		this.valorEmDolar = itemEntrada.getValorEmDolar();
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

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public ItemEntrada getItemEntrada() {
		return itemEntrada;
	}

	public void setItemEntrada(ItemEntrada itemEntrada) {
		this.itemEntrada = itemEntrada;
	}

	public BigDecimal getValorEmDolar() {
		return valorEmDolar;
	}

	public void setValorEmDolar(BigDecimal valorEmDolar) {
		this.valorEmDolar = valorEmDolar;
	}

	public BigDecimal getValorEmReal() {
		return valorEmReal;
	}

	public void setValorEmReal(BigDecimal valorEmReal) {
		this.valorEmReal = valorEmReal;
	}

	public BigDecimal getCotacao() {
		return cotacao;
	}

	public void setCotacao(BigDecimal cotacao) {
		this.cotacao = cotacao;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getNomeFornecedor() {
		return nomeFornecedor;
	}

	public void setNomeFornecedor(String nomeFornecedor) {
		this.nomeFornecedor = nomeFornecedor;
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
		CatalogoInternacional other = (CatalogoInternacional) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
