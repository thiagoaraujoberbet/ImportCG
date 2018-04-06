package br.com.importcg.mb;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import br.com.importcg.model.Timeline;
import br.com.importcg.service.TimelineService;

@Named
@ViewScoped
public class TimelineMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8651908294841250442L;
	
	private List<Timeline> timeline = new ArrayList<>();
	
	@Inject
	private TimelineService timelineService;
	
	private Date data;
	private String corData; 
	private String corUltimaData;
	private String descricao;

	public void inicializar() {
		timeline = timelineService.listarTodos();
	}
	
	public boolean renderizarData(Date data, String descricao) {
		if (!descricao.equals(this.descricao)) {
			this.descricao = descricao;
			if (this.data != null) {
				if (montarData(data).equals(montarData(this.data))) {
					this.data = data;
					return false;
				} else {
					this.data = data;
					this.corData = this.selecionarCorData();
					this.corUltimaData = this.corData;
					return true;
				}
			} else {
				this.data = montarData(data);
				this.corData = this.selecionarCorData();
				this.corUltimaData = this.corData;
				return true;
			}
		}
		
		this.corUltimaData = this.corData;
		return true;
	}
	
	private Date montarData(Date data) {
		SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
		String fd = f.format(data);
		
		Date date = null;
		try {
			date = f.parse(fd);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return date;
	}
	
	public String formatarData(Date data) {
		return new SimpleDateFormat("dd/MM/yyyy").format(data);
	}
	
	private String selecionarCorData() {
		if ("bg-red".equals(corUltimaData)) 
			return "bg-green";
		if ("bg-green".equals(corUltimaData)) 
			return "bg-blue";
		if ("bg-blue".equals(corUltimaData)) 
			return "bg-yellow";
		
		return "bg-red";
	}

	public List<Timeline> getTimeline() {
		return timeline;
	}

	public void setTimeline(List<Timeline> timeline) {
		this.timeline = timeline;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getCorData() {
		return corData;
	}

	public void setCorData(String corData) {
		this.corData = corData;
	}

	public String getCorUltimaData() {
		return corUltimaData;
	}

	public void setCorUltimaData(String corUltimaData) {
		this.corUltimaData = corUltimaData;
	}
}
