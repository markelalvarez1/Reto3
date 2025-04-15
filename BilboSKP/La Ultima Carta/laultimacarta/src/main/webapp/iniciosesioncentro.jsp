<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="iniciarsesioncentro_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylesregistro.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/includes/header.jsp"%>

	<main>
		<div class="container">
			<div class="form-container">
				<h1>
					<fmt:message key="inicio_sesion_colegio" />
				</h1>

				<div class="form-content">
					<div id="individual-form" class="form-fields">
						<div class="form-group">
							<label for="school-cif"><fmt:message key="etiqueta_cif" /></label>
							<input type="text" id="school-cif" name="school-cif"
								placeholder="<fmt:message key='placeholder_cif' />">
						</div>

						<div class="form-group">
							<label for="school-username"><fmt:message
									key="etiqueta_usuario_admin" /></label> <input type="text"
								id="school-username" name="school-username"
								placeholder="<fmt:message key='placeholder_usuario_admin' />">
						</div>

						<div class="form-group">
							<label for="school-password"><fmt:message
									key="etiqueta_contrasena" /></label> <input type="password"
								id="school-password" name="school-password"
								placeholder="<fmt:message key='placeholder_contrasena' />">
						</div>

						<button class="submit-btn">
							<fmt:message key="boton_enviar" />
						</button>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
</body>
</html>