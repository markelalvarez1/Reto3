<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jugar</title>
    <link rel="stylesheet" href="../css/stylesjugar.css">
    <link rel="icon" href="../Img/baldosa.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>

    <header id="main-header">
        <div class="container">
            <a href="../Index.html" class="logo">Bilbao SKP</a>

            <div class="hamburger-menu">
                <div class="hamburger-icon">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>

            <div class="nav-container">
                <nav>
                    <ul>
                        <li><a href="#">Jugar</a></li>
                        <li><a href="gestion.html">Gestión</a></li>
                        <li><a href="../index.html#opinions">Opiniones</a></li>
                        <li><a href="contacto.html">Contacto</a></li>
                        <li><a href="ranking.html">Ranking</a></li>
                    </ul>
                </nav>
                <div class="header-buttons">
                    <button class="btn-primary"><a href="inicioeleccion.html">Iniciar sesión</a></button>
                    <button class="btn-secondary"><a href="registroeleccion.html">Registrar</a></button>
                    <button class="btn-tertiary">English</button>
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
                                <span>Historia Interactiva</span>
                            </div>
                            <h2 class="card-title">La historia de Marcos</h2>
                            <p class="card-description">Una historia interactiva sobre el acoso escolar y sus consecuencias</p>
                        </div>
                        <div class="card-content">
                            <div class="section">
                                <h3 class="section-title">Sinopsis:</h3>
                                <p class="section-content">
                                    Marcos, un chico de 14 años, sufre acoso escolar y vive en soledad tras el abandono de su padre. 
                                    Su único refugio es el fútbol, donde conoce a Alex, su único amigo. Al notar que algo anda mal, 
                                    Alex descubre el bullying que Marcos sufre por parte de Daniel, un compañero protegido por su padre, 
                                    profesor del colegio.
                                </p>
                            </div>
                            
                            <div style="margin-bottom: 1.5rem;">
                                <h3 class="section-title" style="margin-bottom: 0.75rem;">Dos finales posibles:</h3>
                                <div class="endings-grid">
                                    <div class="ending-card">
                                        <span class="badge badge-green">Final A</span>
                                        <p class="section-content">
                                            Descubre cómo Marcos y Alex enfrentan el acoso escolar juntos.
                                        </p>
                                    </div>
                                    <div class="ending-card">
                                        <span class="badge badge-amber">Final B</span>
                                        <p class="section-content">
                                            Explora un desenlace alternativo para esta historia.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="section">
                                <h3 class="section-title">Información del archivo:</h3>
                                <ul class="info-list">
                                    <li>
                                        <span class="info-label">Formato:</span>
                                        <span>Java (.jar)</span>
                                    </li>
                                    <li>
                                        <span class="info-label">Tamaño:</span>
                                        <span>24.5 MB</span>
                                    </li>
                                    <li>
                                        <span class="info-label">Versión:</span>
                                        <span>1.0.0</span>
                                    </li>
                                    <li>
                                        <span class="info-label">Última actualización:</span>
                                        <span>4 de abril, 2025</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button class="button">
                                <span class="icon icon-download" style="color: white;"></span>
                                Descargar archivo (.jar)
                            </button>
                            <p class="text-center text-sm text-muted mt-4">
                                Al descargar este archivo, aceptas nuestros términos y condiciones
                            </p>
                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-header" style="padding: 1rem 1.5rem;">
                            <h3 class="card-title" style="font-size: 1.125rem;">Instrucciones</h3>
                        </div>
                        <div class="card-content">
                            <div class="instruction-step">
                                <p>1. Descarga el archivo Java comprimido (.zip o .rar)</p>
                            </div>
                            <div class="instruction-step">
                                <p>2. Extrae su contenido con un programa como WinRAR o 7-Zip</p>
                            </div>
                            <div class="instruction-step">
                                <p>3. Asegúrate de tener Java instalado</p>
                            </div>
                            <div class="instruction-step">
                                <p>4. Haz doble clic en el archivo .jar para iniciar el juego</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; align-items: center; gap: 0.5rem;">
                            <span class="icon icon-laptop"></span>
                            <h3 class="card-title" style="margin-bottom: 0; font-size: 1.25rem;">Requisitos del sistema</h3>
                        </div>
                        <p class="card-description">Verifica que tu equipo cumple con los requisitos mínimos antes de descargar</p>
                    </div>
                    <div class="card-content">
                        <div class="tabs">
                            <div class="tabs-list">
                                <button class="tab-trigger active" onclick="switchTab('minimos')">Requisitos Mínimos</button>
                                <button class="tab-trigger" onclick="switchTab('recomendados')">Requisitos Recomendados</button>
                            </div>
                            
                            <div id="minimos" class="tab-content active">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="w-1-3">Requisito</th>
                                            <th>Especificación</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="font-medium">Sistema operativo</td>
                                            <td>Windows 10/11 (64-bit), macOS 10.14+, Linux</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">Procesador (CPU)</td>
                                            <td>Intel Core i3-3210 o AMD A8-7600</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">Memoria RAM</td>
                                            <td>4 GB</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">Tarjeta gráfica</td>
                                            <td>Intel HD 4000 o AMD Radeon R5</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">OpenGL</td>
                                            <td>Versión 4.4 o superior</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">Espacio en disco</td>
                                            <td>1 GB + espacio adicional para mundos/mods</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">Java</td>
                                            <td>Java 17 (incluido con el launcher oficial)</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div id="recomendados" class="tab-content">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="w-1-3">Requisito</th>
                                            <th>Especificación</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="font-medium">Sistema operativo</td>
                                            <td>Windows 10/11 (64-bit), macOS 10.14+, Linux</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">Procesador (CPU)</td>
                                            <td>Intel Core i5 o AMD Ryzen 5</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">Memoria RAM</td>
                                            <td>8 GB o más</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">Tarjeta gráfica</td>
                                            <td>NVIDIA GTX 1650 o AMD Radeon RX 570</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">OpenGL</td>
                                            <td>Versión 4.4 o superior</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">Espacio en disco</td>
                                            <td>SSD con espacio suficiente</td>
                                        </tr>
                                        <tr>
                                            <td class="font-medium">Java</td>
                                            <td>Java 17 (incluido con el launcher oficial)</td>
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
            <div class="footer-content">
                <div class="social-links">
                    <a href="https://www.instagram.com/dcdevelopment_" target="_blank"><img class="IG" src="../Img/igb.png" alt="Instagram"></a>
                    <a href="https://www.tiktok.com/@digitalcraftdevel" target="_blank"><img class="TK" src="../Img/tiktokb.png" alt="TikTok"></a>
                    <a href="https://x.com/Dcdevelopment_" target="_blank"><img class="X" src="../Img/Xb.png" alt="X"></a>
                </div>
                <div class="footer-text">
                    <a href="contacto.html"><p>Información de Contacto</p></a>
                    <p class="copyright">© 2025 Todos los derechos reservados</p>
                </div>
                <div class="footer-logos">
                    <a href="https://appstac.ebizkaia.eus/es/inicio" target="_blank"> <img class="diputacion" src="../Img/DiputacionBZK.png" alt="Diputación"></a>
                    <a href="../../Pagina/castellano/index.html" target="_blank"> <img class="logo" src="../Img/DCDlogo.png" alt="DCD Logo"></a>
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