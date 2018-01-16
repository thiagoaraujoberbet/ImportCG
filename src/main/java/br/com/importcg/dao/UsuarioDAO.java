package br.com.importcg.dao;

import java.io.Serializable;

import javax.inject.Inject;
import javax.persistence.EntityManager;

public class UsuarioDAO implements Serializable {

	private static final long serialVersionUID = -6728284663274830720L;

	@Inject
	private EntityManager manager;

}
