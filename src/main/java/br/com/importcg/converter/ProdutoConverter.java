package br.com.importcg.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.com.importcg.model.Produto;
import br.com.importcg.service.ProdutoService;

@FacesConverter("produtoConverter")
public class ProdutoConverter implements Converter {
	
	@Inject
	private ProdutoService produtoService;

    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		Produto produto = null;
		try {
			if (value != null && !"Selecione...".equals(value)) {
				produto = produtoService.porId(Long.parseLong(value));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return produto;
    }
 
    public String getAsString(FacesContext fc, UIComponent uic, Object object) {
    	Produto produto = (Produto) object;

		if (object == null || produto == null) {
			return null;
		}

		return produto.getId().toString();
    } 
}
