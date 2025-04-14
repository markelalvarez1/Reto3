<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="registro_centro_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylesregistro.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<header id="main-header">
		<div class="container">
			<a href="Index.jsp" class="logo"><fmt:message
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
						<li><a href="gestion.jsp"><fmt:message key="menu_gestion" /></a></li>
						<li><a href="Index.jsp#opinions"><fmt:message
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
						<a href="?lang=${sessionScope.lang eq 'en' ? 'es' : 'en'}"> <fmt:message
								key="boton_idioma" />
						</a>
					</button>
				</div>
			</div>
		</div>
	</header>

	<main>
		<div class="container">
			<div class="form-container">
				<h1>
					<c:choose>
						<c:when test="${param.exito == 'true'}">
							<fmt:message key="formulario_registro_exito" />
						</c:when>
						<c:otherwise>
							<fmt:message key="formulario_registro_titulo" />
						</c:otherwise>
					</c:choose>
				</h1>
				<c:choose>
					<c:when test="${param.exito == 'true'}">
						<div class="success-message">
							<p>
								<fmt:message key="formulario_registro_exito_mensaje" />
							</p>
							<a href="inicio"><fmt:message
									key="formulario_registro_inicio" /></a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="form-content">
							<div id="individual-form" class="form-fields">
								<form action="registroCentro" method="post">
									<!-- Datos de acceso -->
									<fieldset class="user-data">
										<legend>Datos de acceso</legend>
										<div class="form-group">
											<label for="email"><fmt:message key="form_email" /></label>
											<input type="email" id="email" name="correo"
												placeholder="<fmt:message key='placeholder_email' />"
												aria-label="Correo electrónico" required>
										</div>
										<div class="form-group">
											<label for="password"><fmt:message
													key="form_contrasena" /></label> <input type="password"
												id="password" name="contrasena"
												placeholder="<fmt:message key='placeholder_contrasena' />"
												aria-label="Contraseña" required>
										</div>
										<div class="form-group">
											<label for="repeat-password"><fmt:message
													key="form_repetir_contrasena" /></label> <input type="password"
												id="repeat-password" name="repetirContrasena"
												placeholder="<fmt:message key='placeholder_repetir_contrasena' />"
												aria-label="Repetir contraseña" required>
										</div>
									</fieldset>

									<!-- Datos personales -->
									<fieldset class="personal-data">
										<legend>Datos personales</legend>
										<div class="form-group">
											<label for="nombre"><fmt:message key="form_nombre" /></label>
											<input type="text" id="nombre" name="nombre"
												placeholder="<fmt:message key='placeholder_nombre' />"
												aria-label="Nombre" required>
										</div>
										<div class="form-group">
											<label for="apellidos"><fmt:message
													key="form_apellidos" /></label> <input type="text" id="apellidos"
												name="apellidos"
												placeholder="<fmt:message key='placeholder_apellidos' />"
												aria-label="Apellidos" required>
										</div>
										<div class="form-group">
											<label for="dni"><fmt:message key="form_dni" /></label> <input
												type="text" id="dni" name="dni" minlength="9" maxlength="9"
												placeholder="<fmt:message key='placeholder_dni' />"
												aria-label="DNI" required pattern="[A-Z0-9]{8}[A-Z]{1}">
										</div>
										<div class="form-group">
											<label for="phone"><fmt:message key="form_telefono" /></label>
											<input type="tel" id="phone" name="telefono"
												placeholder="<fmt:message key='placeholder_telefono' />"
												aria-label="Teléfono" required pattern="\d{9}">
										</div>
									</fieldset>

									<!-- Datos del centro educativo -->
									<fieldset class="school-data">
										<legend>Datos del centro</legend>
										<div class="form-group">
											<label for="school-name"><fmt:message
													key="form_nombre_centro" /></label> <input type="text"
												id="school-name" name="nombreCentro"
												placeholder="<fmt:message key='placeholder_nombre' />"
												aria-label="Nombre del centro" required>
										</div>
										<div class="form-group">
											<label for="school-cif"><fmt:message
													key="form_cif_centro" /></label> <input type="text"
												id="school-cif" name="cif"
												placeholder="<fmt:message key='placeholder_cif' />"
												aria-label="CIF del centro" required>
										</div>
										<div class="form-group">
											<label for="school-address1"><fmt:message
													key="form_correo_centro" /></label> <input type="text"
												id="school-address1" name="direccionCentro"
												placeholder="<fmt:message key='placeholder_correo_centro' />"
												aria-label="Dirección del centro" required>
										</div>
										<div class="form-group">
											<label for="school-city"><fmt:message
													key="form_ciudad_centro" /></label> <input type="text"
												id="school-city" name="ciudad"
												placeholder="<fmt:message key='placeholder_ciudad_centro' />"
												aria-label="Ciudad del centro" required>
										</div>
										<div class="form-group">
											<label for="school-students"><fmt:message
													key="form_numero_alumnos" /></label> <input type="number"
												id="school-students" name="numeroAlumnos"
												placeholder="<fmt:message key='placeholder_numero_alumnos' />"
												aria-label="Número de alumnos" required>
										</div>
										<div class="form-group">
											<label for="school-education-stage"><fmt:message
													key="form_etapa_educativa" /></label> <input type="text"
												id="school-education-stage" name="etapaEducativa"
												placeholder="<fmt:message key='placeholder_etapa_educativa' />"
												aria-label="Etapa educativa" required>
										</div>
										<div class="form-group">
											<input type="hidden" name="rol" value="3"> <input
												type="hidden" name="tipoSuscripcion" value="2">
										</div>
									</fieldset>

									<button type="submit" class="submit-btn">
										<fmt:message key="boton_enviar" />
									</button>
								</form>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</main>

	<footer>
		<div class="container">
			<div class="footer-scontent">
				<div class="social-links">
					<a href="https://www.instagram.com/dcdevelopment_" target="_blank"><img
						class="IG" src="Img/igb.png" alt="Instagram"></a> <a
						href="https://www.tiktok.com/@digitalcraftdevel" target="_blank"><img
						class="TK" src="Img/tiktokb.png" alt="TikTok"></a> <a
						href="https://x.com/Dcdevelopment_" target="_blank"><img
						class="X" src="Img/Xb.png" alt="X"></a>
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
						<img class="diputacion" src="Img/DiputacionBZK.png"
						alt="Diputación">
					</a> <a href="../../Pagina/castellano/index.html" target="_blank">
						<img class="logo" src="Img/DCDlogo.png" alt="DCD Logo">
					</a>
				</div>
			</div>
		</div>
	</footer>

	<script>
        window.addEventListener('scroll', function() {
            const header = document.getElementById('main-header');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });

        // Mobile menu toggle
        document.addEventListener('DOMContentLoaded', function() {
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
        });
    </script>
</body>
</html>