package com.bilbaoSKP.laultimacarta.service;

import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

public class StripeService {

	public Session crearSesionDePago(TipoSuscripcion ts, Long precio) throws StripeException {
        Stripe.apiKey = "sk_test_51RCd3SGPspIiCzVgdDo1XdK3ZhnWiE5ZMP3jBVKOgDqJPPIa5ryCVhZqI4qeMeqq3aQCIvRvU7IRodLRab5nrmcL00YZL80HmV";

        SessionCreateParams params = SessionCreateParams.builder()
            .setMode(SessionCreateParams.Mode.PAYMENT)
            .setSuccessUrl("http://localhost:8080/laultimacarta/pagoExitoso")
            .setCancelUrl("http://localhost:8080/laultimacarta/registro?error=errorpago")
            .addPaymentMethodType(SessionCreateParams.PaymentMethodType.CARD)
            .addLineItem(
                SessionCreateParams.LineItem.builder()
                    .setQuantity(1L)
                    .setPriceData(
                        SessionCreateParams.LineItem.PriceData.builder()
                            .setCurrency("eur")
                            .setUnitAmount(precio)
                            .setProductData(
                                SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                    .setName("Suscripción " + ts.getTipo())
                                    .build()
                            )
                            .build()
                    )
                    .build()
            )
            .build();

        return Session.create(params);
    }
	
	private static final String API_KEY = "sk_test_51RCd3SGPspIiCzVgdDo1XdK3ZhnWiE5ZMP3jBVKOgDqJPPIa5ryCVhZqI4qeMeqq3aQCIvRvU7IRodLRab5nrmcL00YZL80HmV";
    private static final double PRECIO_CUPON = 2.50;
    
    public Session crearSesionDePagoCupones(int cantidad) throws StripeException {
        Stripe.apiKey = API_KEY;
        
      
        long precioTotal = Math.round(cantidad * PRECIO_CUPON * 100); 
        
        SessionCreateParams params = SessionCreateParams.builder()
            .setMode(SessionCreateParams.Mode.PAYMENT)
            .setSuccessUrl("http://localhost:8080/laultimacarta/procesarCompra?accion=confirmar")
            .setCancelUrl("http://localhost:8080/laultimacarta/cupones?error=errorpago")
            .addPaymentMethodType(SessionCreateParams.PaymentMethodType.CARD)
            .addLineItem(
                SessionCreateParams.LineItem.builder()
                    .setQuantity(1L)
                    .setPriceData(
                        SessionCreateParams.LineItem.PriceData.builder()
                            .setCurrency("eur")
                            .setUnitAmount(precioTotal)
                            .setProductData(
                                SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                    .setName("Compra de " + cantidad + " cupones")
                                    .setDescription("Cupones para Escape Room BilbaoSKP")
                                    .build()
                            )
                            .build()
                    )
                    .build()
            )
            .build();
        
        return Session.create(params);
    }
	
}
