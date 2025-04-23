package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bilbaoSKP.laultimacarta.model.Cupon;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.service.CuponService;
import com.bilbaoSKP.laultimacarta.service.CuponService.ItemCarrito;
import com.bilbaoSKP.laultimacarta.service.SuscripcionService;

@WebServlet("/cupones/procesar")
public class CuponController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CuponService cuponService;
    private SuscripcionService suscripcionService;
    
    @Override
    public void init() throws ServletException {
        super.init();
        cuponService = new CuponService();
        suscripcionService = new SuscripcionService();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Verificar si el usuario está autenticado
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario == null) {
            // Si no está autenticado, redirigir a la página de inicio de sesión
            response.sendRedirect(request.getContextPath() + "/inicioeleccion.jsp");
            return;
        }
        
        // Obtener los datos del formulario de pago
        String nombreTitular = request.getParameter("nombreTitular");
        String numeroTarjeta = request.getParameter("numeroTarjeta");
        String fechaExpiracion = request.getParameter("fechaExpiracion");
        String cvv = request.getParameter("cvv");
        
        // Validar los datos de la tarjeta
        if (nombreTitular == null || nombreTitular.trim().isEmpty() ||
            numeroTarjeta == null || numeroTarjeta.trim().isEmpty() ||
            fechaExpiracion == null || fechaExpiracion.trim().isEmpty() ||
            cvv == null || cvv.trim().isEmpty()) {
            
            request.setAttribute("error", "Por favor, completa todos los campos del formulario de pago");
            request.getRequestDispatcher("/Pago.jsp").forward(request, response);
            return;
        }
        
        // Obtener los items del carrito
        String cartItemsJson = request.getParameter("cartItems");
        if (cartItemsJson == null || cartItemsJson.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cupones.jsp");
            return;
        }
        
        try {
            // Parsear manualmente el JSON simple
            List<ItemCarrito> cartItems = parseCartItems(cartItemsJson);
            
            if (cartItems.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/cupones.jsp");
                return;
            }
            
            // Procesar la compra
            List<Cupon> cuponesComprados = cuponService.comprarCupones(usuario, cartItems);
            
            if (cuponesComprados.isEmpty()) {
                request.setAttribute("error", "No se pudo completar la compra. Por favor, inténtalo de nuevo.");
                request.getRequestDispatcher("/Pago.jsp").forward(request, response);
                return;
            }
            
            // Calcular el total pagado
            double totalPagado = 0;
            for (Cupon cupon : cuponesComprados) {
                totalPagado += cupon.getPrecio();
            }
            
            // Guardar información en la sesión para mostrar en la página de confirmación
            session.setAttribute("cuponesComprados", cuponesComprados);
            session.setAttribute("totalPagado", totalPagado);
            
            // Redirigir a una página de confirmación
            response.sendRedirect(request.getContextPath() + "/confirmacion-compra.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al procesar la compra: " + e.getMessage());
            request.getRequestDispatcher("/Pago.jsp").forward(request, response);
        }
    }
    
    // Método para parsear manualmente el JSON del carrito
    private List<ItemCarrito> parseCartItems(String json) {
        List<ItemCarrito> items = new ArrayList<>();
        
        // Eliminar los corchetes del array
        json = json.trim();
        if (json.startsWith("[")) {
            json = json.substring(1);
        }
        if (json.endsWith("]")) {
            json = json.substring(0, json.length() - 1);
        }
        
        // Dividir por objetos
        String[] objects = json.split("\\},\\{");
        
        for (String obj : objects) {
            // Limpiar el objeto
            obj = obj.trim();
            if (obj.startsWith("{")) {
                obj = obj.substring(1);
            }
            if (obj.endsWith("}")) {
                obj = obj.substring(0, obj.length() - 1);
            }
            
            // Extraer propiedades
            String id = extractProperty(obj, "id");
            String title = extractProperty(obj, "title");
            double price = Double.parseDouble(extractProperty(obj, "price"));
            
            if (id != null && title != null) {
                items.add(new ItemCarrito(id, title, price, 1));
            }
        }
        
        return items;
    }
    
    // Método auxiliar para extraer una propiedad del JSON
    private String extractProperty(String json, String property) {
        Pattern pattern = Pattern.compile("\"" + property + "\"\\s*:\\s*\"?([^\"\\},]+)\"?");
        Matcher matcher = pattern.matcher(json);
        if (matcher.find()) {
            return matcher.group(1);
        }
        return null;
    }
}
