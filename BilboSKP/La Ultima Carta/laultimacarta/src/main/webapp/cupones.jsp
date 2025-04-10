<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="cupones_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylescupones.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
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

	<!-- Contenido Principal -->
	<main>
		<div class="container coupons-container">
			<!-- Sidebar -->
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

			<!-- Contenido de Cupones -->
			<div class="coupons-content">
				<div class="page-header">
					<h1>
						<fmt:message key="cupones_titulo" />
					</h1>
					<p>
						<fmt:message key="cupones_subtitulo" />
					</p>
				</div>

				<!-- Resumen de puntos y cupones -->
				<div class="coupons-summary">
					<div class="summary-card">
						<div class="summary-icon">
							<i class='bx bx-coin-stack'></i>
						</div>
						<div class="summary-info">
							<h3>
								<fmt:message key="cupones_puntos" />
							</h3>
							<p class="summary-value">1,250</p>
						</div>
					</div>

					<div class="summary-card">
						<div class="summary-icon">
							<i class='bx bx-ticket'></i>
						</div>
						<div class="summary-info">
							<h3>
								<fmt:message key="cupones_activos" />
							</h3>
							<p class="summary-value">2</p>
						</div>
					</div>

					<div class="summary-card">
						<div class="summary-icon">
							<i class='bx bx-gift'></i>
						</div>
						<div class="summary-info">
							<h3>
								<fmt:message key="cupones_canjeados" />
							</h3>
							<p class="summary-value">7</p>
						</div>
					</div>
				</div>

				<!-- Cupones disponibles -->
				<div class="block available-coupons">
					<div class="block-header">
						<h2>
							<fmt:message key="cupones_disponibles" />
						</h2>
						<div class="filter-dropdown">
							<button class="filter-btn">
								<i class='bx bx-filter-alt'></i>
								<fmt:message key="cupones_filtrar" />
							</button>
						</div>
					</div>

					<div class="coupons-grid">
						<!-- Cupón 1 -->
						<div class="coupon-card featured">
							<div class="coupon-header">
								<h3>
									<fmt:message key="cupon_1_titulo" />
								</h3>
								<div class="coupon-points">300 pts</div>
							</div>
							<div class="coupon-content">
								<p>
									<fmt:message key="cupon_1_descripcion" />
								</p>
								<div class="coupon-details">
									<div class="coupon-detail">
										<i class='bx bx-calendar'></i> <span><fmt:message
												key="cupon_1_valido_hasta" /></span>
									</div>
									<div class="coupon-detail">
										<i class='bx bx-info-circle'></i> <span><fmt:message
												key="cupon_1_tipo" /></span>
									</div>
								</div>
							</div>
							<div class="coupon-footer">
								<button class="primary-button">
									<fmt:message key="cupon_obtener" />
								</button>
							</div>
						</div>

						<!-- Cupón 5 -->
						<div class="coupon-card">
							<div class="coupon-header">
								<h3>
									<fmt:message key="cupon_5_titulo" />
								</h3>
								<div class="coupon-points">1200 pts</div>
							</div>
							<div class="coupon-content">
								<p>
									<fmt:message key="cupon_5_descripcion" />
								</p>
								<div class="coupon-details">
									<div class="coupon-detail">
										<i class='bx bx-calendar'></i> <span><fmt:message
												key="cupon_5_valido_hasta" /></span>
									</div>
									<div class="coupon-detail">
										<i class='bx bx-package'></i> <span><fmt:message
												key="cupon_5_tipo" /></span>
									</div>
								</div>
							</div>
							<div class="coupon-footer">
								<button class="primary-button">
									<fmt:message key="cupon_obtener_paquete" />
								</button>
							</div>
						</div>

						<!-- Cupón 15 -->
						<div class="coupon-card">
							<div class="coupon-header">
								<h3>
									<fmt:message key="cupon_15_titulo" />
								</h3>
								<div class="coupon-points">3000 pts</div>
							</div>
							<div class="coupon-content">
								<p>
									<fmt:message key="cupon_15_descripcion" />
								</p>
								<div class="coupon-details">
									<div class="coupon-detail">
										<i class='bx bx-calendar'></i> <span><fmt:message
												key="cupon_15_valido_hasta" /></span>
									</div>
									<div class="coupon-detail">
										<i class='bx bx-package'></i> <span><fmt:message
												key="cupon_15_tipo" /></span>
									</div>
								</div>
							</div>
							<div class="coupon-footer">
								<button class="primary-button">
									<fmt:message key="cupon_obtener_paquete" />
								</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Mis Cupones -->
				<div class="block my-coupons">
					<h2>
						<fmt:message key="miscupones_titulo" />
					</h2>

					<div class="tabs-header">
						<button class="tab-btn active" data-tab="active">
							<fmt:message key="miscupones_activos" />
						</button>
						<button class="tab-btn" data-tab="used">
							<fmt:message key="miscupones_usados" />
						</button>
					</div>

					<!-- Cupones activos -->
					<div class="tab-content active" id="active-tab">
						<div class="my-coupons-list">
							<div class="my-coupon-item">
								<div class="coupon-left">
									<div class="coupon-icon">
										<i class='bx bx-ticket'></i>
									</div>
									<div class="coupon-info">
										<h3>
											<fmt:message key="micupon_15_titulo" />
										</h3>
										<div class="coupon-meta">
											<span><i class='bx bx-calendar'></i> <fmt:message
													key="micupon_15_valido_hasta" /></span> <span><i
												class='bx bx-info-circle'></i> <fmt:message
													key="micupon_15_tipo" /></span>
										</div>
									</div>
								</div>
								<div class="coupon-actions">
									<button class="action-btn view-btn">
										<i class='bx bx-show'></i>
										<fmt:message key="micupon_ver" />
									</button>
									<button class="action-btn use-btn">
										<i class='bx bx-check'></i>
										<fmt:message key="micupon_usar" />
									</button>
								</div>
							</div>

							<div class="my-coupon-item">
								<div class="coupon-left">
									<div class="coupon-icon">
										<i class='bx bx-package'></i>
									</div>
									<div class="coupon-info">
										<h3>
											<fmt:message key="micupon_10_titulo" />
										</h3>
										<div class="coupon-meta">
											<span><i class='bx bx-calendar'></i> <fmt:message
													key="micupon_10_valido_hasta" /></span> <span><i
												class='bx bx-info-circle'></i> <fmt:message
													key="micupon_10_restantes" /></span>
										</div>
									</div>
								</div>
								<div class="coupon-actions">
									<button class="action-btn view-btn">
										<i class='bx bx-show'></i>
										<fmt:message key="micupon_ver" />
									</button>
									<button class="action-btn use-btn">
										<i class='bx bx-check'></i>
										<fmt:message key="micupon_usar" />
									</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Cupones utilizados -->
					<div class="tab-content" id="used-tab">
						<div class="my-coupons-list">
							<div class="my-coupon-item used">
								<div class="coupon-left">
									<div class="coupon-icon">
										<i class='bx bx-package'></i>
									</div>
									<div class="coupon-info">
										<h3>
											<fmt:message key="micupon_10_titulo" />
										</h3>
										<div class="coupon-meta">
											<span><i class='bx bx-calendar'></i> <fmt:message
													key="micupon_10_usado" /></span> <span><i
												class='bx bx-info-circle'></i> <fmt:message
													key="micupon_10_canjeado" /></span>
										</div>
									</div>
								</div>
								<div class="coupon-status">
									<span class="status-badge used"><fmt:message
											key="micupon_estado_usado" /></span>
								</div>
							</div>

							<div class="my-coupon-item used">
								<div class="coupon-left">
									<div class="coupon-icon">
										<i class='bx bx-ticket'></i>
									</div>
									<div class="coupon-info">
										<h3>
											<fmt:message key="micupon_15_titulo" />
										</h3>
										<div class="coupon-meta">
											<span><i class='bx bx-calendar'></i> <fmt:message
													key="micupon_15_usado" /></span>
										</div>
									</div>
								</div>
								<div class="coupon-status">
									<span class="status-badge used"><fmt:message
											key="micupon_estado_usado" /></span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Información sobre cupones -->
				<div class="block coupons-info">
					<h2>
						<fmt:message key="info_titulo" />
					</h2>

					<div class="info-steps">
						<div class="info-step">
							<div class="step-number">1</div>
							<div class="step-content">
								<h3>
									<fmt:message key="info_paso1_titulo" />
								</h3>
								<p>
									<fmt:message key="info_paso1_desc" />
								</p>
							</div>
						</div>

						<div class="info-step">
							<div class="step-number">2</div>
							<div class="step-content">
								<h3>
									<fmt:message key="info_paso2_titulo" />
								</h3>
								<p>
									<fmt:message key="info_paso2_desc" />
								</p>
							</div>
						</div>

						<div class="info-step">
							<div class="step-number">3</div>
							<div class="step-content">
								<h3>
									<fmt:message key="info_paso3_titulo" />
								</h3>
								<p>
									<fmt:message key="info_paso3_desc" />
								</p>
							</div>
						</div>
					</div>

					<div class="info-notes">
						<div class="info-note">
							<i class='bx bx-info-circle'></i>
							<p>
								<fmt:message key="info_nota1" />
							</p>
						</div>
						<div class="info-note">
							<i class='bx bx-info-circle'></i>
							<p>
								<fmt:message key="info_nota2" />
							</p>
						</div>
						<div class="info-note">
							<i class='bx bx-info-circle'></i>
							<p>
								<fmt:message key="info_nota3" />
							</p>
						</div>
						<div class="info-note">
							<i class='bx bx-info-circle'></i>
							<p>
								<fmt:message key="info_nota4" />
							</p>
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
        // Script para el comportamiento del header al hacer scroll
        window.addEventListener('scroll', function() {
            const header = document.getElementById('main-header');
            if (window.scrollY > 10) {
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
            
            // Tab functionality
            const tabBtns = document.querySelectorAll('.tab-btn');
            tabBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    // Remove active class from all buttons and content
                    tabBtns.forEach(b => b.classList.remove('active'));
                    document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
                    
                    // Add active class to clicked button and corresponding content
                    this.classList.add('active');
                    const tabId = this.getAttribute('data-tab');
                    document.getElementById(`${tabId}-tab`).classList.add('active');
                });
            });
        });
    </script>
</body>
</html>