package br.com.importcg.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.com.importcg.model.Conta;
import br.com.importcg.service.ContaService;

@FacesConverter("contaConverter")
public class ContaConverter implements Converter {

	@Inject
	private ContaService contaService;

    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		Conta conta = null;
		try {
			if (value != null && !"Selecione...".equals(value)) {
				conta = contaService.porId(Long.parseLong(value));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conta;
    }
 
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
    	Conta conta = (Conta) object;

		if (object == null || conta == null) {
			return null;
		}

		return conta.getId().toString();
    } 
}
