package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cerrarSesion")
public class logoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public logoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for (Cookie cookie : cookies) {
					if("usuario".equals(cookie.getName())) {
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
		request.getSession().invalidate();
		response.sendRedirect("inicio");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
