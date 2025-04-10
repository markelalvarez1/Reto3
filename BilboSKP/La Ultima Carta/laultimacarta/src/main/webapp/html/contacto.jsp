<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="contacto_titulo"/></title>
    <link rel="icon" href="../Img/baldosa.png" type="image/x-icon">
    <link rel="stylesheet" href="../css/stylescontacto.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <header id="main-header">
			<div class="container">
				<a href="../Index.jsp" class="logo"><fmt:message
						key="logo_bilbao_skp" /></a>
	
				<div class="hamburger-menu">
					<div class="hamburger-icon">
						<span></span> <span></span> <span></span>
					</div>
				</div>
	
				<div class="nav-container">
					<nav>
						<ul>
							<li><a href="jugar.jsp"><fmt:message key="menu_jugar" /></a></li>
							<li><a href="gestion.jsp"><fmt:message
										key="menu_gestion" /></a></li>
							<li><a href="../Index.jsp#opinions"><fmt:message
										key="menu_opiniones" /></a></li>
							<li><a href="contacto.jsp"><fmt:message
										key="menu_contacto" /></a></li>
							<li><a href="ranking.jsp"><fmt:message key="menu_ranking" /></a></li>
						</ul>
					</nav>
					<div class="header-buttons">
						<button class="btn-primary">
							<a href="inicioeleccion.jsp"><fmt:message key="boton_iniciar" /></a>
						</button>
						<button class="btn-secondary">
							<a href="registroeleccion.jsp"><fmt:message
									key="boton_registrar" /></a>
						</button>
						<button class="btn-tertiary">
						    <a href="?lang=${sessionScope.lang eq 'en' ? 'es' : 'en'}">
						        <fmt:message key="boton_idioma" />
						    </a>
						</button>
					</div>
				</div>
			</div>
	</header>

	<main>
	    <section class="contact-content">
	        <div class="container">
	            <div class="contact-grid">
	                <div class="contact-form">
	                    <h2><fmt:message key="contacto_tituloh2" /></h2>
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
	                        <button type="submit" class="btn-primary"><fmt:message key="contacto_enviar" /></button>
	                    </form>
	                </div>
	                <div class="contact-info">
	                    <h2><fmt:message key="contacto_informacion" /></h2>
	                    <div class="info-item">
	                        <h3><fmt:message key="contacto_direccion" /></h3>
	                        <p><fmt:message key="contacto_direccion_detalle" /></p>
	                    </div>
	                    <div class="info-item">
	                        <h3><fmt:message key="contacto_telefono" /></h3>
	                        <p><fmt:message key="contacto_telefono_detalle" /></p>
	                    </div>
	                    <div class="info-item">
	                        <h3><fmt:message key="contacto_email" /></h3>
	                        <p><fmt:message key="contacto_email_detalle" /></p>
	                    </div>
	                    <div class="info-item">
	                        <h3><fmt:message key="contacto_horario" /></h3>
	                        <p><fmt:message key="contacto_horario_detalle" /></p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	</main>

	
	<footer>
			<div class="container">
				<div class="footer-scontent">
					<div class="social-links">
						<a href="https://www.instagram.com/dcdevelopment_" target="_blank"><img
							class="IG" src="../Img/igb.png" alt="Instagram"></a> <a
							href="https://www.tiktok.com/@digitalcraftdevel" target="_blank"><img
							class="TK" src="../Img/tiktokb.png" alt="TikTok"></a> <a
							href="https://x.com/Dcdevelopment_" target="_blank"><img
							class="X" src="../Img/Xb.png" alt="X"></a>
					</div>
					<div class="footer-text">
						<a href="contacto.jsp"><p>
								<fmt:message key="footer_contacto" />
							</p></a>
						<p class="copyright">
							<fmt:message key="footer_derechos" />
						</p>
					</div>
					<div class="footer-logos">
						<a href="https://appstac.ebizkaia.eus/es/inicio" target="_blank">
							<img class="diputacion" src="../Img/DiputacionBZK.png"
							alt="Diputaci�n">
						</a> <a href="../../Pagina/castellano/index.html" target="_blank">
							<img class="logo" src="../Img/DCDlogo.png" alt="DCD Logo">
						</a>
					</div>
				</div>
			</div>
	</footer>

    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script>
        // Header scroll effect
        window.addEventListener('scroll', function() {
            const header = document.getElementById('main-header');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });

        // Mobile menu toggle
        document.querySelector('.hamburger-menu').addEventListener('click', function() {
            this.classList.toggle('active');
            document.querySelector('.nav-container').classList.toggle('active');
            document.body.classList.toggle('menu-open');
        });

        document.querySelectorAll('nav ul li a').forEach(link => {
            link.addEventListener('click', function() {
                document.querySelector('.hamburger-menu').classList.remove('active');
                document.querySelector('.nav-container').classList.remove('active');
                document.body.classList.remove('menu-open');
            });
        });

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