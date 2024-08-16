package br.edu.ifsp.arq.ads.utils.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/adm-register.jsp", "/adocao-register.jsp", "/animal-register.jsp", "/funcionario-register.jsp", "/home-adm.jsp", "/home-common.jsp", "/home-funcionario.jsp", "/listaAdocao.jsp"}, filterName = "Permition")
public class ValidationPagesFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		String action = httpRequest.getParameter("action");
		HttpSession session = httpRequest.getSession(false);
		if(session == null || session.getAttribute("user") == null) {
			HttpServletResponse httpResponse = (HttpServletResponse)response;
			httpResponse.sendRedirect(httpRequest.getContextPath()+"/login.jsp");
		}
		else {
			chain.doFilter(request, response);
		}	
	}
}