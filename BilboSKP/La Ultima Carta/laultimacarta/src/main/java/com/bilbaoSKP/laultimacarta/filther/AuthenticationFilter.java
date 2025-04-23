package com.bilbaoSKP.laultimacarta.filther;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.service.CodificadorService;
import com.bilbaoSKP.laultimacarta.service.UsuarioService;


@WebFilter("/*")
public class AuthenticationFilter implements Filter {
	UsuarioService usuarioService;
	
    public AuthenticationFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Pasando por AuthFilter");
		
		HttpServletRequest req = (HttpServletRequest) request;
		Usuario u = (Usuario) req.getSession().getAttribute("usuario");
		if(u == null ) {
			Cookie[] cookies = req.getCookies();
			if(cookies != null) {
				for (Cookie cookie : cookies) {
					if("usuario".equals(cookie.getName())) {
						String idUsuario = CodificadorService.decodificar(cookie.getValue());
						Usuario usuario = usuarioService.getUsuarioByID(idUsuario);
						req.getSession().setAttribute("usuario", usuario);
					}
				}
			}
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		usuarioService = new UsuarioService();
	}

}
