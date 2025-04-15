<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="seleccion_registro_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylesregistroeleccion.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/includes/header.jsp"%>

	<main class="registration-selection">
		<div class="container">
			<h1 class="page-title">
				<fmt:message key="seleccion_registro_titulo" />
			</h1>

			<div class="registration-options">
				<a href="registroindividual.jsp" class="registration-option">
					<div class="registration-box">
						<div class="icon-container">
							<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="1.5" stroke-linecap="round"
								stroke-linejoin="round">
                                <path
									d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
						</div>
						<h2>
							<fmt:message key="registro_individual_titulo" />
						</h2>
						<p class="option-description">
							<fmt:message key="registro_individual_descripcion" />
						</p>
					</div>
				</a> <a href="registrocentro.jsp" class="registration-option">
					<div class="registration-box">
						<div class="icon-container">
							<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="1.5" stroke-linecap="round"
								stroke-linejoin="round">
                                <path
									d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                <polyline points="9 22 9 12 15 12 15 22"></polyline>
                            </svg>
						</div>
						<h2>
							<fmt:message key="registro_centro_titulo" />
						</h2>
						<p class="option-description">
							<fmt:message key="registro_centro_descripcion" />
						</p>
					</div>
				</a>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
	
</body>
</html>
