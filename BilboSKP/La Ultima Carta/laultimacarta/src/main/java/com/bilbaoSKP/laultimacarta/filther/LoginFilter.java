package com.bilbaoSKP.laultimacarta.filther;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Responsable;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.RolEnum;
import com.bilbaoSKP.laultimacarta.service.CentroEscolarService;


@WebFilter( urlPatterns = {"/private/*"}, dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.FORWARD})
public class LoginFilter implements Filter {
	CentroEscolarService centroEscolarService;
	
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Estoy pasando por LoginFilter");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		Usuario u = (Usuario) req.getSession().getAttribute("usuario");
		if(u != null) {
			if(u.getRol().getId() == RolEnum.RESPONSABLE.getCodigo()) {
				Responsable r = new Responsable(u);
				CentroEscolar cs = centroEscolarService.getCentroEscolarByUsuarioID(r.getId());
				r.setCentroEscolar(cs);
				req.getSession().setAttribute("usuario", r);
			}
			
			chain.doFilter(request, response);
		}else {
			res.sendRedirect("inicioSesion");
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		centroEscolarService = new CentroEscolarService();
	}

}
