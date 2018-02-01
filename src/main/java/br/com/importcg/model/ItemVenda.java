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

@Entity
@Table(name = "itemVenda")
public class ItemVenda implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2469268991237878941L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idItemVenda", nullable=false, unique=true)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="idVenda", nullable=false)
	private Venda venda;
	
	@ManyToOne
	@JoinColumn(name="idProduto", nullable=false)
	private Produto produto;
	
	@ManyToOne
	@JoinColumn(name="idItemEntrada", nullable=false)
	private ItemEntrada itemEntrada;
	
	private BigDecimal valor = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private Integer quantidade = Integer.parseInt("0");
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy= "itemVenda", cascade = CascadeType.ALL)	
	private List<EstatisticaVenda> estatisticasVenda;
	
	public ItemVenda() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Venda getVenda() {
		return venda;
	}

	public void setVenda(Venda venda) {
		this.venda = venda;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public ItemEntrada getItemEntrada() {
		return itemEntrada;
	}

	public void setItemEntrada(ItemEntrada itemEntrada) {
		this.itemEntrada = itemEntrada;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
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
		ItemVenda other = (ItemVenda) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
