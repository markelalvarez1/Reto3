<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="menuperfil_titulo" /></title>
    <link rel="icon" href="../Img/baldosa.png" type="image/x-icon">
    <link rel="stylesheet" href="../css/stylesmenu.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
 	<header id="main-header">
			<div class="container">
				<a href="../Index.html" class="logo"><fmt:message
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
							<li><a href="gestion.jsp"><fmt:message
										key="menu_gestion" /></a></li>
							<li><a href="../index.jsp#opinions"><fmt:message
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
							<fmt:message key="boton_english" />
						</button>
					</div>
				</div>
			</div>
	</header>
	
    <!-- Contenido Principal -->
	<main>
	    <div class="container profile-container">
	        <!-- Sidebar -->
	        <div class="sidebar">
	            <nav>
	                <ul>
	                    <li>
	                        <a href="#" class="sidebar-link active">
	                            <i class='bx bx-user'></i>
	                            <span><fmt:message key="menu_perfil" /></span>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="ranking.html" class="sidebar-link">
	                            <i class='bx bx-trophy'></i>
	                            <span><fmt:message key="menu_ranking" /></span>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="organizarpartida.html" class="sidebar-link">
	                            <i class='bx bx-calendar'></i>
	                            <span><fmt:message key="menu_organizar_partida" /></span>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="cupones.html" class="sidebar-link">
	                            <i class='bx bx-ticket'></i>
	                            <span><fmt:message key="menu_obtener_cupones" /></span>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#" class="sidebar-link logout">
	                            <i class='bx bx-log-out'></i>
	                            <span><fmt:message key="menu_cerrar_sesion" /></span>
	                        </a>
	                    </li>
	                </ul>
	            </nav>
	        </div>
	
	        <!-- Contenido del Perfil -->
	        <div class="profile-content">
	            <div class="page-header">
	                <h1><fmt:message key="perfil_usuario" /></h1>
	                <p><fmt:message key="gestiona_info_preferencias" /></p>
	            </div>
	
	            <!-- Sección de perfil principal -->
	            <div class="profile-main">
	                <!-- Tarjeta de perfil -->
	                <div class="block profile-card">
	                    <div class="profile-header">
	                        <div class="profile-avatar-large">
	                            <img src="https://via.placeholder.com/200" alt="<fmt:message key='avatar_usuario' />">
	                            <button class="change-avatar-btn">
	                                <i class='bx bx-camera'></i>
	                            </button>
	                        </div>
	                        <div class="profile-info-main">
	                            <h2>Carlos Rodríguez</h2>
	                            <p class="username">@carlos_r</p>
	                            <div class="profile-badges">
	                                <span class="badge level-badge"><fmt:message key="nivel" /> 5</span>
	                                <span class="badge rank-badge"><fmt:message key="ranking" /> #8</span>
	                                <span class="badge member-badge"><fmt:message key="miembro_desde" /> 2023</span>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="profile-stats-row">
	                        <div class="stat-box">
	                            <div class="stat-value">1250</div>
	                            <div class="stat-label"><fmt:message key="puntos" /></div>
	                        </div>
	                        <div class="stat-box">
	                            <div class="stat-value">28</div>
	                            <div class="stat-label"><fmt:message key="partidas" /></div>
	                        </div>
	                        <div class="stat-box">
	                            <div class="stat-value">15</div>
	                            <div class="stat-label"><fmt:message key="victorias" /></div>
	                        </div>
	                        <div class="stat-box">
	                            <div class="stat-value">53%</div>
	                            <div class="stat-label"><fmt:message key="ratio" /></div>
	                        </div>
	                    </div>
	
	                    <div class="profile-bio">
	                        <h3><fmt:message key="sobre_mi" /></h3>
	                        <p><fmt:message key="bio_usuario" /></p>
	                    </div>
	                </div>
	
	                <!-- Sección de logros -->
	                <div class="block achievements-block">
	                    <div class="block-header">
	                        <h2><fmt:message key="logros" /></h2>
	                        <a href="#" class="view-all-link"><fmt:message key="ver_todos" /></a>
	                    </div>
	
	                    <div class="achievements-grid">
	                        <div class="achievement-card">
	                            <div class="achievement-icon unlocked">
	                                <i class='bx bx-medal'></i>
	                            </div>
	                            <div class="achievement-info">
	                                <h3><fmt:message key="primer_victoria" /></h3>
	                                <p><fmt:message key="gana_tu_primera_partida" /></p>
	                            </div>
	                        </div>
	
	                        <div class="achievement-card">
	                            <div class="achievement-icon unlocked">
	                                <i class='bx bx-group'></i>
	                            </div>
	                            <div class="achievement-info">
	                                <h3><fmt:message key="organizador" /></h3>
	                                <p><fmt:message key="organiza_5_partidas" /></p>
	                            </div>
	                        </div>
	
	                        <div class="achievement-card">
	                            <div class="achievement-icon unlocked">
	                                <i class='bx bx-trophy'></i>
	                            </div>
	                            <div class="achievement-info">
	                                <h3><fmt:message key="competidor" /></h3>
	                                <p><fmt:message key="participa_10_partidas" /></p>
	                            </div>
	                        </div>
	
	                        <div class="achievement-card">
	                            <div class="achievement-icon locked">
	                                <i class='bx bx-crown'></i>
	                            </div>
	                            <div class="achievement-info">
	                                <h3><fmt:message key="campeon" /></h3>
	                                <p><fmt:message key="gana_20_partidas" /></p>
	                                <div class="achievement-progress">
	                                    <div class="progress-bar">
	                                        <div class="progress-fill" style="width: 75%"></div>
	                                    </div>
	                                    <span>15/20</span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <!-- Pestañas de perfil -->
	            <div class="profile-tabs">
	                <div class="tabs-header">
	                    <button class="tab-btn active" data-tab="history"><fmt:message key="historial" /></button>
	                    <button class="tab-btn" data-tab="settings"><fmt:message key="configuracion" /></button>
	                </div>
	
	                <!-- Contenido de las pestañas -->
	                <div class="tab-content active" id="history-tab">
	                    <div class="block history-block">
	                        <h2><fmt:message key="historial_partidas" /></h2>
	
	                        <div class="history-list">
	                            <div class="history-item">
	                                <div class="history-date">
	                                    <span class="day">15</span>
	                                    <span class="month">JUN</span>
	                                </div>
	                                <div class="history-details">
	                                    <div class="history-header">
	                                        <h3><fmt:message key="torneo_verano" /></h3>
	                                        <span class="history-result win"><fmt:message key="victoria" /></span>
	                                    </div>
	                                    <div class="history-info">
	                                        <p><i class='bx bx-time'></i> 18:00 - 20:30</p>
	                                        <p><i class='bx bx-group'></i> 8 <fmt:message key="jugadores" /></p>
	                                        <p><i class='bx bx-plus-circle'></i> 150 <fmt:message key="puntos" /></p>
	                                    </div>
	                                </div>
	                            </div>
	
	                            <div class="history-item">
	                                <div class="history-date">
	                                    <span class="day">10</span>
	                                    <span class="month">JUN</span>
	                                </div>
	                                <div class="history-details">
	                                    <div class="history-header">
	                                        <h3><fmt:message key="partida_amistosa" /></h3>
	                                        <span class="history-result loss"><fmt:message key="derrota" /></span>
	                                    </div>
	                                    <div class="history-info">
	                                        <p><i class='bx bx-time'></i> 17:30 - 19:00</p>
	                                        <p><i class='bx bx-group'></i> 4 <fmt:message key="jugadores" /></p>
	                                        <p><i class='bx bx-minus-circle'></i> 25 <fmt:message key="puntos" /></p>
	                                    </div>
	                                </div>
	                            </div>
	
	                            <div class="history-item">
	                                <div class="history-date">
	                                    <span class="day">05</span>
	                                    <span class="month">JUN</span>
	                                </div>
	                                <div class="history-details">
	                                    <div class="history-header">
	                                        <h3><fmt:message key="competencia_semanal" /></h3>
	                                        <span class="history-result win"><fmt:message key="victoria" /></span>
	                                    </div>
	                                    <div class="history-info">
	                                        <p><i class='bx bx-time'></i> 19:00 - 21:30</p>
	                                        <p><i class='bx bx-group'></i> 6 <fmt:message key="jugadores" /></p>
	                                        <p><i class='bx bx-plus-circle'></i> 120 <fmt:message key="puntos" /></p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="view-more">
	                            <button class="view-more-btn"><fmt:message key="cargar_mas_partidas" /></button>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="tab-content" id="settings-tab">
	                    <div class="block settings-block">
	                        <h2><fmt:message key="configuracion_cuenta" /></h2>
	
	                        <div class="settings-sections">
	                            <div class="settings-section">
	                                <h3><fmt:message key="informacion_personal" /></h3>
	
	                                <form class="settings-form">
	                                    <div class="form-group">
	                                        <label for="full-name"><fmt:message key="nombre_completo" /></label>
	                                        <input type="text" id="full-name" value="Carlos Rodríguez">
	                                    </div>
	
	                                    <div class="form-row">
	                                        <div class="form-group">
	                                            <label for="username"><fmt:message key="nombre_usuario" /></label>
	                                            <input type="text" id="username" value="carlos_r">
	                                        </div>
	
	                                        <div class="form-group">
	                                            <label for="email"><fmt:message key="correo_electronico" /></label>
	                                            <input type="email" id="email" value="carlos@ejemplo.com">
	                                        </div>
	                                    </div>
	
	                                    <div class="form-group">
	                                        <label for="bio"><fmt:message key="biografia" /></label>
	                                        <textarea id="bio" rows="3"><fmt:message key="bio_usuario" /></textarea>
	                                    </div>
	                                </form>
	                            </div>
	
	                            <div class="settings-section">
	                                <h3><fmt:message key="preferencias" /></h3>
	
	                                <div class="settings-options">
	                                    <div class="settings-option">
	                                        <div class="option-info">
	                                            <h4><fmt:message key="notificaciones_correo" /></h4>
	                                            <p><fmt:message key="recibir_notificaciones_eventos" /></p>
	                                        </div>
	                                        <label class="toggle">
	                                            <input type="checkbox" checked>
	                                            <span class="toggle-slider"></span>
	                                        </label>
	                                    </div>
	
	                                    <div class="settings-option">
	                                        <div class="option-info">
	                                            <h4><fmt:message key="perfil_publico" /></h4>
	                                            <p><fmt:message key="permitir_ver_perfil" /></p>
	                                        </div>
	                                        <label class="toggle">
	                                            <input type="checkbox" checked>
	                                            <span class="toggle-slider"></span>
	                                        </label>
	                                    </div>
	
	                                    <div class="settings-option">
	                                        <div class="option-info">
	                                            <h4><fmt:message key="mostrar_estado_online" /></h4>
	                                            <p><fmt:message key="mostrar_conectado" /></p>
	                                        </div>
	                                        <label class="toggle">
	                                            <input type="checkbox">
	                                            <span class="toggle-slider"></span>
	                                        </label>
	                                    </div>
	                                </div>
	                            </div>
	
	                            <div class="settings-section">
	                                <h3><fmt:message key="seguridad" /></h3>
	
	                                <div class="security-options">
	                                    <button class="security-btn">
	                                        <i class='bx bx-lock-alt'></i>
	                                        <fmt:message key="cambiar_contrasena" />
	                                    </button>
	
	                                    <button class="security-btn">
	                                        <i class='bx bx-shield-quarter'></i>
	                                        <fmt:message key="activar_autenticacion_dos_pasos" />
	                                    </button>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="settings-actions">
	                            <button class="secondary-button"><fmt:message key="cancelar" /></button>
	                            <button class="primary-button"><fmt:message key="guardar_cambios" /></button>
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
							class="IG" src="../Img/igb.png" alt="Instagram"></a> <a
							href="https://www.tiktok.com/@digitalcraftdevel" target="_blank"><img
							class="TK" src="../Img/tiktokb.png" alt="TikTok"></a> <a
							href="https://x.com/Dcdevelopment_" target="_blank"><img
							class="X" src="../Img/Xb.png" alt="X"></a>
					</div>
					<div class="footer-text">
						<a href="contacto.html"><p>
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