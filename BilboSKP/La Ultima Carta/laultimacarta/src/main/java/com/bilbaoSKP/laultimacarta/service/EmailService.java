package com.bilbaoSKP.laultimacarta.service;

import java.util.Properties;

import com.bilbaoSKP.laultimacarta.model.Usuario;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailService {

	 // PARA CONFIGURAR LA CONTRASENA ESPECIAL PARA ESTE CORREO ACCEDER A
	 // https://myaccount.google.com/security 
	 private final String remitente = "dcraftdevelopment@gmail.com"; // Aqui correo que va a enviar el mensaje
     private final String password = "uacqktobqxkphlca";  // Contrasena configurada desde Google (No es la contrase�a del correo)
     
     public boolean enviarCorreoVerificacion(Usuario u) {
    	
         // 1. Configuracion de propiedades SMTP
         Properties propiedades = getProperties();

         // 2. Crear la sesion con autenticaci�n
         Session session = getSessionInstance(propiedades);

         try {
             // 3. Crear el mensaje
             Message message = new MimeMessage(session);
             message.setFrom(new InternetAddress(remitente));
             message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(u.getCorreo()));
             message.setSubject("Correo de verificación");
             String codigoVerificacion = codificador(u);
             String html = crearHtmlVerificacion(u, codigoVerificacion);
             message.setContent(html, "text/html");

             // 4. Enviar el mensaje
             Transport.send(message);

         } catch (MessagingException e) {
             e.printStackTrace();
             return false;
         } catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    	 
		return true;
     }

	private String codificador(Usuario u) {
		StringBuilder str = new StringBuilder();
		str.append(u.getSuscripcion().getId()).append(";").append(u.getSuscripcion().getCodigoAcceso());
		return CodificadorService.codificar(str.toString());
	}

	private Session getSessionInstance(Properties props) {
		Session session = Session.getInstance(props, new Authenticator() {
             protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(remitente, password);
             }
         });
		return session;
	}

	private Properties getProperties() {
		Properties props = new Properties();
         props.put("mail.smtp.auth", "true");
         props.put("mail.smtp.starttls.enable", "true");
         props.put("mail.smtp.host", "smtp.gmail.com"); // SI EL CORREO DE REMITENTE ES DIFERENTE A GMAIL CAMBIAR ESTE PARAMETRO
         props.put("mail.smtp.port", "587");
		return props;
	}
	
	private String crearHtmlVerificacion(Usuario u, String codigoVerificacion) {
		String html = "<html>"
		         + "  <head>"
		         + "    <meta charset='UTF-8'>"
		         + "    <style type='text/css'>"
		         + "      body {"
		         + "        font-family: Arial, sans-serif;"
		         + "        background-color: #f4f4f4;"
		         + "        color: #333;"
		         + "        margin: 0;"
		         + "        padding: 0;"
		         + "      }"
		         + "      .container {"
		         + "        max-width: 600px;"
		         + "        margin: 30px auto;"
		         + "        background-color: #fff;"
		         + "        padding: 20px;"
		         + "        border-radius: 8px;"
		         + "        box-shadow: 0 2px 4px rgba(0,0,0,0.1);"
		         + "      }"
		         + "      .header {"
		         + "        text-align: center;"
		         + "        background-color: #4CAF50;"
		         + "        padding: 20px;"
		         + "        color: #fff;"
		         + "        border-radius: 8px 8px 0 0;"
		         + "      }"
		         + "      .content {"
		         + "        margin-top: 20px;"
		         + "        line-height: 1.6;"
		         + "      }"
		         + "      .button {"
		         + "        display: inline-block;"
		         + "        background-color: #4CAF50;"
		         + "        color: #fff;"
		         + "        padding: 10px 20px;"
		         + "        text-decoration: none;"
		         + "        border-radius: 5px;"
		         + "        font-size: 16px;"
		         + "        margin-top: 20px;"
		         + "      }"
		         + "      .footer {"
		         + "        font-size: 12px;"
		         + "        color: #777;"
		         + "        text-align: center;"
		         + "        margin-top: 30px;"
		         + "      }"
		         + "    </style>"
		         + "  </head>"
		         + "  <body>"
		         + "    <div class='container'>"
		         + "      <div class='header'>"
		         + "        <h1>Verificación de Cuenta</h1>"
		         + "      </div>"
		         + "      <div class='content'>"
		         + "        <p>Hola, <strong>" + u.getNombre() + "</strong>!</p>"
		         + "        <p>Gracias por solicitar la suscripción. Para activar tu cuenta, por favor pulsa el botón de abajo:</p>"
		         + "        <p style='text-align: center;'>"
		         + "          <a class='button' href='http://localhost:8080/laultimacarta/verificar?codigo=" + codigoVerificacion + "' target='_blank'>Verificar mi cuenta</a>"  
		         + "        </p>"
		         + "        <p>Si no solicitaste esta acción, ignora este correo.</p>"
		         + "      </div>"
		         + "      <div class='footer'>"
		         + "        <p>¿Necesitas ayuda? Contáctanos en <a href='http://localhost:8080/laultimacarta/contacto.jsp'>Contacto</a></p>"
		         + "        <p>&copy; 2025 BilboSKP. Todos los derechos reservados.</p>"
		         + "      </div>"
		         + "    </div>"
		         + "  </body>"
		         + "</html>";
		return html;
	}
}
