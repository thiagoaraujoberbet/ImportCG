package br.com.importcg.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.com.importcg.model.ItemEntrada;
import br.com.importcg.service.ItemEntradaService;

@FacesConverter("itemEntradaConverter")
public class ItemEntradaConverter implements Converter {

	@Inject
	private ItemEntradaService itemEntradaService;

    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		ItemEntrada itemEntrada = null;
		try {
			if (value != null && !"Selecione...".equals(value)) {
				itemEntrada = itemEntradaService.porId(Long.parseLong(value));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemEntrada;
    }
 
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
    	ItemEntrada itemEntrada = (ItemEntrada) object;

		if (object == null || itemEntrada == null) {
			return null;
		}

		return itemEntrada.getId().toString();
    } 
}
