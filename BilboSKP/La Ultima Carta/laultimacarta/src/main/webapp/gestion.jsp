<%@ include file="/WEB-INF/includes/idioma.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="gestion_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylesgestion.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
</head>
<body>
	<%@ include file="/WEB-INF/includes/header.jsp"%>

	<main>
		<div class="container dashboard-container">
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="menuperfil.jsp" class="sidebar-link active">
								<i class='bx bx-user'></i> <span><fmt:message
										key="menu_perfil" /></span>
						</a></li>
						<li><a href="ranking.jsp" class="sidebar-link"> <i
								class='bx bx-trophy'></i> <span><fmt:message
										key="menu_ranking" /></span>
						</a></li>
						<li><a href="organizarpartida.jsp" class="sidebar-link">
								<i class='bx bx-calendar'></i> <span><fmt:message
										key="menu_organizar_partida" /></span>
						</a></li>
						<li><a href="cupones.jsp" class="sidebar-link"> <i
								class='bx bx-ticket'></i> <span><fmt:message
										key="menu_obtener_cupones" /></span>
						</a></li>
						<li><a href="#" class="sidebar-link logout"> <i
								class='bx bx-log-out'></i> <span><fmt:message
										key="menu_cerrar_sesion" /></span>
						</a></li>
					</ul>
				</nav>
			</div>

			<div class="dashboard-content">
				<!-- Fila superior con dos bloques -->
				<div class="top-row">
					<!-- Bloque 1: Perfil de Usuario -->
					<div class="block profile-block">
						<h2>
							<fmt:message key="perfil_usuario" />
						</h2>
						<div class="profile-info">
							<div class="profile-avatar">
								<img src="https://via.placeholder.com/200"
									alt="<fmt:message key='avatar_usuario' />">
							</div>
							<h3>
								<fmt:message key="nombre_usuario" />
							</h3>
							<div class="level-badge">
								<fmt:message key="nivel_usuario" />
							</div>
						</div>

						<div class="profile-stats">
							<div class="stat-item">
								<p class="stat-label">
									<fmt:message key="puntos" />
								</p>
								<p class="stat-value">1250</p>
							</div>
							<div class="stat-item">
								<p class="stat-label">
									<fmt:message key="partidas" />
								</p>
								<p class="stat-value">28</p>
							</div>
							<div class="stat-item full-width">
								<p class="stat-label">
									<fmt:message key="victorias" />
								</p>
								<p class="stat-value">15</p>
							</div>
						</div>
					</div>

					<!-- Bloque 2: Mini Ranking -->
					<div class="block ranking-block">
						<h2>
							<fmt:message key="mini_ranking" />
						</h2>
						<div class="ranking-list">
							<div class="ranking-item">
								<div class="ranking-position">
									<div class="position-icon gold">
										<i class='bx bx-trophy'></i>
									</div>
									<div>
										<p class="player-name">
											<fmt:message key="jugador_1_nombre" />
										</p>
										<p class="player-points">
											<fmt:message key="jugador_1_puntos" />
										</p>
									</div>
								</div>
								<div class="position-number">#1</div>
							</div>
							<div class="ranking-item">
								<div class="ranking-position">
									<div class="position-icon silver">
										<i class='bx bx-trophy'></i>
									</div>
									<div>
										<p class="player-name">
											<fmt:message key="jugador_2_nombre" />
										</p>
										<p class="player-points">
											<fmt:message key="jugador_2_puntos" />
										</p>
									</div>
								</div>
								<div class="position-number">#2</div>
							</div>
							<div class="ranking-item">
								<div class="ranking-position">
									<div class="position-icon bronze">
										<i class='bx bx-trophy'></i>
									</div>
									<div>
										<p class="player-name">
											<fmt:message key="jugador_3_nombre" />
										</p>
										<p class="player-points">
											<fmt:message key="jugador_3_puntos" />
										</p>
									</div>
								</div>
								<div class="position-number">#3</div>
							</div>

							<div class="divider">
								<span><fmt:message key="tu_posicion" /></span>
							</div>

							<div class="ranking-item current-user">
								<div class="ranking-position">
									<div class="position-icon user">
										<i class='bx bx-trophy'></i>
									</div>
									<div>
										<p class="player-name">
											<fmt:message key="nombre_usuario" />
										</p>
										<p class="player-points">
											<fmt:message key="usuario_puntos" />
										</p>
									</div>
								</div>
								<div class="position-number">#8</div>
							</div>

							<div class="view-all">
								<a href="ranking.jsp"><fmt:message
										key="ver_ranking_completo" /></a>
							</div>
						</div>
					</div>
				</div>

				<!-- Bloque 3: Opciones -->
				<div class="block options-block">
					<h2>
						<fmt:message key="opciones" />
					</h2>
					<div class="options-grid">
						<!-- Opción: Organizar Partida -->
						<div class="option-card blue-gradient">
							<h3>
								<fmt:message key="organizar_partida" />
							</h3>
							<div class="option-features">
								<div class="option-feature">
									<div class="feature-icon blue">
										<i class='bx bx-calendar'></i>
									</div>
									<div class="feature-text">
										<h4>
											<fmt:message key="crear_partida" />
										</h4>
										<p>
											<fmt:message key="crear_partida_desc" />
										</p>
									</div>
								</div>
								<div class="option-feature">
									<div class="feature-icon blue">
										<i class='bx bx-group'></i>
									</div>
									<div class="feature-text">
										<h4>
											<fmt:message key="unirse_partida" />
										</h4>
										<p>
											<fmt:message key="unirse_partida_desc" />
										</p>
									</div>
								</div>
								<button class="action-button blue">
									<a href="gestion.html"><fmt:message
											key="gestionar_partidas" /></a>
								</button>
							</div>
						</div>

						<!-- Opción: Adquirir Cupones -->
						<div class="option-card amber-gradient">
							<h3>
								<fmt:message key="adquirir_cupones" />
							</h3>
							<div class="option-features">
								<div class="option-feature">
									<div class="feature-icon amber">
										<i class='bx bx-ticket'></i>
									</div>
									<div class="feature-text">
										<h4>
											<fmt:message key="comprar_cupones" />
										</h4>
										<p>
											<fmt:message key="comprar_cupones_desc" />
										</p>
									</div>
								</div>
								<div class="option-feature">
									<div class="feature-icon amber">
										<i class='bx bx-gift'></i>
									</div>
									<div class="feature-text">
										<h4>
											<fmt:message key="canjear_premios" />
										</h4>
										<p>
											<fmt:message key="canjear_premios_desc" />
										</p>
									</div>
								</div>
								<button class="action-button amber">
									<a href="cupones.html"><fmt:message key="ver_cupones" /></a>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	</main>

	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
</body>
</html>