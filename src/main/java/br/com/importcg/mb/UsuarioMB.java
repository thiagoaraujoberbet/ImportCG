package br.com.importcg.mb;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import br.com.importcg.model.Usuario;

@SessionScoped
@ManagedBean(name="usuarioMB")
public class UsuarioMB implements java.io.Serializable {

	private static final long serialVersionUID = 6653782720647570403L;

	public static final String INJECTION_NAME = "#{usuarioMB}";
	
	private Usuario usuario;
	
	public boolean isAdmin() {
		return usuario.isAdmin();
	}
	
	public boolean isDefaultUser() {
		return usuario.isUser();
	}
	
	public String logOut() {
		getRequest().getSession().invalidate();
		
		return "/login.xhtml";
	}
	
	private HttpServletRequest getRequest() {
		return (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}
