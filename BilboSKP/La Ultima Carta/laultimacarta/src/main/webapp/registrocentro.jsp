<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
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
	<%@ include file="/WEB-INF/includes/header.jsp"%>

	<main>
		<c:choose>
			<c:when test="${param.exito eq 'true'}">
				<section class="section-container">
					<div class="container-success">
					<div class="message-container success-mode">
						<h1>
							<fmt:message key="formulario_registro_exito_centro" />
						</h1>
					</div>
					<div class="container-text">
						<p>
							<fmt:message key="formulario_registro_exito_mensaje_centro" />
						</p>
						<a href="inicio" class="success-btn"> <fmt:message
								key="formulario_registro_inicio_centro" />
						</a>
					</div>
					</div>
				</section>
			</c:when>

			<c:when test="${param.exito eq 'false'}">
				<section class="section-container">
					<div class="container-success">
					<div class="message-container error-mode">
						<h1>
							<fmt:message key="formulario_registro_error_centro" />
						</h1>
					</div>
					<div class="container-text">
						<p>
							<fmt:message key="formulario_registro_error_mensaje_centro" />
						</p>
						<a href="registroCentro" class="error-btn"> <fmt:message
								key="formulario_registro_registro_centro" />
						</a>
					</div>
					</div>
				</section>
			</c:when>

			<c:otherwise>
				<section class="section-container">
					<div class="form-container">
						<h1>
							<fmt:message key="formulario_registro_titulo" />
						</h1>
						<form action="nuevoRegistroController" method="post">
							<fieldset class="user-data">
								<legend><fmt:message key="datos_acceso"/></legend>
								<input type="hidden" name="tipoSuscripcion" value="2">
								<div class="form-group">
									<label for="email"><fmt:message key="form_email" /></label> <input
										type="email" id="email" name="correo"
										placeholder="<fmt:message key='placeholder_email' />" required>
								</div>
								<div class="form-group">
									<label for="password"><fmt:message
											key="form_contrasena" /></label> <input type="password"
										id="password" name="contrasena"
										placeholder="<fmt:message key='placeholder_contrasena' />"
										required>
								</div>
								<div class="form-group">
									<label for="repeat-password"><fmt:message
											key="form_repetir_contrasena" /></label> <input type="password"
										id="repeat-password" name="repetirContrasena"
										placeholder="<fmt:message key='placeholder_repetir_contrasena' />"
										required>
								</div>
							</fieldset>
							<fieldset class="personal-data">
								<legend><fmt:message key="datos_personales"/></legend>
								<div class="form-group">
									<label for="nombre"><fmt:message key="form_nombre" /></label>
									<input type="text" id="nombre" name="nombre"
										placeholder="<fmt:message key='placeholder_nombre' />"
										required>
								</div>
								<div class="form-group">
									<label for="apellidos"><fmt:message
											key="form_apellidos" /></label> <input type="text" id="apellidos"
										name="apellidos"
										placeholder="<fmt:message key='placeholder_apellidos' />"
										required>
								</div>
								<div class="form-group">
									<label for="dni"><fmt:message key="form_dni" /></label> <input
										type="text" id="dni" name="dni" minlength="9" maxlength="9"
										placeholder="<fmt:message key='placeholder_dni' />" required
										pattern="[A-Z0-9]{8}[A-Z]{1}">
								</div>
								<div class="form-group">
									<label for="phone"><fmt:message key="form_telefono" /></label>
									<input type="tel" id="phone" name="telefono"
										placeholder="<fmt:message key='placeholder_telefono' />"
										required pattern="\d{9}">
								</div>
							</fieldset>
							<fieldset class="school-data">
								<legend><fmt:message key="datos_centro"/></legend>
								<div class="form-group">
									<label for="school-cif"><fmt:message
											key="form_cif_centro" /></label> <input type="text" id="school-cif"
										name="cif" placeholder="<fmt:message key='placeholder_cif' />"
										required>
								</div>
								<div class="form-group">
									<label for="school-name"><fmt:message
											key="form_nombre_centro" /></label> <input type="text"
										id="school-name" name="nombreCentro"
										placeholder="<fmt:message key='placeholder_nombre' />"
										required>
								</div>
								<div class="form-group">
									<label for="phoneCentro"><fmt:message
											key="form_telefono" /></label> <input type="tel" id="phoneCentro"
										name="telefonoCentro"
										placeholder="<fmt:message key='placeholder_telefono' />"
										required pattern="\d{9}">
								</div>
								<div class="form-group">
									<label for="correoCentro"><fmt:message
											key="form_correo_centro" /></label> <input type="email"
										id="correoCentro" name="correoCentro"
										placeholder="<fmt:message key='placeholder_correo_centro' />"
										required>
								</div>
								<div class="form-group">
									<label for="school-city"><fmt:message
											key="form_ciudad_centro" /></label> <input type="text"
										id="school-city" name="ciudad"
										placeholder="<fmt:message key='placeholder_ciudad_centro' />"
										required>
								</div>
								<div class="form-group">
									<label for="school-students"><fmt:message
											key="form_numero_alumnos" /></label> <input type="number"
										id="school-students" name="numeroAlumnos"
										placeholder="<fmt:message key='placeholder_numero_alumnos' />"
										required>
								</div>
								<div class="form-group">
									<label for="school-education-stage"><fmt:message
											key="form_etapa_educativa" /></label> <input type="text"
										id="school-education-stage" name="etapaEducativa"
										placeholder="<fmt:message key='placeholder_etapa_educativa' />"
										required>
								</div>
							</fieldset>

							<button type="submit" class="submit-btn">
								<fmt:message key="boton_enviar" />
							</button>
						</form>
					</div>
				</section>
			</c:otherwise>
		</c:choose>
	</main>

	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
	
</body>
</html>