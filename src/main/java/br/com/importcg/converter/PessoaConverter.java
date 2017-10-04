package br.com.importcg.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.com.importcg.model.Pessoa;
import br.com.importcg.service.PessoaService;

@FacesConverter("pessoaConverter")
public class PessoaConverter implements Converter {

	@Inject
	private PessoaService pessoaService;

    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		Pessoa pessoa = null;
		try {
			if (value != null) {
				pessoa = pessoaService.porId(Long.parseLong(value));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pessoa;
    }
 
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
    	Pessoa pessoa = (Pessoa) object;

		if (object == null || pessoa == null) {
			return null;
		}

		return pessoa.getId().toString();
    } 
}
