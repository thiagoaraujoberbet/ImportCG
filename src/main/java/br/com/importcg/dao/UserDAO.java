package br.com.importcg.dao;

import java.util.HashMap;
import java.util.Map;

import br.com.importcg.model.Usuario;

public class UserDAO extends GenericDAO<Usuario> {

	private static final long serialVersionUID = 5315090520097112929L;

	public UserDAO() {
		super(Usuario.class);
	}

	public Usuario findUserByLogin(String login) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("login", login);
		
		return super.findOneResult(Usuario.FIND_BY_LOGIN, parameters);
	}
}
