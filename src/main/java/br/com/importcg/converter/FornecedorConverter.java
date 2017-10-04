package br.com.importcg.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.com.importcg.model.Fornecedor;
import br.com.importcg.service.FornecedorService;

@FacesConverter("fornecedorConverter")
public class FornecedorConverter implements Converter {

	@Inject
	private FornecedorService fornecedorService;

    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
    	Fornecedor fornecedor = null;
		try {
			if (value != null && !"Selecione...".equals(value)) {
				fornecedor = fornecedorService.porId(Long.parseLong(value));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fornecedor;
    }
 
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
    	Fornecedor fornecedor = (Fornecedor) object;

		if (object == null || fornecedor == null) {
			return null;
		}

		return fornecedor.getId().toString();
    } 
}
