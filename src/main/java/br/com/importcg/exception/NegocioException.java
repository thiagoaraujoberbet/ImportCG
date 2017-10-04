package br.com.importcg.exception;

public class NegocioException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8555063365605508545L;

	public NegocioException(String msg) {
		super(msg);
	}
}
