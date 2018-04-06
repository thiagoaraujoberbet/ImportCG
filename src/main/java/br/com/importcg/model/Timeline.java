package br.com.importcg.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.importcg.enumeration.EnumTipoMsgTimeline;
import br.com.importcg.enumeration.EnumTipoTimeline;

@Entity
@Table(name = "timeline")
public class Timeline implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1720214375247794356L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idTimeline", nullable=false, unique=true)
	private Long id;
	
	@Column(nullable=false)
	@Enumerated(EnumType.STRING)
	private EnumTipoTimeline tipo;
	
	@Column(nullable=false)
	@Enumerated(EnumType.STRING)
	private EnumTipoMsgTimeline tipoMsg;
	
	private String icone;
	
	private String titulo;
	
	@Column(nullable=false)
	@NotEmpty
	private String descricao;
	
	@Temporal(value = TemporalType.TIMESTAMP)
	private Date dataHora;
	
	public Timeline() {
		super();
	}

	public Timeline(EnumTipoTimeline tipo, EnumTipoMsgTimeline tipoMsg, String icone, String titulo, String descricao, Date dataHora) {
		this.tipo = tipo;
		this.tipoMsg = tipoMsg;
		this.icone = icone;
		this.titulo = titulo;
		this.descricao = descricao;
		this.dataHora = dataHora;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public EnumTipoTimeline getTipo() {
		return tipo;
	}

	public void setTipo(EnumTipoTimeline tipo) {
		this.tipo = tipo;
	}

	public EnumTipoMsgTimeline getTipoMsg() {
		return tipoMsg;
	}

	public void setTipoMsg(EnumTipoMsgTimeline tipoMsg) {
		this.tipoMsg = tipoMsg;
	}

	public String getIcone() {
		return icone;
	}

	public void setIcone(String icone) {
		this.icone = icone;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getDataHora() {
		return dataHora;
	}

	public void setDataHora(Date dataHora) {
		this.dataHora = dataHora;
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
		Timeline other = (Timeline) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}	
}
