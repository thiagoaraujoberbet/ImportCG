package br.com.importcg.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.com.importcg.model.Entrada;
import br.com.importcg.service.EntradaService;

@FacesConverter("entradaConverter")
public class EntradaConverter implements Converter {

	@Inject
	private EntradaService entradaService;

    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		Entrada entrada = null;
		try {
			if (value != null) {
				entrada = entradaService.porId(Long.parseLong(value));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entrada;
    }
 
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
    	Entrada entrada = (Entrada) object;

		if (object == null || entrada == null) {
			return null;
		}

		return entrada.getId().toString();
    } 
}
