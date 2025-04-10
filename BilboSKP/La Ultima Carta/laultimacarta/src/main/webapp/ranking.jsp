<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="ranking_titulo" /></title>
<link rel="stylesheet" href="css/stylesranking.css">
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
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
						<li><a href="#"><fmt:message key="menu_ranking" /></a></li>
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
		<div class="max-width">
			<div class="page-header">
				<h1>
					<fmt:message key="ranking_nacional" />
				</h1>
				<p>
					<fmt:message key="clasificacion_actual" />
				</p>
			</div>

			<div class="grid grid-cols-3">
				<!-- Main Ranking -->
				<div class="main-content">
					<div class="card">
						<div class="card-header">
							<div class="card-badge">
								<span class="icon icon-trophy"></span> <span><fmt:message
										key="clasificacion_general" /></span>
							</div>
							<h2 class="card-title">
								<fmt:message key="top_performers_2025" />
							</h2>
							<p class="card-description">
								<fmt:message key="mejores_participantes" />
							</p>
						</div>

						<div class="card-content">
							<div class="tabs">
								<div class="tabs-list">
									<button class="tab-trigger active">
										<fmt:message key="mensual" />
									</button>
									<button class="tab-trigger">
										<fmt:message key="anual" />
									</button>
								</div>

								<div class="tab-content active">
									<div class="ranking-list">
										<div class="ranking-item">
											<div class="rank">1</div>
											<div class="participant-info">
												<div class="participant-name">Laura Martínez</div>
												<div class="participant-location">Madrid</div>
											</div>
											<div class="score">9,845</div>
											<div class="trend trend-up">
												<span class="icon icon-trend-up"></span> <span>+12%</span>
											</div>
										</div>

										<div class="ranking-item">
											<div class="rank">2</div>
											<div class="participant-info">
												<div class="participant-name">Carlos Rodríguez</div>
												<div class="participant-location">Barcelona</div>
											</div>
											<div class="score">8,721</div>
											<div class="trend trend-steady">
												<span class="icon icon-trend-steady"></span> <span>+2%</span>
											</div>
										</div>

										<div class="ranking-item">
											<div class="rank">3</div>
											<div class="participant-info">
												<div class="participant-name">Ana García</div>
												<div class="participant-location">Valencia</div>
											</div>
											<div class="score">8,532</div>
											<div class="trend trend-up">
												<span class="icon icon-trend-up"></span> <span>+8%</span>
											</div>
										</div>

										<div class="ranking-item">
											<div class="rank">4</div>
											<div class="participant-info">
												<div class="participant-name">Miguel Fernández</div>
												<div class="participant-location">Sevilla</div>
											</div>
											<div class="score">7,984</div>
											<div class="trend trend-steady">
												<span class="icon icon-trend-steady"></span> <span>+1%</span>
											</div>
										</div>

										<div class="ranking-item">
											<div class="rank">5</div>
											<div class="participant-info">
												<div class="participant-name">Elena Sánchez</div>
												<div class="participant-location">Bilbao</div>
											</div>
											<div class="score">7,652</div>
											<div class="trend trend-down">
												<span class="icon icon-trend-down"></span> <span>-3%</span>
											</div>
										</div>

										<div class="ranking-item">
											<div class="rank">6</div>
											<div class="participant-info">
												<div class="participant-name">Javier López</div>
												<div class="participant-location">Zaragoza</div>
											</div>
											<div class="score">7,420</div>
											<div class="trend trend-up">
												<span class="icon icon-trend-up"></span> <span>+5%</span>
											</div>
										</div>

										<div class="ranking-item">
											<div class="rank">7</div>
											<div class="participant-info">
												<div class="participant-name">Sofía Moreno</div>
												<div class="participant-location">Málaga</div>
											</div>
											<div class="score">7,310</div>
											<div class="trend trend-up">
												<span class="icon icon-trend-up"></span> <span>+9%</span>
											</div>
										</div>

										<div class="ranking-item">
											<div class="rank">8</div>
											<div class="participant-info">
												<div class="participant-name">Andrés Torres</div>
												<div class="participant-location">Alicante</div>
											</div>
											<div class="score">7,105</div>
											<div class="trend trend-steady">
												<span class="icon icon-trend-steady"></span> <span>0%</span>
											</div>
										</div>

										<div class="ranking-item">
											<div class="rank">9</div>
											<div class="participant-info">
												<div class="participant-name">Carmen Ruiz</div>
												<div class="participant-location">Murcia</div>
											</div>
											<div class="score">6,987</div>
											<div class="trend trend-down">
												<span class="icon icon-trend-down"></span> <span>-2%</span>
											</div>
										</div>

										<div class="ranking-item">
											<div class="rank">10</div>
											<div class="participant-info">
												<div class="participant-name">David Navarro</div>
												<div class="participant-location">Granada</div>
											</div>
											<div class="score">6,854</div>
											<div class="trend trend-up">
												<span class="icon icon-trend-up"></span> <span>+4%</span>
											</div>
										</div>
									</div>
								</div>

								<div class="tab-content">
									<div class="ranking-list">
										<!-- Annual ranking data would go here -->
										<div class="text-center">
											<p>
												<fmt:message key="datos_anuales_procesando" />
											</p>
											<p>
												<fmt:message key="disponible_proximamente" />
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="methodology-card">
						<h3>
							<fmt:message key="metodologia_puntuacion" />
						</h3>
						<div class="methodology-steps">
							<div class="instruction-step">
								<strong><fmt:message key="rendimiento" /> (50%):</strong>
								<fmt:message key="descripcion_rendimiento" />
							</div>
							<div class="instruction-step">
								<strong><fmt:message key="participacion" /> (50%):</strong>
								<fmt:message key="descripcion_participacion" />
							</div>
						</div>
						<p class="text-center text-sm text-muted mt-4">
							<fmt:message key="puntuacion_actualizacion" />
						</p>
					</div>
				</div>

				<!-- Sidebar -->
				<div class="sidebar">
					<div class="card">
						<div class="card-header">
							<div class="card-badge">
								<span class="icon icon-map"></span> <span><fmt:message
										key="analisis_regional" /></span>
							</div>
							<h3 class="card-title">
								<fmt:message key="rendimiento_por_region" />
							</h3>
						</div>

						<div class="card-content">
							<div class="region-stats">
								<div class="region-stat-item">
									<div class="region-name">Madrid</div>
									<div class="region-bar-container">
										<div class="region-bar" style="width: 85%"></div>
									</div>
									<div class="region-score">8,245</div>
								</div>

								<div class="region-stat-item">
									<div class="region-name">Barcelona</div>
									<div class="region-bar-container">
										<div class="region-bar" style="width: 78%"></div>
									</div>
									<div class="region-score">7,932</div>
								</div>

								<div class="region-stat-item">
									<div class="region-name">Valencia</div>
									<div class="region-bar-container">
										<div class="region-bar" style="width: 75%"></div>
									</div>
									<div class="region-score">7,621</div>
								</div>

								<div class="region-stat-item">
									<div class="region-name">Sevilla</div>
									<div class="region-bar-container">
										<div class="region-bar" style="width: 73%"></div>
									</div>
									<div class="region-score">7,489</div>
								</div>

								<div class="region-stat-item">
									<div class="region-name">Bilbao</div>
									<div class="region-bar-container">
										<div class="region-bar" style="width: 71%"></div>
									</div>
									<div class="region-score">7,320</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card mt-4">
						<div class="card-header">
							<div class="card-badge">
								<span class="icon icon-calendar"></span> <span><fmt:message
										key="proximos_eventos" /></span>
							</div>
						</div>

						<div class="card-content">
							<div class="events-list">
								<div class="event-item">
									<div class="event-date">25 Abr</div>
									<div class="event-details">
										<div class="event-title">
											<fmt:message key="entrega_premios" />
										</div>
										<div class="event-location">Madrid</div>
									</div>
								</div>

								<div class="event-item">
									<div class="event-date">12 May</div>
									<div class="event-details">
										<div class="event-title">
											<fmt:message key="workshop_regional" />
										</div>
										<div class="event-location">Barcelona</div>
									</div>
								</div>

								<div class="event-item">
									<div class="event-date">30 May</div>
									<div class="event-details">
										<div class="event-title">
											<fmt:message key="presentacion_nuevas_categorias" />
										</div>
										<div class="event-location">Online</div>
									</div>
								</div>
							</div>
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

        document.addEventListener('DOMContentLoaded', function() {
            // Hamburger menu toggle
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

            // Tab switching functionality
            const tabTriggers = document.querySelectorAll('.tab-trigger');
            const tabContents = document.querySelectorAll('.tab-content');
            
            tabTriggers.forEach((trigger, index) => {
                trigger.addEventListener('click', () => {
                    // Remove active class from all triggers and contents
                    tabTriggers.forEach(t => t.classList.remove('active'));
                    tabContents.forEach(c => c.classList.remove('active'));
                    
                    // Add active class to clicked trigger and corresponding content
                    trigger.classList.add('active');
                    tabContents[index].classList.add('active');
                });
            });
        });
    </script>
</body>
</html>