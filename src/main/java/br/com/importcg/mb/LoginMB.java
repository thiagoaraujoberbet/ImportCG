package br.com.importcg.mb;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import br.com.importcg.fachada.UserFacade;
import br.com.importcg.model.Usuario;
import br.com.importcg.util.FacesUtil;

@ManagedBean
@RequestScoped
public class LoginMB implements java.io.Serializable {

	private static final long serialVersionUID = -8368015582787149315L;

	@ManagedProperty(value=UsuarioMB.INJECTION_NAME)
	private UsuarioMB usuarioMB;
	
	private String login;
	
	private String senha;

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
	
	public String login() {
		UserFacade userFacade = new UserFacade();
		
		Usuario usuario = userFacade.isValidarLogin(login, senha);
		
		if (usuario != null) {
			usuarioMB.setUsuario(usuario);
			FacesContext context = FacesContext.getCurrentInstance();
			HttpServletRequest request = (HttpServletRequest) context.getExternalContext().getRequest();
			request.getSession().setAttribute("usuario", usuario);
			
			return "/pages/protected/index.xhtml";
		}
		
		FacesUtil.addErrorMessage("Verifique seu login/senha!");
		
		return null;
	}

	public void setUsuarioMB(UsuarioMB usuarioMB) {
		this.usuarioMB = usuarioMB;
	}
}
