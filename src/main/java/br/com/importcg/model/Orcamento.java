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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "orcamento")
public class Orcamento implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3564433918136416874L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idOrcamento", nullable=false, unique=true)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="idCliente", nullable=false)
	private Pessoa cliente;
	
	@ManyToOne
	@JoinColumn(name="idFuncionario", nullable=false)
	private Pessoa funcionario;
	
	@Column(nullable=false)
	@Temporal(value = TemporalType.DATE)
	private Date data;
	
	private BigDecimal valorTotal;
	
	private BigDecimal lucroTotal;
	
	private Integer quantidadeTotal;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy= "orcamento", cascade = CascadeType.ALL)	
	private List<ItemOrcamento> itensOrcamento;

	public Orcamento() {
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

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public BigDecimal getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(BigDecimal valorTotal) {
		this.valorTotal = valorTotal;
	}

	public BigDecimal getLucroTotal() {
		return lucroTotal;
	}

	public void setLucroTotal(BigDecimal lucroTotal) {
		this.lucroTotal = lucroTotal;
	}

	public Integer getQuantidadeTotal() {
		return quantidadeTotal;
	}

	public void setQuantidadeTotal(Integer quantidadeTotal) {
		this.quantidadeTotal = quantidadeTotal;
	}
	
	public List<ItemOrcamento> getItensOrcamento() {
		return itensOrcamento;
	}

	public void setItensOrcamento(List<ItemOrcamento> itensOrcamento) {
		this.itensOrcamento = itensOrcamento;
	}

	public boolean isInclusao() {
		return getId() == null ? true : false;
	}
	
	public boolean isEdicao() {
		return !isInclusao();
	}
	
	public String getDataFormatada() {
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
		Orcamento other = (Orcamento) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
