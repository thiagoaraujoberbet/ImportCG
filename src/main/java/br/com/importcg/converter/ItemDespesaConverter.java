package br.com.importcg.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.com.importcg.model.ItemDespesa;
import br.com.importcg.service.ItemDespesaService;

@FacesConverter("itemDespesaConverter")
public class ItemDespesaConverter implements Converter {

	@Inject
	private ItemDespesaService itemDespesaService;

    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		ItemDespesa itemDespesa = null;
		try {
			if (value != null && !"Selecione...".equals(value)) {
				itemDespesa = itemDespesaService.porId(Long.parseLong(value));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemDespesa;
    }
 
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
    	ItemDespesa itemDespesa = (ItemDespesa) object;

		if (object == null || itemDespesa == null) {
			return null;
		}

		return itemDespesa.getId().toString();
    } 
}
