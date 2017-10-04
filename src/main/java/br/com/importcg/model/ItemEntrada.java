package br.com.importcg.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "itemEntrada")
public class ItemEntrada implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7846689714625820576L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idItemEntrada", nullable=false)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="idEntrada")
	private Entrada entrada;
	
	@ManyToOne
	@JoinColumn(name="idProduto")
	private Produto produto;
	
	@ManyToOne
	@JoinColumn(name="idFornecedor")
	private Fornecedor fornecedor;
	
	private BigDecimal valorEmDolar = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private BigDecimal valorEmReal = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private BigDecimal cotacao = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private Integer quantidade = Integer.parseInt("0");
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy= "itemEntrada", cascade = CascadeType.ALL)	
	private List<CatalogoInternacional> catalogosInternacional;
	
	@Transient
	private Integer quantidadeEstoque;

	public ItemEntrada() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Entrada getEntrada() {
		return entrada;
	}

	public void setEntrada(Entrada entrada) {
		this.entrada = entrada;
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

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}
	
	public Integer getQuantidadeEstoque() {
		return quantidadeEstoque;
	}

	public void setQuantidadeEstoque(Integer quantidadeEstoque) {
		this.quantidadeEstoque = quantidadeEstoque;
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
		ItemEntrada other = (ItemEntrada) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
