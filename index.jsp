<%@ include file="/WEB-INF/includes/idioma.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="titulo_bilbao_skp" /></title>
    <link rel="icon" href="Img/baldosa.png" type="image/x-icon">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="css/stylesindex.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <header id="main-header">
        <div class="container">
            <a href="#" class="logo"><fmt:message key="logo_bilbao_skp" /></a>
            
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
                        <li><a href="html/jugar.html"><fmt:message key="jugar" /></a></li>
                        <li><a href="html/gestion.html"><fmt:message key="gestion" /></a></li>
                        <li><a href="#opinions"><fmt:message key="opiniones" /></a></li>
                        <li><a href="html/contacto.html"><fmt:message key="contacto" /></a></li>
                        <li><a href="html/ranking.html"><fmt:message key="ranking" /></a></li>
                    </ul>
                </nav>
                <div class="header-buttons">
                    <button class="btn-primary"><a href="html/inicioeleccion.html"><fmt:message key="iniciar_sesion" /></a></button>
                    <button class="btn-secondary"><a href="html/registroeleccion.html"><fmt:message key="registrarse" /></a></button>
                    <button class="btn-tertiary"><fmt:message key="english" /></button>
                </div>
            </div>
        </div>
    </header>

    <section class="hero">
        <video class="hero-video" autoplay loop muted playsinline>
            <source src="Img/Videofondo.mp4" type="video/mp4">
            Tu navegador no soporta videos en HTML5.
        </video>
        <div class="hero-overlay"></div>
        <div class="container">
            <h1><fmt:message key="ultima_carta" /></h1>
            <p><fmt:message key="descripcion_ultima_carta" /></p>
            <button class="btn-primary"><a href="html/jugar.html"><fmt:message key="jugar" /></a></button>
        </div>
    </section>

    <section class="opinions" id="opinions">
        <div class="container">
            <h2><fmt:message key="opiniones_usuarios" /></h2>
            <div class="opinion-cards" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-delay="125">
                <div class="opinion-card"> 
                    <h3>@ProfLaura_92</h3>
                    <div class="stars">
                        <img class="estrellas" src="Img/estrellas5.png" alt="5 estrellas">
                    </div>
                    <p><fmt:message key="opinion_proflaura" /></p>
                </div>
                <div class="opinion-card"> 
                    <h3>@CarlosGamer16</h3>
                    <div class="stars">
                        <img class="estrellas" src="Img/estrellas4.png" alt="4 estrellas">
                    </div>
                    <p><fmt:message key="opinion_carlosgamer" /></p>
                </div>
                <div class="opinion-card"> 
                    <h3>@CulturaJoven_88</h3>
                    <div class="stars">
                        <img class="estrellas" src="Img/estrellas5.png" alt="5 estrellas">
                    </div>
                    <p><fmt:message key="opinion_culturajoven" /></p>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="social-links">
                    <a href="https://www.instagram.com/dcdevelopment_" target="_blank"><img class="IG" src="Img/igb.png" alt="Instagram"></a>
                    <a href="https://www.tiktok.com/@digitalcraftdevel" target="_blank"><img class="TK" src="Img/tiktokb.png" alt="TikTok"></a>
                    <a href="https://x.com/Dcdevelopment_" target="_blank"><img class="X" src="Img/Xb.png" alt="X"></a>
                </div>
                <div class="footer-text">
                    <a href="html/contacto.html"><p><fmt:message key="informacion_contacto" /></p></a>
                    <p class="copyright"><fmt:message key="copyright" /></p>
                </div>
                <div class="footer-logos">
                    <a href="https://appstac.ebizkaia.eus/es/inicio" target="_blank"><img class="diputacion" src="Img/DiputacionBZK.png" alt="Diputación"></a>
                    <a href="../Pagina/castellano/index.html" target="_blank"><img class="logo" src="Img/DCDlogo.png" alt="DCD Logo"></a>
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
    </script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>
