<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="seleccion_registro_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylesregistro.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/includes/header.jsp"%>

	<main>
		<c:choose>
			<c:when test="${not empty param.exito && param.exito eq 'true'}">
				<section class="section-container">
					<div class="container-success">
						<div class="message-container success-mode">
							<h1>
								<fmt:message key="formulario_registro_exito_individual" />
							</h1>
						</div>
						<div class="container-text">
							<p>
								<fmt:message key="verificacion_exito_true" />
							</p>
							<a href="inicioSesion" class="success-btn"> <fmt:message
									key="boton_iniciar" />
							</a>
						</div>
					</div>
				</section>
			</c:when>

			<c:when test="${not empty param.exito && param.exito eq 'false'}">
				<section class="section-container">
					<div class="container-success">
						<div class="message-container error-mode">
							<h1>
								<fmt:message key="formulario_registro_error_individual" />
							</h1>
						</div>
						<div class="container-text">
							<p>
								<fmt:message key="verificacion_exito_false" />
							</p>
							<a href="inicio" class="error-btn"> <fmt:message
									key="formulario_registro_inicio_individual" />
							</a>
						</div>
					</div>
				</section>
			</c:when>

			<c:otherwise>

			</c:otherwise>
		</c:choose>
	</main>

	<%@ include file="/WEB-INF/includes/footer.jsp"%>

	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>

</body>
</html>
