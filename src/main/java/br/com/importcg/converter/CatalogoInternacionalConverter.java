package br.com.importcg.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.com.importcg.model.CatalogoInternacional;
import br.com.importcg.service.CatalogoInternacionalService;

@FacesConverter("catalogoInternacionalConverter")
public class CatalogoInternacionalConverter implements Converter {

	@Inject
	private CatalogoInternacionalService catalogoInternacionalService;

    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
    	CatalogoInternacional catalogoInternacional = null;
		try {
			if (value != null && !"Selecione...".equals(value)) {
				catalogoInternacional = catalogoInternacionalService.porId(Long.parseLong(value));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return catalogoInternacional;
    }
 
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
    	CatalogoInternacional catalogoInternacional = (CatalogoInternacional) object;

		if (object == null || catalogoInternacional == null) {
			return null;
		}

		return catalogoInternacional.getId().toString();
    } 
}
