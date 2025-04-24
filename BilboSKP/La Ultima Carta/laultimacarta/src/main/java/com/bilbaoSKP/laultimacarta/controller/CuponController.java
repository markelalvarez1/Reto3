package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.dto.ComprarCuponDTO;

@WebServlet("/cupones")
public class CuponController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if ("carritoCupones".equals(c.getName())) {
					String carroDecoder = URLDecoder.decode(c.getValue(), "UTF-8");
					String[] carrito = carroDecoder.split(";");
					String cantidad = carrito[0];
					String precio = carrito[1];
					request.setAttribute("cantidad", cantidad);
					request.setAttribute("precio", precio);
				}
			}
		}
		request.getRequestDispatcher("gestionCupones.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("compra".equals(action)) {
			String cantidad = request.getParameter("cantidad");
			String precioUnitario = request.getParameter("precioIndividual");
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie c : cookies) {
					if ("carritoCupones".equals(c.getName())) {
						String carroDecoder = URLDecoder.decode(c.getValue(), "UTF-8");
						String[] carrito = carroDecoder.split(";");
						String cantidadCarrito = carrito[0];
						String precio = carrito[1];
						String nuevaCantidad = String.valueOf(Integer.parseInt(cantidadCarrito)+Integer.parseInt(cantidad)) ;
						String cookieValue = nuevaCantidad + ";" + precio;
						String encodedValue = URLEncoder.encode(cookieValue, StandardCharsets.UTF_8.toString());

						Cookie carritoCookie = new Cookie("carritoCupones", encodedValue);
						carritoCookie.setMaxAge(60 * 60 * 24 * 7);

						response.addCookie(carritoCookie);
					}else {
						String cookieValue = cantidad + ";" + precioUnitario;

						String encodedValue = URLEncoder.encode(cookieValue, StandardCharsets.UTF_8.toString());

						Cookie carritoCookie = new Cookie("carritoCupones", encodedValue);
						carritoCookie.setMaxAge(60 * 60 * 24 * 7);

						response.addCookie(carritoCookie);
					}
				}
			}
			

		} else if ("eliminar".equals(action)) {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie c : cookies) {
					if ("carritoCupones".equals(c.getName())) {
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}
			}
		}
		response.sendRedirect("cupones");
	}
}