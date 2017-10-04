package br.com.importcg.model;

import java.io.Serializable;
import java.math.BigDecimal;
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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import br.com.importcg.enumeration.EnumStatusVenda;

@Entity
@Table(name = "venda")
public class Venda implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2232016469041131413L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idVenda", nullable=false)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="idCliente")
	private Pessoa cliente;
	
	@ManyToOne
	@JoinColumn(name="idFuncionario")
	private Pessoa funcionario;
	
	private Date dataVenda;
	
	private BigDecimal valorTotal;
	
	private Integer quantidadeTotal;
	
	@Enumerated(EnumType.STRING)
	private EnumStatusVenda status = EnumStatusVenda.AGUARDANDOPAGAMENTO;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy= "venda", cascade = CascadeType.ALL)	
	private List<ItemVenda> itensVenda;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy= "venda", cascade = CascadeType.ALL)	
	private List<Pagamento> pagamentos;

	public Venda() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Pessoa getCliente() {
		return cliente;
	}

	public void setCliente(Pessoa cliente) {
		this.cliente = cliente;
	}

	public Pessoa getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(Pessoa funcionario) {
		this.funcionario = funcionario;
	}

	public Date getDataVenda() {
		return dataVenda;
	}

	public void setDataVenda(Date dataVenda) {
		this.dataVenda = dataVenda;
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
	
	public EnumStatusVenda getStatus() {
		return status;
	}

	public void setStatus(EnumStatusVenda status) {
		this.status = status;
	}

	public boolean isInclusao() {
		return getId() == null ? true : false;
	}
	
	public boolean isEdicao() {
		return !isInclusao();
	}
	
	public String getDataVendaFormatada() {
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		return formato.format(this.dataVenda);
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
		Venda other = (Venda) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
