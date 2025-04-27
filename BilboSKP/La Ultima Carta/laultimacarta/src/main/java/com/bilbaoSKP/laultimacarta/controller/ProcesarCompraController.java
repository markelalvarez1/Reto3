package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bilbaoSKP.laultimacarta.model.Cupon;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.EstadoCuponEnum;
import com.bilbaoSKP.laultimacarta.service.CuponService;
import com.bilbaoSKP.laultimacarta.service.StripeService;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;

@WebServlet("/procesarCompra")
public class ProcesarCompraController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CuponService cuponService;
	private StripeService stripeService;
	private static final double PRECIO_CUPON = 2.50;

	public ProcesarCompraController() {
		super();
		cuponService = new CuponService();
		stripeService = new StripeService();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");

		// Obtener datos del carrito
		Cookie[] cookies = request.getCookies();
		int cantidad = 0;
		Cookie carritoCookie = null;

		if (cookies != null) {
			for (Cookie c : cookies) {
				if ("carritoCupones".equals(c.getName())) {
					carritoCookie = c;
					String carroDecoder = URLDecoder.decode(c.getValue(), "UTF-8");
					String[] carrito = carroDecoder.split(";");
					cantidad = Integer.parseInt(carrito[0]);
					break;
				}
			}
		}

		// Verificar el tipo de suscripción
		Suscripcion s = usuarioLogueado.getSuscripcion();
		// Llama al service y pasale un arrayListe de Cupon en con la cantidad de cupones del carrito y la suscripcion
		// El service llama al DAO, le pasas los mismos datos del service
		// INSERT a la tabla cupones con los los cupones nuevos
		// Al usuario de la sesion, le añades los cupones nuevos.
		// Listo
		
		response.sendRedirect("cupones");
		
	}

	// Para manejar las redirecciones desde Stripe (GET)
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}