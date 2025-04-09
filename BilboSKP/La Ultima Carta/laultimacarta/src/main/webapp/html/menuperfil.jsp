<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Perfil</title>
    <link rel="icon" href="../Img/baldosa.png" type="image/x-icon">
    <link rel="stylesheet" href="../css/stylesmenu.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
                        <li><a href="jugar.html">Jugar</a></li>
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
                                <span>Menu del perfil</span>
                            </a>
                        </li>
                        <li>
                            <a href="ranking.html" class="sidebar-link">
                                <i class='bx bx-trophy'></i>
                                <span>Ranking</span>
                            </a>
                        </li>
                        <li>
                            <a href="organizarpartida.html" class="sidebar-link">
                                <i class='bx bx-calendar'></i>
                                <span>Organizar Partida</span>
                            </a>
                        </li>
                        <li>
                            <a href="cupones.html" class="sidebar-link">
                                <i class='bx bx-ticket'></i>
                                <span>Obtener cupones</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="sidebar-link logout">
                                <i class='bx bx-log-out'></i>
                                <span>Cerrar sesión</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>

            <!-- Contenido del Perfil -->
            <div class="profile-content">
                <div class="page-header">
                    <h1>Perfil de Usuario</h1>
                    <p>Gestiona tu información personal y preferencias</p>
                </div>

                <!-- Sección de perfil principal -->
                <div class="profile-main">
                    <!-- Tarjeta de perfil -->
                    <div class="block profile-card">
                        <div class="profile-header">
                            <div class="profile-avatar-large">
                                <img src="https://via.placeholder.com/200" alt="Avatar de usuario">
                                <button class="change-avatar-btn">
                                    <i class='bx bx-camera'></i>
                                </button>
                            </div>
                            <div class="profile-info-main">
                                <h2>Carlos Rodríguez</h2>
                                <p class="username">@carlos_r</p>
                                <div class="profile-badges">
                                    <span class="badge level-badge">Nivel 5</span>
                                    <span class="badge rank-badge">Rank #8</span>
                                    <span class="badge member-badge">Miembro desde 2023</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="profile-stats-row">
                            <div class="stat-box">
                                <div class="stat-value">1250</div>
                                <div class="stat-label">Puntos</div>
                            </div>
                            <div class="stat-box">
                                <div class="stat-value">28</div>
                                <div class="stat-label">Partidas</div>
                            </div>
                            <div class="stat-box">
                                <div class="stat-value">15</div>
                                <div class="stat-label">Victorias</div>
                            </div>
                            <div class="stat-box">
                                <div class="stat-value">53%</div>
                                <div class="stat-label">Ratio</div>
                            </div>
                        </div>
                        
                        <div class="profile-bio">
                            <h3>Sobre mí</h3>
                            <p>Apasionado de los juegos de estrategia y competitivos. Me encanta participar en torneos y conocer nuevos jugadores. Siempre buscando mejorar mi nivel y aprender nuevas tácticas.</p>
                        </div>
                    </div>
                    
                    <!-- Sección de logros -->
                    <div class="block achievements-block">
                        <div class="block-header">
                            <h2>Logros</h2>
                            <a href="#" class="view-all-link">Ver todos</a>
                        </div>
                        
                        <div class="achievements-grid">
                            <div class="achievement-card">
                                <div class="achievement-icon unlocked">
                                    <i class='bx bx-medal'></i>
                                </div>
                                <div class="achievement-info">
                                    <h3>Primer Victoria</h3>
                                    <p>Gana tu primera partida</p>
                                </div>
                            </div>
                            
                            <div class="achievement-card">
                                <div class="achievement-icon unlocked">
                                    <i class='bx bx-group'></i>
                                </div>
                                <div class="achievement-info">
                                    <h3>Organizador</h3>
                                    <p>Organiza 5 partidas</p>
                                </div>
                            </div>
                            
                            <div class="achievement-card">
                                <div class="achievement-icon unlocked">
                                    <i class='bx bx-trophy'></i>
                                </div>
                                <div class="achievement-info">
                                    <h3>Competidor</h3>
                                    <p>Participa en 10 partidas</p>
                                </div>
                            </div>
                            
                            <div class="achievement-card">
                                <div class="achievement-icon locked">
                                    <i class='bx bx-crown'></i>
                                </div>
                                <div class="achievement-info">
                                    <h3>Campeón</h3>
                                    <p>Gana 20 partidas</p>
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
                        <button class="tab-btn active" data-tab="history">Historial</button>
                        <button class="tab-btn" data-tab="settings">Configuración</button>
                    </div>
                    
                    <!-- Contenido de las pestañas -->
                    <div class="tab-content active" id="history-tab">
                        <div class="block history-block">
                            <h2>Historial de Partidas</h2>
                            
                            <div class="history-list">
                                <div class="history-item">
                                    <div class="history-date">
                                        <span class="day">15</span>
                                        <span class="month">JUN</span>
                                    </div>
                                    <div class="history-details">
                                        <div class="history-header">
                                            <h3>Torneo de verano</h3>
                                            <span class="history-result win">Victoria</span>
                                        </div>
                                        <div class="history-info">
                                            <p><i class='bx bx-time'></i> 18:00 - 20:30</p>
                                            <p><i class='bx bx-group'></i> 8 jugadores</p>
                                            <p><i class='bx bx-plus-circle'></i> 150 puntos</p>
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
                                            <h3>Partida amistosa</h3>
                                            <span class="history-result loss">Derrota</span>
                                        </div>
                                        <div class="history-info">
                                            <p><i class='bx bx-time'></i> 17:30 - 19:00</p>
                                            <p><i class='bx bx-group'></i> 4 jugadores</p>
                                            <p><i class='bx bx-minus-circle'></i> 25 puntos</p>
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
                                            <h3>Competición semanal</h3>
                                            <span class="history-result win">Victoria</span>
                                        </div>
                                        <div class="history-info">
                                            <p><i class='bx bx-time'></i> 19:00 - 21:30</p>
                                            <p><i class='bx bx-group'></i> 6 jugadores</p>
                                            <p><i class='bx bx-plus-circle'></i> 120 puntos</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="view-more">
                                <button class="view-more-btn">Cargar más partidas</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="tab-content" id="settings-tab">
                        <div class="block settings-block">
                            <h2>Configuración de la Cuenta</h2>
                            
                            <div class="settings-sections">
                                <div class="settings-section">
                                    <h3>Información Personal</h3>
                                    
                                    <form class="settings-form">
                                        <div class="form-group">
                                            <label for="full-name">Nombre completo</label>
                                            <input type="text" id="full-name" value="Carlos Rodríguez">
                                        </div>
                                        
                                        <div class="form-row">
                                            <div class="form-group">
                                                <label for="username">Nombre de usuario</label>
                                                <input type="text" id="username" value="carlos_r">
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="email">Correo electrónico</label>
                                                <input type="email" id="email" value="carlos@ejemplo.com">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="bio">Biografía</label>
                                            <textarea id="bio" rows="3">Apasionado de los juegos de estrategia y competitivos. Me encanta participar en torneos y conocer nuevos jugadores. Siempre buscando mejorar mi nivel y aprender nuevas tácticas.</textarea>
                                        </div>
                                    </form>
                                </div>
                                
                                <div class="settings-section">
                                    <h3>Preferencias</h3>
                                    
                                    <div class="settings-options">
                                        <div class="settings-option">
                                            <div class="option-info">
                                                <h4>Notificaciones por correo</h4>
                                                <p>Recibir notificaciones sobre partidas y eventos</p>
                                            </div>
                                            <label class="toggle">
                                                <input type="checkbox" checked>
                                                <span class="toggle-slider"></span>
                                            </label>
                                        </div>
                                        
                                        <div class="settings-option">
                                            <div class="option-info">
                                                <h4>Perfil público</h4>
                                                <p>Permitir que otros usuarios vean tu perfil</p>
                                            </div>
                                            <label class="toggle">
                                                <input type="checkbox" checked>
                                                <span class="toggle-slider"></span>
                                            </label>
                                        </div>
                                        
                                        <div class="settings-option">
                                            <div class="option-info">
                                                <h4>Mostrar estado online</h4>
                                                <p>Mostrar a otros cuando estás conectado</p>
                                            </div>
                                            <label class="toggle">
                                                <input type="checkbox">
                                                <span class="toggle-slider"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="settings-section">
                                    <h3>Seguridad</h3>
                                    
                                    <div class="security-options">
                                        <button class="security-btn">
                                            <i class='bx bx-lock-alt'></i>
                                            Cambiar contraseña
                                        </button>
                                        
                                        <button class="security-btn">
                                            <i class='bx bx-shield-quarter'></i>
                                            Activar autenticación en dos pasos
                                        </button>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="settings-actions">
                                <button class="secondary-button">Cancelar</button>
                                <button class="primary-button">Guardar Cambios</button>
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
                    <a href="https://www.instagram.com/dcdevelopment_" target="_blank"><img class="IG" src="../Img/igb.png" alt="Instagram"></a>
                    <a href="https://www.tiktok.com/@digitalcraftdevel" target="_blank"><img class="TK" src="../Img/tiktokb.png" alt="TikTok"></a>
                    <a href="https://x.com/Dcdevelopment_" target="_blank"><img  class="X" src="../Img/Xb.png" alt="X"></a>
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