<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="organizarpartida_titulo" /></title>
    <link rel="stylesheet" href="../css/stylesorganizarpartida.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
						    <a href="?lang=${sessionScope.lang eq 'en' ? 'es' : 'en'}">
						        <fmt:message key="boton_idioma" />
						    </a>
						</button>
					</div>
				</div>
			</div>
	</header>

    <main>
	    <div class="container organize-game-container">
	        <!-- Sidebar -->
	        <div class="sidebar">
	            <nav>
	                <ul>
	                    <li>
	                        <a href="menuperfil.jsp" class="sidebar-link">
	                            <i class='bx bx-user'></i>
	                            <span><fmt:message key="menu_perfil" /></span>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="ranking.jsp" class="sidebar-link">
	                            <i class='bx bx-trophy'></i>
	                            <span><fmt:message key="menu_ranking" /></span>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="organizarpartida.jsp" class="sidebar-link active">
	                            <i class='bx bx-calendar'></i>
	                            <span><fmt:message key="menu_organizar_partida" /></span>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="cupones.jsp" class="sidebar-link">
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
	
	        <!-- Contenido de Organizar Partida -->
	        <div class="organize-content">
	            <div class="page-header">
	                <h1><fmt:message key="organizar_partida_titulo" /></h1>
	                <p><fmt:message key="organizar_partida_descripcion" /></p>
	            </div>
	
	            <div class="organize-grid">
	                <!-- Formulario para crear partida -->
	                <div class="block create-game-block">
	                    <h2><fmt:message key="crear_nueva_partida" /></h2>
	                    
	                    <form class="game-form">
	                        <div class="form-group">
	                            <label for="game-title"><fmt:message key="titulo_partida" /></label>
	                            <input type="text" id="game-title" placeholder="<fmt:message key="ejemplo_partida" />" required>
	                        </div>
	                        
	                        <div class="form-row">
	                            <div class="form-group">
	                                <label for="game-date"><fmt:message key="fecha_hora" /></label>
	                                <div class="input-icon">
	                                    <i class='bx bx-calendar'></i>
	                                    <input type="text" id="game-date" placeholder="<fmt:message key="selecciona_fecha_hora" />" required>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group">
	                                <label for="game-duration"><fmt:message key="duracion_horas" /></label>
	                                <div class="input-icon">
	                                    <i class='bx bx-time'></i>
	                                    <input type="number" id="game-duration" min="1" max="8" value="2" required>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label for="game-type"><fmt:message key="tipo_juego" /></label>
	                            <select id="game-type" required>
	                                <option value="" disabled selected><fmt:message key="selecciona_tipo_juego" /></option>
	                                <option value="casual"><fmt:message key="casual" /> - <fmt:message key="para_principiantes" /></option>
	                                <option value="intermediate"><fmt:message key="intermedio" /> - <fmt:message key="jugadores_experiencia" /></option>
	                                <option value="competitive"><fmt:message key="competitivo" /> - <fmt:message key="nivel_avanzado" /></option>
	                                <option value="tournament"><fmt:message key="torneo" /> - <fmt:message key="formato_eliminatorio" /></option>
	                            </select>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label for="max-players"><fmt:message key="numero_maximo_jugadores" /></label>
	                            <div class="player-selector">
	                                <button type="button" class="player-btn decrease">-</button>
	                                <input type="number" id="max-players" min="2" max="12" value="4" readonly>
	                                <button type="button" class="player-btn increase">+</button>
	                            </div>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label for="game-description"><fmt:message key="descripcion_opcional" /></label>
	                            <textarea id="game-description" rows="3" placeholder="<fmt:message key="añadir_detalles_partida" />"></textarea>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label class="checkbox-container">
	                                <input type="checkbox" id="private-game">
	                                <span class="checkmark"></span>
	                                <fmt:message key="partida_privada" />
	                            </label>
	                        </div>
	                        
	                        <div class="form-actions">
	                            <button type="button" class="secondary-button"><fmt:message key="cancelar" /></button>
	                            <button type="submit" class="primary-button"><fmt:message key="crear_partida" /></button>
	                        </div>
	                    </form>
	                </div>
	                
	                <!-- Bloque de información y consejos -->
	                <div class="info-section">
	                    <!-- Mis partidas -->
	                    <div class="block my-games-block">
	                        <div class="block-header">
	                            <h2><fmt:message key="mis_partidas" /></h2>
	                            <a href="#" class="view-all-link"><fmt:message key="ver_todas" /></a>
	                        </div>
	                        
	                        <div class="games-list">
	                            <div class="game-card">
	                                <div class="game-date">
	                                    <span class="day">15</span>
	                                    <span class="month">JUN</span>
	                                </div>
	                                <div class="game-info">
	                                    <h3><fmt:message key="torneo_verano" /></h3>
	                                    <p><i class='bx bx-time'></i> 18:00 - 20:30</p>
	                                    <p><i class='bx bx-group'></i> 8/8 <fmt:message key="jugadores" /></p>
	                                </div>
	                                <div class="game-status completed">
	                                    <span><fmt:message key="completada" /></span>
	                                </div>
	                            </div>
	                            
	                            <div class="game-card">
	                                <div class="game-date">
	                                    <span class="day">22</span>
	                                    <span class="month">JUN</span>
	                                </div>
	                                <div class="game-info">
	                                    <h3><fmt:message key="partida_amistosa" /></h3>
	                                    <p><i class='bx bx-time'></i> 17:30 - 19:30</p>
	                                    <p><i class='bx bx-group'></i> 3/6 <fmt:message key="jugadores" /></p>
	                                </div>
	                                <div class="game-status upcoming">
	                                    <span><fmt:message key="proxima" /></span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <!-- Consejos -->
	                    <div class="block tips-block">
	                        <h2><fmt:message key="consejos_organizadores" /></h2>
	                        
	                        <div class="tips-list">
	                            <div class="tip-item">
	                                <div class="tip-icon">
	                                    <i class='bx bx-bulb'></i>
	                                </div>
	                                <div class="tip-content">
	                                    <h3><fmt:message key="planifica_tiempo" /></h3>
	                                    <p><fmt:message key="crear_partida_48_horas" /></p>
	                                </div>
	                            </div>
	                            
	                            <div class="tip-item">
	                                <div class="tip-icon">
	                                    <i class='bx bx-user-voice'></i>
	                                </div>
	                                <div class="tip-content">
	                                    <h3><fmt:message key="comunica_reglas" /></h3>
	                                    <p><fmt:message key="asegura_reglas" /></p>
	                                </div>
	                            </div>
	                            
	                            <div class="tip-item">
	                                <div class="tip-icon">
	                                    <i class='bx bx-medal'></i>
	                                </div>
	                                <div class="tip-content">
	                                    <h3><fmt:message key="incentivos" /></h3>
	                                    <p><fmt:message key="premios_emocionantes" /></p>
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
    
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
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
            
            // Inicializar selector de fecha y hora
            flatpickr("#game-date", {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                minDate: "today",
                time_24hr: true
            });
            
            // Controles para el selector de nÃºmero de jugadores
            document.querySelector('.player-btn.decrease').addEventListener('click', function() {
                const input = document.getElementById('max-players');
                if (parseInt(input.value) > parseInt(input.min)) {
                    input.value = parseInt(input.value) - 1;
                }
            });
            
            document.querySelector('.player-btn.increase').addEventListener('click', function() {
                const input = document.getElementById('max-players');
                if (parseInt(input.value) < parseInt(input.max)) {
                    input.value = parseInt(input.value) + 1;
                }
            });
        });
    </script>
</body>
</html>