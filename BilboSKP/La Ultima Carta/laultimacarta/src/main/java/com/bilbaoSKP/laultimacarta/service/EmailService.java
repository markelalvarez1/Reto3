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

	 // PARA CONFIGURAR LA CONTRASE�A ESPECIAL PARA ESTE CORREO ACCEDER A
	 // https://myaccount.google.com/security 
	 private final String remitente = "dcraftdevelopment@gmail.com"; // Aqui correo que va a enviar el mensaje
     private final String password = "uacqktobqxkphlca";  // Contrase�a configurada desde Google (No es la contrase�a del correo)
     
     public boolean enviarCorreoVerificacion(Usuario u) {
    	
         // 1. Configuraci�n de propiedades SMTP
         Properties propiedades = getProperties();

         // 2. Crear la sesi�n con autenticaci�n
         Session session = getSessionInstance(propiedades);

         try {
             // 3. Crear el mensaje
             Message message = new MimeMessage(session);
             message.setFrom(new InternetAddress(remitente));
             message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(u.getCorreo()));
             message.setSubject("Correo de verificaci�n");
             String html = "<h1>Codigo de verificación</h1><p>Tu codigo de verificaci�n es : " + u.getSuscripcion().getCodigoAcceso() + "</p>";
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
         props.put("mail.smtp.host", "smtp.gmail.com"); // SI EL CORREO ES DIFERENTE A GMAIL CAMBIAR ESTE PARAMETRO
         props.put("mail.smtp.port", "587");
		return props;
	}
	
}
