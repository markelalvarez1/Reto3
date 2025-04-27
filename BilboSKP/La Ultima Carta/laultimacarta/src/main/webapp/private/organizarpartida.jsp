<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="organizarpartida_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylesorganizarpartida.css">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/includes/header.jsp"%>

	<main>
		<%@ include file="/WEB-INF/includes/sidebar.jsp"%>
		<div style="width: 100%;display: flex;flex-direction: column; gap: 1em;">
			<div class="dashboard-container">
				<!-- Título principal -->
				<section class="dashboard-summary">
					<h1><fmt:message key="organizarpartida_titulo" /></h1>
					
					<!-- Tarjetas de resumen -->
					<div class="stats-grid">
						<!-- Partidas disponibles -->
						<div class="stat-card">
							<div class="stat-icon active">
								<i class="fas fa-gamepad"></i>
							</div>
							<div class="stat-info">
								<h3>Partidas disponibles</h3>
								<p class="stat-number">4</p>
							</div>
						</div>

						<!-- Historial de partidas -->
						<a href="historialPartidas" class="stat-card">
							<div class="stat-icon pending">
								<i class="fas fa-history"></i>
							</div>
							<div class="stat-info">
								<h3>Historial de Partidas</h3>
								<p class="stat-number">2</p>
							</div>
						</a>

						<!-- Crear partida -->
						<a href="crearpartida.jsp" class="stat-card">
							<div class="stat-icon pending">
								<i class="fas fa-calendar-plus"></i>
							</div>
							<div class="stat-info">
								<h3>Crear nueva partida</h3>
								<p class="stat-description">Organiza una nueva sesión de juego</p>
							</div>
						</a>
					</div>
				</section>
			</div>
			
			<!-- Sección de Escape Rooms disponibles -->
			<div class="dashboard-container">
				<section class="scaperooms-section secstyle">
					<div class="section-header">
						<h2>Scaperooms disponibles</h2>
						<div class="section-divider"></div>
					</div>

					<!-- Lista de Escape Rooms -->
					<div class="scaperooms-grid">
						<!-- Escape Room 1: La Última Carta -->
						<div class="scaperoom-card">
							<div class="scaperoom-header">
								<h3>La Última Carta</h3>
								<div class="badges">
									<span class="badge difficulty-medium">Dificultad media</span>
									<span class="badge players"><i class="fas fa-users"></i> 2-5</span>
									<span class="badge duration"><i class="far fa-clock"></i> 60 min</span>
								</div>
							</div>
							<div class="scaperoom-content">
								<p class="scaperoom-description">Una aventura llena de misterio y decisiones importantes. ¿Serás capaz de resolver todos los acertijos y encontrar la última carta a tiempo?</p>
								<div class="scaperoom-details">
									<div class="detail-item">
										<span class="detail-label"><i class="fas fa-star"></i> Valoración:</span>
										<span class="detail-value">4.8/5</span>
									</div>
									<div class="detail-item">
										<span class="detail-label"><i class="fas fa-trophy"></i> Tasa de éxito:</span>
										<span class="detail-value">67%</span>
									</div>
								</div>
								<a href="crearpartida.jsp?room=ultima-carta" class="btn-organizar">
									<i class="fas fa-calendar-check"></i>
									Organizar Partida
								</a>
							</div>
						</div>

						<!-- Escape Room 2: El Misterio de Bilbao -->
						<div class="scaperoom-card">
							<div class="scaperoom-header">
								<h3>El Misterio de Bilbao</h3>
								<div class="badges">
									<span class="badge difficulty-hard">Dificultad alta</span>
									<span class="badge players"><i class="fas fa-users"></i> 3-6</span>
									<span class="badge duration"><i class="far fa-clock"></i> 75 min</span>
								</div>
							</div>
							<div class="scaperoom-content">
								<p class="scaperoom-description">Adéntrate en las calles de Bilbao para resolver un antiguo misterio. Una experiencia desafiante que pondrá a prueba tu ingenio y trabajo en equipo.</p>
								<div class="scaperoom-details">
									<div class="detail-item">
										<span class="detail-label"><i class="fas fa-star"></i> Valoración:</span>
										<span class="detail-value">4.6/5</span>
									</div>
									<div class="detail-item">
										<span class="detail-label"><i class="fas fa-trophy"></i> Tasa de éxito:</span>
										<span class="detail-value">42%</span>
									</div>
								</div>
								<a href="crearpartida.jsp?room=misterio-bilbao" class="btn-organizar">
									<i class="fas fa-calendar-check"></i>
									Organizar Partida
								</a>
							</div>
						</div>

						<!-- Escape Room 3: El Secreto de la Ría -->
						<div class="scaperoom-card">
							<div class="scaperoom-header">
								<h3>El Secreto de la Ría</h3>
								<div class="badges">
									<span class="badge difficulty-easy">Dificultad baja</span>
									<span class="badge players"><i class="fas fa-users"></i> 2-4</span>
									<span class="badge duration"><i class="far fa-clock"></i> 45 min</span>
								</div>
							</div>
							<div class="scaperoom-content">
								<p class="scaperoom-description">Embárcate en una aventura familiar para descubrir los secretos que esconde la Ría de Bilbao. Una experiencia ideal para principiantes.</p>
								<div class="scaperoom-details">
									<div class="detail-item">
										<span class="detail-label"><i class="fas fa-star"></i> Valoración:</span>
										<span class="detail-value">4.5/5</span>
									</div>
									<div class="detail-item">
										<span class="detail-label"><i class="fas fa-trophy"></i> Tasa de éxito:</span>
										<span class="detail-value">78%</span>
									</div>
								</div>
								<a href="crearpartida.jsp?room=secreto-ria" class="btn-organizar">
									<i class="fas fa-calendar-check"></i>
									Organizar Partida
								</a>
							</div>
						</div>

						<!-- Escape Room 4: La Catedral Olvidada -->
						<div class="scaperoom-card">
							<div class="scaperoom-header">
								<h3>La Catedral Olvidada</h3>
								<div class="badges">
									<span class="badge difficulty-medium">Dificultad media</span>
									<span class="badge players"><i class="fas fa-users"></i> 3-8</span>
									<span class="badge duration"><i class="far fa-clock"></i> 90 min</span>
								</div>
							</div>
							<div class="scaperoom-content">
								<p class="scaperoom-description">Explora una antigua catedral abandonada llena de enigmas y misterios. Una experiencia inmersiva para grupos más grandes.</p>
								<div class="scaperoom-details">
									<div class="detail-item">
										<span class="detail-label"><i class="fas fa-star"></i> Valoración:</span>
										<span class="detail-value">4.9/5</span>
									</div>
									<div class="detail-item">
										<span class="detail-label"><i class="fas fa-trophy"></i> Tasa de éxito:</span>
										<span class="detail-value">52%</span>
									</div>
								</div>
								<a href="crearpartida.jsp?room=catedral-olvidada" class="btn-organizar">
									<i class="fas fa-calendar-check"></i>
									Organizar Partida
								</a>
							</div>
						</div>
					</div>
				</section>
			</div>

			<!-- Sección de Mis Partidas Recientes -->
			<div class="dashboard-container">
				<section class="mis-partidas-section secstyle">
					<div class="section-header">
						<h2>Mis partidas recientes</h2>
						<div class="section-divider"></div>
					</div>

					<div class="partidas-container">
						<div class="partidas-empty">
							<i class="fas fa-calendar-times"></i>
							<p>No tienes partidas disponibles</p>
							<a href="crearpartida.jsp" class="btn-crear-partida">
								<i class="fas fa-plus-circle"></i>
								Crear tu primera partida
							</a>
						</div>
					</div>
				</section>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
</body>
</html>