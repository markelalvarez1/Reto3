package com.bilbaoSKP.laultimacarta.service;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

public class StripeService {

	public Session crearSesionDePago() throws StripeException {
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
                            .setUnitAmount(500L)
                            .setProductData(
                                SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                    .setName("Suscripción")
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
