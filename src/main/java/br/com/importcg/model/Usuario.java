package br.com.importcg.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import br.com.importcg.enumeration.EnumRole;

@Entity
@Table(name = "usuario")
@NamedQuery(name = "User.findUserByLogin", query = "select u from Usuario u where u.login = :login")
public class Usuario implements Serializable {

	private static final long serialVersionUID = 5319711022812723466L;
	
	public static final String FIND_BY_LOGIN = "User.findUserByLogin";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idUsuario", nullable=false)
	private Long id;
	
	private String nome;
	
	@Column(unique=true)
	private String login;
	
	private String senha;
	
	@Enumerated(EnumType.STRING)
	private EnumRole role;

	public Usuario() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public EnumRole getRole() {
		return role;
	}

	public void setRole(EnumRole role) {
		this.role = role;
	}
	
	public boolean isAdmin() {
		return EnumRole.ADMIN.equals(role);
	}
	
	public boolean isUser() {
		return EnumRole.USER.equals(role);
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
		Usuario other = (Usuario) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
