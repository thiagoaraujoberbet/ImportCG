package br.com.importcg.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.com.importcg.model.Usuario;

/**
 * Servlet Filter implementation class UserCheckFilter
 */
public class LoginCheckFilter extends AbstractFilter implements Filter {
	private static List<String> allowedURIs;

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		if(allowedURIs == null){
			allowedURIs = new ArrayList<String>();
			allowedURIs.add(fConfig.getInitParameter("loginActionURI"));
			allowedURIs.add("/ImportCG/javax.faces.resource/theme.css.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/eNpdjDEOwjAMRU9Es2dDiK0jF3BSF6w2dogddeHwDVREgsGS_d7_DiKmViD7qOrC9xoS8dDIq42fhe0EG6ok_BEkTFFYO5xI7fPoPDU03q7d5LXeiVvl8sC4OH1WKOjCWvHQhRLOEFF9lJSFkU3_zQaGJUFZXN_ekR1JoUyu.css.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/eNp1ysEOwyAMA9Avanfnbyj1JhAhGQmHSfv4IsaJaidbz5YaCU8foC69G-rn8Ys96Vf-bJvk9opFl0_gihuRcEGx8U3q-qY0-8FsatXLTrFM82fvWzasZiDJ3jBNczzBzdbb8A4XTvJVdw.js.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/eNpNi0EKwCAMBF-k9lAo-Js0RFohRlzBSx9f66mHPcwOw0DEZYMJ4hl45mJtN3TRkDNTQ0xWuqMhMJWw-8NvYerwv11GWs2sVRKxILJptSKl4zMv2_ApjQ.css.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/eNorKMrMTU1LTE4ttsoqLE0tqtSHUHpZxTUFOOR0C3JK0zPzitHUJOcXpWII5Rbk56XmlaCrLU8sSS3KTSzK1oezgCoAwdg4rA.js.xhtml");	
			allowedURIs.add("/ImportCG/javax.faces.resource/images/ui-icons_222222_256x240.png.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/fonts/glyphicons-halflings-regular.woff2.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/fonts/glyphicons-halflings-regular.woff.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/fonts/glyphicons-halflings-regular.ttf.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/font-awesome/4.7.0/fonts/fontawesome-webfont.woff2.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/ajaxloadingbar.gif.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/js/bootstrap.min.js.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/iCheck/icheck.min.js.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/bootstrap/fonts/glyphicons-halflings-regular.woff2.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/bootstrap/fonts/glyphicons-halflings-regular.ttf.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/fonts/fontawesome-webfont.woff2.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/fonts/fontawesome-webfont.woff.xhtml");
			allowedURIs.add("/ImportCG/javax.faces.resource/fonts/fontawesome-webfont.ttf.xhtml");
		}
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		if (session.isNew()) {
			doLogin(request, response, req);
			return;
		}

		Usuario user = (Usuario) session.getAttribute("usuario");

		if (user == null && !allowedURIs.contains(req.getRequestURI())) {
			System.out.println(req.getRequestURI());
			doLogin(request, response, req);
			return;
		}

		chain.doFilter(request, response);
	}
}