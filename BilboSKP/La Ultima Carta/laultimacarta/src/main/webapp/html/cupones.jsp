<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cupones</title>
    <link rel="icon" href="../Img/baldosa.png" type="image/x-icon">
    <link rel="stylesheet" href="../css/stylescupones.css">
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
        <div class="container coupons-container">
            <!-- Sidebar -->
            <div class="sidebar">
                <nav>
                    <ul>
                        <li>
                            <a href="menuperfil.html" class="sidebar-link">
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
                            <a href="cupones.html" class="sidebar-link active">
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

            <!-- Contenido de Cupones -->
            <div class="coupons-content">
                <div class="page-header">
                    <h1>Obtener Cupones</h1>
                    <p>Adquiere y gestiona tus cupones de descuento</p>
                </div>

                <!-- Resumen de puntos y cupones -->
                <div class="coupons-summary">
                    <div class="summary-card">
                        <div class="summary-icon">
                            <i class='bx bx-coin-stack'></i>
                        </div>
                        <div class="summary-info">
                            <h3>Tus Puntos</h3>
                            <p class="summary-value">1,250</p>
                        </div>
                    </div>
                    
                    <div class="summary-card">
                        <div class="summary-icon">
                            <i class='bx bx-ticket'></i>
                        </div>
                        <div class="summary-info">
                            <h3>Cupones Activos</h3>
                            <p class="summary-value">2</p>
                        </div>
                    </div>
                    
                    <div class="summary-card">
                        <div class="summary-icon">
                            <i class='bx bx-gift'></i>
                        </div>
                        <div class="summary-info">
                            <h3>Cupones Canjeados</h3>
                            <p class="summary-value">7</p>
                        </div>
                    </div>
                </div>

                <!-- Cupones disponibles -->
                <div class="block available-coupons">
                    <div class="block-header">
                        <h2>Cupones Disponibles</h2>
                        <div class="filter-dropdown">
                            <button class="filter-btn">
                                <i class='bx bx-filter-alt'></i>
                                Filtrar
                            </button>
                        </div>
                    </div>
                    
                    <div class="coupons-grid">
                        <!-- Cupón 1 - destacado -->
                        <div class="coupon-card featured">
                           
                            <div class="coupon-header">
                                <h3>1 Cupón - 15% Descuento</h3>
                                <div class="coupon-points">300 pts</div>
                            </div>
                            <div class="coupon-content">
                                <p>15% de descuento en tu próxima partida. Aplicable a cualquier día de la semana.</p>
                                <div class="coupon-details">
                                    <div class="coupon-detail">
                                        <i class='bx bx-calendar'></i>
                                        <span>Válido hasta: 30/09/2025</span>
                                    </div>
                                    <div class="coupon-detail">
                                        <i class='bx bx-info-circle'></i>
                                        <span>1 cupón individual</span>
                                    </div>
                                </div>
                            </div>
                            <div class="coupon-footer">
                                <button class="primary-button">Obtener Cupón</button>
                            </div>
                        </div>
                        
                        <!-- Cupón 5 -->
                        <div class="coupon-card">
                            <div class="coupon-header">
                                <h3>5 Cupones - 10% Descuento</h3>
                                <div class="coupon-points">1200 pts</div>
                            </div>
                            <div class="coupon-content">
                                <p>Paquete de 5 cupones con 10% de descuento cada uno. Ideal para jugadores frecuentes.</p>
                                <div class="coupon-details">
                                    <div class="coupon-detail">
                                        <i class='bx bx-calendar'></i>
                                        <span>Válido hasta: 31/10/2025</span>
                                    </div>
                                    <div class="coupon-detail">
                                        <i class='bx bx-package'></i>
                                        <span>Paquete de 5 cupones</span>
                                    </div>
                                </div>
                            </div>
                            <div class="coupon-footer">
                                <button class="primary-button">Obtener Paquete</button>
                            </div>
                        </div>
                        
                        <!-- Cupón 15 -->
                        <div class="coupon-card">
                            <div class="coupon-header">
                                <h3>15 Cupones - 20% Descuento</h3>
                                <div class="coupon-points">3000 pts</div>
                            </div>
                            <div class="coupon-content">
                                <p>Paquete de 15 cupones con 20% de descuento cada uno. La mejor opción para jugadores habituales.</p>
                                <div class="coupon-details">
                                    <div class="coupon-detail">
                                        <i class='bx bx-calendar'></i>
                                        <span>Válido hasta: 15/11/2025</span>
                                    </div>
                                    <div class="coupon-detail">
                                        <i class='bx bx-package'></i>
                                        <span>Paquete de 15 cupones</span>
                                    </div>
                                </div>
                            </div>
                            <div class="coupon-footer">
                                <button class="primary-button">Obtener Paquete</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Mis Cupones -->
                <div class="block my-coupons">
                    <h2>Mis Cupones</h2>
                    
                    <div class="tabs-header">
                        <button class="tab-btn active" data-tab="active">Activos</button>
                        <button class="tab-btn" data-tab="used">Utilizados</button>
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
                                        <h3>15% Descuento</h3>
                                        <div class="coupon-meta">
                                            <span><i class='bx bx-calendar'></i> Válido hasta: 30/09/2025</span>
                                            <span><i class='bx bx-info-circle'></i> Cupón individual</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="coupon-actions">
                                    <button class="action-btn view-btn">
                                        <i class='bx bx-show'></i>
                                        Ver
                                    </button>
                                    <button class="action-btn use-btn">
                                        <i class='bx bx-check'></i>
                                        Usar
                                    </button>
                                </div>
                            </div>
                            
                            <div class="my-coupon-item">
                                <div class="coupon-left">
                                    <div class="coupon-icon">
                                        <i class='bx bx-package'></i>
                                    </div>
                                    <div class="coupon-info">
                                        <h3>Paquete 10% Descuento</h3>
                                        <div class="coupon-meta">
                                            <span><i class='bx bx-calendar'></i> Válido hasta: 31/10/2025</span>
                                            <span><i class='bx bx-info-circle'></i> 4 cupones restantes</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="coupon-actions">
                                    <button class="action-btn view-btn">
                                        <i class='bx bx-show'></i>
                                        Ver
                                    </button>
                                    <button class="action-btn use-btn">
                                        <i class='bx bx-check'></i>
                                        Usar
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
                                        <h3>Paquete 10% Descuento</h3>
                                        <div class="coupon-meta">
                                            <span><i class='bx bx-calendar'></i> Utilizado: 05/05/2025</span>
                                            <span><i class='bx bx-info-circle'></i> 1 de 5 cupones</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="coupon-status">
                                    <span class="status-badge used">Utilizado</span>
                                </div>
                            </div>
                            
                            <div class="my-coupon-item used">
                                <div class="coupon-left">
                                    <div class="coupon-icon">
                                        <i class='bx bx-ticket'></i>
                                    </div>
                                    <div class="coupon-info">
                                        <h3>15% Descuento</h3>
                                        <div class="coupon-meta">
                                            <span><i class='bx bx-calendar'></i> Utilizado: 20/04/2025</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="coupon-status">
                                    <span class="status-badge used">Utilizado</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Información sobre cupones -->
                <div class="block coupons-info">
                    <h2>Cómo Funcionan los Cupones</h2>
                    
                    <div class="info-steps">
                        <div class="info-step">
                            <div class="step-number">1</div>
                            <div class="step-content">
                                <h3>Gana Puntos</h3>
                                <p>Acumula puntos participando en partidas, ganando torneos o completando desafíos.</p>
                            </div>
                        </div>
                        
                        <div class="info-step">
                            <div class="step-number">2</div>
                            <div class="step-content">
                                <h3>Adquiere Cupones</h3>
                                <p>Canjea tus puntos por cupones individuales o paquetes de descuento según tus necesidades.</p>
                            </div>
                        </div>
                        
                        <div class="info-step">
                            <div class="step-number">3</div>
                            <div class="step-content">
                                <h3>Utiliza tus Cupones</h3>
                                <p>Presenta tu cupón al momento de reservar o durante tu visita para disfrutar de los descuentos.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="info-notes">
                        <div class="info-note">
                            <i class='bx bx-info-circle'></i>
                            <p>Los cupones tienen una fecha de caducidad. Asegúrate de utilizarlos antes de que expiren.</p>
                        </div>
                        
                        <div class="info-note">
                            <i class='bx bx-info-circle'></i>
                            <p>No se pueden combinar múltiples cupones en una misma partida o reserva.</p>
                        </div>
                        
                        <div class="info-note">
                            <i class='bx bx-info-circle'></i>
                            <p>Los paquetes de cupones ofrecen mejor valor que los cupones individuales.</p>
                        </div>
                        
                        <div class="info-note">
                            <i class='bx bx-info-circle'></i>
                            <p>Los puntos no utilizados no caducan y se mantienen en tu cuenta.</p>
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