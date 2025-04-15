<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="iniciarsesionindividual_titulo" /></title>
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
					<fmt:message key="inicio_sesion" />
				</h1>

				<div class="form-content">
					<div id="individual-form" class="form-fields">
						<div class="form-group">
							<label for="email"><fmt:message key="correo_electronico" /></label>
							<input type="email" id="email" name="email"
								placeholder="<fmt:message key='placeholder_email' />">
						</div>

						<div class="form-group">
							<label for="password"><fmt:message key="contrasena" /></label> <input
								type="password" id="password" name="password"
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