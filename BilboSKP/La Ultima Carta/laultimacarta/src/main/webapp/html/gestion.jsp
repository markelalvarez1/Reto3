<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="gestion_titulo" /></title>
<link rel="icon" href="../Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="../css/stylesgestion.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
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
						<li><a href="#"><fmt:message key="menu_gestion" /></a></li>
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
						<a href="?lang=${sessionScope.lang eq 'en' ? 'es' : 'en'}"> <fmt:message
								key="boton_idioma" />
						</a>
					</button>
				</div>
			</div>
		</div>
	</header>

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
						alt="Diputación">
					</a> <a href="../../Pagina/castellano/index.html" target="_blank">
						<img class="logo" src="../Img/DCDlogo.png" alt="DCD Logo">
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