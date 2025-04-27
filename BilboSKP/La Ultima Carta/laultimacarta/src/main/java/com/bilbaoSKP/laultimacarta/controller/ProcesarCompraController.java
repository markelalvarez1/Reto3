package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;
import java.net.URLDecoder;
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
import com.bilbaoSKP.laultimacarta.service.CuponService;
import com.bilbaoSKP.laultimacarta.service.StripeService;

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

        Cookie[] cookies = request.getCookies();
        
        int cantidad = 0;
        double precio = 0;
        Cookie carritoCookie = null;

        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("carritoCupones".equals(c.getName())) {
                    carritoCookie = c;
                    String carroDecoder = URLDecoder.decode(c.getValue(), "UTF-8");
                    String[] carrito = carroDecoder.split(";");
                    cantidad = Integer.parseInt(carrito[0]);
                    precio = Double.parseDouble(carrito[1]);
                    break;
                }
            }
        }

       

        Suscripcion suscripcion = usuarioLogueado.getSuscripcion();
      
        ArrayList<Cupon> cupones = new ArrayList<>();
        for (int i = 0; i < cantidad; i++) {
            Cupon cupon = Cupon.nuevoCupon(precio);
            cupon.setSuscripcionId(suscripcion.getId());
            cupones.add(cupon);
        }

        boolean resultado = cuponService.procesarCompraCupones(usuarioLogueado, cupones);

        if (resultado) {
            
            List<Cupon> cuponesActuales = suscripcion.getCupones();
            if (cuponesActuales == null) {
                cuponesActuales = new ArrayList<>();
            }
            cuponesActuales.addAll(cupones);
            suscripcion.setCupones(cuponesActuales);
            usuarioLogueado.setSuscripcion(suscripcion);
            session.setAttribute("usuario", usuarioLogueado);
       
                carritoCookie.setMaxAge(0);
                
                response.addCookie(carritoCookie);
            
            
          
        }
        response.sendRedirect("cupones");
    }

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
}