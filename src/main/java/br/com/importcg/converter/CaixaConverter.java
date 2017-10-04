package br.com.importcg.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.com.importcg.model.Caixa;
import br.com.importcg.service.CaixaService;

@FacesConverter("caixaConverter")
public class CaixaConverter implements Converter {

	@Inject
	private CaixaService caixaService;

    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		Caixa caixa = null;
		try {
			if (value != null && !"Selecione...".equals(value)) {
				caixa = caixaService.porId(Long.parseLong(value));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return caixa;
    }
 
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
    	Caixa caixa = (Caixa) object;

		if (object == null || caixa == null || caixa.getId() == null) {
			return null;
		}

		return caixa.getId().toString();
    } 
}
