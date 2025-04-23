<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Formulario de Registro - Bilbao SKP">
<meta name="keywords" content="registro, usuario, Bilbao, SKP">
<meta name="author" content="DC Development">
<title><fmt:message key="formulario_registro_titulo" /></title>
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
							<fmt:message key="formulario_registro_exito_individual" />
						</h1>
					</div>
					<div class="container-text">
						<p>
							<fmt:message key="formulario_registro_exito_mensaje_individual" />
						</p>
						<a href="inicio" class="success-btn"> <fmt:message
								key="formulario_registro_inicio_individual" />
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
							<fmt:message key="formulario_registro_error_individual" />
						</h1>
					</div>
					<div class="container-text">
						<p>
							<fmt:message key="formulario_registro_error_mensaje_individual" />
						</p>
						<a href="registro" class="error-btn"> <fmt:message
								key="formulario_registro_registro_individual" />
						</a>
					</div>
					</div>
				</section>
			</c:when>

		<c:otherwise>
			<section class="section-container">
				<div class="form-container">
					<h1>
						<fmt:message key="formulario_registro_titulo_individual" />
					</h1>
					<form action="registro" method="POST">
						<fieldset class="user-data">
						<input type="hidden" name="tipoSuscripcion" value="1">
							<legend><fmt:message key="datos_acceso"/></legend>
							<div class="form-group">
								<label for="email"><fmt:message key="form_email" /></label>
								<input type="email" id="email" name="correo"
									placeholder="<fmt:message key='placeholder_email' />" required>
							</div>
							<div class="form-group">
								<label for="password"><fmt:message key="form_contrasena" /></label>
								<input type="password" id="password" name="contrasena"
									placeholder="<fmt:message key='placeholder_contrasena' />" required>
							</div>
							<div class="form-group">
								<label for="repeat-password"><fmt:message key="form_repetir_contrasena" /></label>
								<input type="password" id="repeat-password" name="repetirContrasena"
									placeholder="<fmt:message key='placeholder_repetir_contrasena' />" required>
							</div>
						</fieldset>

						<fieldset class="personal-data">
							<legend><fmt:message key="datos_personales"/></legend>
							<div class="form-group">
								<label for="name"><fmt:message key="form_nombre" /></label>
								<input type="text" id="name" name="nombre"
									placeholder="<fmt:message key='placeholder_nombre' />" required>
							</div>
							<div class="form-group">
								<label for="apellidos"><fmt:message key="form_apellidos" /></label>
								<input type="text" id="apellidos" name="apellidos"
									placeholder="<fmt:message key='placeholder_apellidos' />" required>
							</div>
							<div class="form-group">
								<label for="dni"><fmt:message key="form_dni" /></label>
								<input type="text" id="dni" name="dni" minlength="9" maxlength="9"
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

