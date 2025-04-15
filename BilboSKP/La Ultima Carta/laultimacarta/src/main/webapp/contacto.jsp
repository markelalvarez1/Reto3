<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="contacto_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylescontacto.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/includes/header.jsp"%>

	<main>
		<section class="contact-content">
			<div class="container">
				<div class="contact-grid">
					<div class="contact-form">
						<h2>
							<fmt:message key="contacto_tituloh2" />
						</h2>
						<form id="contactForm">
							<div class="form-group">
								<label for="name"><fmt:message key="contacto_nombre" /></label>
								<input type="text" id="name" name="name" required>
							</div>
							<div class="form-group">
								<label for="email"><fmt:message key="contacto_correo" /></label>
								<input type="email" id="email" name="email" required>
							</div>
							<div class="form-group">
								<label for="phone"><fmt:message key="contacto_telefono" /></label>
								<input type="tel" id="phone" name="phone">
							</div>
							<div class="form-group">
								<label for="subject"><fmt:message key="contacto_asunto" /></label>
								<input type="text" id="subject" name="subject" required>
							</div>
							<div class="form-group">
								<label for="message"><fmt:message key="contacto_mensaje" /></label>
								<textarea id="message" name="message" rows="5" required></textarea>
							</div>
							<button type="submit" class="btn-primary">
								<fmt:message key="contacto_enviar" />
							</button>
						</form>
					</div>
					<div class="contact-info">
						<h2>
							<fmt:message key="contacto_informacion" />
						</h2>
						<div class="info-item">
							<h3>
								<fmt:message key="contacto_direccion" />
							</h3>
							<p>
								<fmt:message key="contacto_direccion_detalle" />
							</p>
						</div>
						<div class="info-item">
							<h3>
								<fmt:message key="contacto_telefono" />
							</h3>
							<p>
								<fmt:message key="contacto_telefono_detalle" />
							</p>
						</div>
						<div class="info-item">
							<h3>
								<fmt:message key="contacto_email" />
							</h3>
							<p>
								<fmt:message key="contacto_email_detalle" />
							</p>
						</div>
						<div class="info-item">
							<h3>
								<fmt:message key="contacto_horario" />
							</h3>
							<p>
								<fmt:message key="contacto_horario_detalle" />
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>

	<script data-cfasync="false"
		src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script>
        // Form submission
        const contactForm = document.getElementById('contactForm');
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            // Add your form submission logic here
            alert('¡Mensaje enviado con éxito! Nos pondremos en contacto contigo pronto.');
            contactForm.reset();
        });
    </script>
</body>
</html>