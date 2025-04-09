<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="jugar_titulo" /></title>
    <link rel="stylesheet" href="../css/stylesjugar.css">
    <link rel="icon" href="../Img/baldosa.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
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
							<fmt:message key="boton_english" />
						</button>
					</div>
				</div>
			</div>
	</header>

    <main>
	    <div class="container">
	        <div class="max-width">
	            <div class="grid grid-cols-3" style="margin-bottom: 2rem;">
	                <div class="card">
	                    <div class="card-header">
	                        <div class="card-badge">
	                            <span class="icon icon-file"></span>
	                            <span><fmt:message key="historia_interactiva" /></span>
	                        </div>
	                        <h2 class="card-title"><fmt:message key="historia_marcos" /></h2>
	                        <p class="card-description"><fmt:message key="descripcion_historia" /></p>
	                    </div>
	                    <div class="card-content">
	                        <div class="section">
	                            <h3 class="section-title"><fmt:message key="sinopsis" /></h3>
	                            <p class="section-content">
	                                <fmt:message key="sinopsis_texto" />
	                            </p>
	                        </div>
	
	                        <div style="margin-bottom: 1.5rem;">
	                            <h3 class="section-title" style="margin-bottom: 0.75rem;"><fmt:message key="dos_finales" /></h3>
	                            <div class="endings-grid">
	                                <div class="ending-card">
	                                    <span class="badge badge-green"><fmt:message key="final_a" /></span>
	                                    <p class="section-content">
	                                        <fmt:message key="final_a_texto" />
	                                    </p>
	                                </div>
	                                <div class="ending-card">
	                                    <span class="badge badge-amber"><fmt:message key="final_b" /></span>
	                                    <p class="section-content">
	                                        <fmt:message key="final_b_texto" />
	                                    </p>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="section">
	                            <h3 class="section-title"><fmt:message key="informacion_archivo" /></h3>
	                            <ul class="info-list">
	                                <li>
	                                    <span class="info-label"><fmt:message key="formato" />:</span>
	                                    <span><fmt:message key="formato_jar" /></span>
	                                </li>
	                                <li>
	                                    <span class="info-label"><fmt:message key="tamano" />:</span>
	                                    <span><fmt:message key="tamano_valor" /></span>
	                                </li>
	                                <li>
	                                    <span class="info-label"><fmt:message key="version" />:</span>
	                                    <span><fmt:message key="version_valor" /></span>
	                                </li>
	                                <li>
	                                    <span class="info-label"><fmt:message key="ultima_actualizacion" />:</span>
	                                    <span><fmt:message key="fecha_actualizacion" /></span>
	                                </li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="card-footer">
	                        <button class="button">
	                            <span class="icon icon-download" style="color: white;"></span>
	                            <fmt:message key="descargar_archivo" />
	                        </button>
	                        <p class="text-center text-sm text-muted mt-4">
	                            <fmt:message key="aceptas_terminos" />
	                        </p>
	                    </div>
	                </div>
	
	                <div class="card">
	                    <div class="card-header" style="padding: 1rem 1.5rem;">
	                        <h3 class="card-title" style="font-size: 1.125rem;"><fmt:message key="instrucciones" /></h3>
	                    </div>
	                    <div class="card-content">
	                        <div class="instruction-step">
	                            <p><fmt:message key="paso_1" /></p>
	                        </div>
	                        <div class="instruction-step">
	                            <p><fmt:message key="paso_2" /></p>
	                        </div>
	                        <div class="instruction-step">
	                            <p><fmt:message key="paso_3" /></p>
	                        </div>
	                        <div class="instruction-step">
	                            <p><fmt:message key="paso_4" /></p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="card">
	                <div class="card-header">
	                    <div style="display: flex; align-items: center; gap: 0.5rem;">
	                        <span class="icon icon-laptop"></span>
	                        <h3 class="card-title" style="margin-bottom: 0; font-size: 1.25rem;">
	                            <fmt:message key="requisitos_sistema" />
	                        </h3>
	                    </div>
	                    <p class="card-description"><fmt:message key="verifica_requisitos" /></p>
	                </div>
	                <div class="card-content">
	                    <div class="tabs">
	                        <div class="tabs-list">
	                            <button class="tab-trigger active" onclick="switchTab('minimos')">
	                                <fmt:message key="requisitos_minimos" />
	                            </button>
	                            <button class="tab-trigger" onclick="switchTab('recomendados')">
	                                <fmt:message key="requisitos_recomendados" />
	                            </button>
	                        </div>
	
	                        <div id="minimos" class="tab-content active">
	                            <table>
	                                <thead>
	                                    <tr>
	                                        <th class="w-1-3"><fmt:message key="requisito" /></th>
	                                        <th><fmt:message key="especificacion" /></th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="sistema_operativo" /></td>
	                                        <td><fmt:message key="os_minimo" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="procesador" /></td>
	                                        <td><fmt:message key="cpu_minimo" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="memoria_ram" /></td>
	                                        <td><fmt:message key="ram_4gb" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="tarjeta_grafica" /></td>
	                                        <td><fmt:message key="intel_amd_r5" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="opengl" /></td>
	                                        <td><fmt:message key="opengl_4_4" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="espacio_disco" /></td>
	                                        <td><fmt:message key="espacio_minimo" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="java" /></td>
	                                        <td><fmt:message key="java_17" /></td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </div>
	
	                        <div id="recomendados" class="tab-content">
	                            <table>
	                                <thead>
	                                    <tr>
	                                        <th class="w-1-3"><fmt:message key="requisito" /></th>
	                                        <th><fmt:message key="especificacion" /></th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="sistema_operativo" /></td>
	                                        <td><fmt:message key="os_minimo" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="procesador" /></td>
	                                        <td><fmt:message key="cpu_recomendado" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="memoria_ram" /></td>
	                                        <td><fmt:message key="ram_8gb" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="tarjeta_grafica" /></td>
	                                        <td><fmt:message key="gpu_recomendada" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="opengl" /></td>
	                                        <td><fmt:message key="opengl_4_4" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="espacio_disco" /></td>
	                                        <td><fmt:message key="ssd_suficiente" /></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="font-medium"><fmt:message key="java" /></td>
	                                        <td><fmt:message key="java_17" /></td>
	                                    </tr>
	                                </tbody>
	                            </table>
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

        function switchTab(tabId) {
            const tabContents = document.querySelectorAll('.tab-content');
            tabContents.forEach(content => {
                content.classList.remove('active');
            });
            
            const tabTriggers = document.querySelectorAll('.tab-trigger');
            tabTriggers.forEach(trigger => {
                trigger.classList.remove('active');
            });
            
            document.getElementById(tabId).classList.add('active');
            
            event.currentTarget.classList.add('active');
        }
    </script>
</body>
</html>