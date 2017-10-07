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

import br.com.importcg.enumeration.EnumTipoBaixa;

@Entity
@Table(name = "itemBaixa")
public class ItemBaixa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6168909875617854888L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idItemBaixa", nullable=false)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="idBaixa")
	private Baixa baixa;
	
	@ManyToOne
	@JoinColumn(name="idItemDespesa")
	private ItemDespesa itemDespesa;
	
	@ManyToOne
	@JoinColumn(name="idCaixa")
	private Caixa caixa;
	
	private String descricao;
	
	private BigDecimal valor = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private BigDecimal acrescimo = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_EVEN);
	
	private Date data = new Date();
	
	@Enumerated(EnumType.STRING)
	private EnumTipoBaixa tipo = EnumTipoBaixa.NAOBAIXADO;
	
	private boolean baixado = Boolean.FALSE;

	public ItemBaixa() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Baixa getBaixa() {
		return baixa;
	}

	public void setBaixa(Baixa baixa) {
		this.baixa = baixa;
	}

	public ItemDespesa getItemDespesa() {
		return itemDespesa;
	}

	public void setItemDespesa(ItemDespesa itemDespesa) {
		this.itemDespesa = itemDespesa;
	}

	public Caixa getCaixa() {
		return caixa;
	}

	public void setCaixa(Caixa caixa) {
		this.caixa = caixa;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public BigDecimal getAcrescimo() {
		return acrescimo;
	}

	public void setAcrescimo(BigDecimal acrescimo) {
		this.acrescimo = acrescimo;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public EnumTipoBaixa getTipo() {
		return tipo;
	}

	public void setTipo(EnumTipoBaixa tipo) {
		this.tipo = tipo;
	}

	public boolean isBaixado() {
		return baixado;
	}

	public void setBaixado(boolean baixado) {
		this.baixado = baixado;
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
		ItemBaixa other = (ItemBaixa) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
