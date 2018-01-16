package br.com.importcg.fachada;

import br.com.importcg.dao.UserDAO;
import br.com.importcg.model.Usuario;

public class UserFacade {
	
	private UserDAO userDAO = new UserDAO();

	public Usuario isValidarLogin(String login, String senha) {
		userDAO.beginTransaction();
		Usuario usuario = userDAO.findUserByLogin(login);
		
		if (usuario == null || !usuario.getSenha().equals(senha)) 
			return null;
		
		return usuario;
	}
}
