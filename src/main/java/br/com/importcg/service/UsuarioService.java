package br.com.importcg.service;

import java.io.Serializable;

import javax.inject.Inject;

import br.com.importcg.dao.UsuarioDAO;

public class UsuarioService implements Serializable {

	private static final long serialVersionUID = 647591361113937478L;

	@Inject
	private UsuarioDAO usuarioDAO;

}
