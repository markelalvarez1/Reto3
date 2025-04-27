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

		// Verificar si el usuario está autenticado
		if (usuarioLogueado == null) {
			session.setAttribute("mensaje", "Debe iniciar sesión para realizar una compra");
			response.sendRedirect("login.jsp");
			return;
		}

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

		// Verificar si hay elementos en el carrito
		if (cantidad <= 0) {
			request.setAttribute("error", "No hay cupones en el carrito para procesar");
			request.getRequestDispatcher("gestionCupones.jsp").forward(request, response);
			return;
		}

		// Verificar el tipo de suscripción
		int tipoSuscripcionId = usuarioLogueado.getSuscripcion().getTipoSuscripcion().getId();

		String accion = request.getParameter("accion");

		// Si es una confirmación de pago exitoso (regreso desde Stripe)
		if ("confirmar".equals(accion)) {
			procesarCompraFinal(usuarioLogueado, cantidad, PRECIO_CUPON, carritoCookie, session, request, response);
			return;
		}

		// Si es centro educativo (ID 2 según la base de datos), procesar sin pago
		if (tipoSuscripcionId == 2) { // CENTRO ESCOLAR
			procesarCompraFinal(usuarioLogueado, cantidad, PRECIO_CUPON, carritoCookie, session, request, response);
		}
		// Si es usuario individual (ID 1), redirigir a Stripe
		else if (tipoSuscripcionId == 1) { // INDIVIDUAL
			try {
				// Crear sesión de pago con Stripe
				Session sesionStripe = stripeService.crearSesionDePagoCupones(cantidad);

				// Guardar la información del carrito en la sesión para usarla después del pago
				session.setAttribute("cantidadCupones", cantidad);

				// Redirigir al usuario a la página de pago de Stripe
				response.sendRedirect(sesionStripe.getUrl());
			} catch (StripeException e) {
				e.printStackTrace();
				request.setAttribute("error", "Error al procesar el pago. Inténtelo de nuevo.");
				request.getRequestDispatcher("gestionCupones.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("error", "Tipo de suscripción no válido.");
			request.getRequestDispatcher("gestionCupones.jsp").forward(request, response);
		}
	}

	private void procesarCompraFinal(Usuario usuario, int cantidad, double precioUnitario, Cookie carritoCookie,
			HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

// Verificar que la suscripción exista y tenga un ID válido
		if (usuario.getSuscripcion() == null || usuario.getSuscripcion().getId() <= 0) {
			request.setAttribute("error", "No se encontró una suscripción válida para el usuario");
			request.getRequestDispatcher("gestionCupones.jsp").forward(request, response);
			return;
		}

// Generar lista de nuevos cupones
		List<Cupon> nuevosCupones = new ArrayList<>();
		for (int i = 0; i < cantidad; i++) {
			Cupon cupon = new Cupon();
			cupon.setSuscripcionId(usuario.getSuscripcion().getId());
			cupon.setPrecio(precioUnitario);
			cupon.setEstadoCupon(EstadoCuponEnum.DISPONIBLE);

// Configurar fechas
			java.time.LocalDate fechaActual = java.time.LocalDate.now();
			cupon.setFechaCompra(fechaActual);
			cupon.setFechaCaducidad(fechaActual.plusYears(1));

			nuevosCupones.add(cupon);
		}

// Llamar al servicio para procesar la compra
		boolean exito = cuponService.procesarCompraCupones(usuario, nuevosCupones);

		if (exito) {
// Resto del código igual...
			// Eliminar la cookie del carrito
			if (carritoCookie != null) {
				carritoCookie.setMaxAge(0);
				response.addCookie(carritoCookie);
			}

			// Limpiar atributos de sesión relacionados con el proceso de compra
			session.removeAttribute("cantidadCupones");

			// Mensaje de éxito
			session.setAttribute("mensaje",
					"Compra realizada con éxito. Se han añadido " + cantidad + " cupones a su cuenta.");

			// Redirigir a la página de confirmación o de cupones
			response.sendRedirect("perfil");
		} else {
			request.setAttribute("error", "Error al procesar la compra. Inténtelo de nuevo.");
			request.getRequestDispatcher("gestionCupones.jsp").forward(request, response);
		}
	}

	// Para manejar las redirecciones desde Stripe (GET)
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Si viene de una redirección de Stripe después de un pago exitoso
		String accion = request.getParameter("accion");
		if ("confirmar".equals(accion)) {
			HttpSession session = request.getSession();
			Usuario usuarioLogueado = (Usuario) session.getAttribute("usuario");
			Integer cantidadCupones = (Integer) session.getAttribute("cantidadCupones");

			if (usuarioLogueado != null && cantidadCupones != null) {
				// Buscar la cookie del carrito
				Cookie[] cookies = request.getCookies();
				Cookie carritoCookie = null;
				if (cookies != null) {
					for (Cookie c : cookies) {
						if ("carritoCupones".equals(c.getName())) {
							carritoCookie = c;
							break;
						}
					}
				}

				// Procesar la compra después del pago exitoso
				procesarCompraFinal(usuarioLogueado, cantidadCupones, PRECIO_CUPON, carritoCookie, session, request,
						response);
			} else {
				response.sendRedirect("cupones");
			}
		} else {
			response.sendRedirect("cupones");
		}
	}
}