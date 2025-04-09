<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="formulario_registro_titulo" /></title>
    <link rel="icon" href="../Img/baldosa.png" type="image/x-icon">
    <link rel="stylesheet" href="../css/stylesregistro.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <header id="main-header">
        <div class="container">
            <a href="../Index.html" class="logo"><fmt:message key="logo_bilbao_skp" /></a>

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
                        <li><a href="jugar.html"><fmt:message key="menu_jugar" /></a></li>
                        <li><a href="gestion.html"><fmt:message key="menu_gestion" /></a></li>
                        <li><a href="../index.html#opinions"><fmt:message key="menu_opiniones" /></a></li>
                        <li><a href="contacto.html"><fmt:message key="menu_contacto" /></a></li>
                        <li><a href="ranking.html"><fmt:message key="menu_ranking" /></a></li>
                    </ul>
                </nav>
                <div class="header-buttons">
                    <button class="btn-primary"><a href="inicioeleccion.html"><fmt:message key="boton_iniciar" /></a></button>
                    <button class="btn-secondary"><a href="registroeleccion.html"><fmt:message key="boton_registrar" /></a></button>
                    <button class="btn-tertiary"><fmt:message key="boton_english" /></button>
                </div>
            </div>
        </div>
    </header>

    <main>
        <div class="container">
            <div class="form-container">
                <h1><fmt:message key="formulario_registro_titulo" /></h1>

                <div class="form-content">
                    <div id="individual-form" class="form-fields">
                        <div class="form-group">
                            <label for="name"><fmt:message key="form_nombre" /></label>
                            <input type="text" id="name" name="name" placeholder="<fmt:message key='placeholder_nombre' />">
                        </div>

                        <div class="form-group">
                            <label for="dni"><fmt:message key="form_dni" /></label>
                            <input type="text" id="dni" name="dni" placeholder="<fmt:message key='placeholder_dni' />"> 
                        </div>

                        <div class="form-group">
                            <label for="email"><fmt:message key="form_email" /></label>
                            <input type="email" id="email" name="email" placeholder="<fmt:message key='placeholder_email' />">
                        </div>

                        <div class="form-group">
                            <label for="password"><fmt:message key="form_contrasena" /></label>
                            <input type="password" id="password" name="password" placeholder="<fmt:message key='placeholder_contrasena' />">
                        </div>

                        <div class="form-group">
                            <label for="repeat-password"><fmt:message key="form_repetir_contrasena" /></label>
                            <input type="password" id="repeat-password" name="repeat-password" placeholder="<fmt:message key='placeholder_repetir_contrasena' />">
                        </div>

                        <div class="form-group">
                            <label for="phone"><fmt:message key="form_telefono" /></label>
                            <input type="tel" id="phone" name="phone" placeholder="<fmt:message key='placeholder_telefono' />">
                        </div>

                        <button class="submit-btn"><fmt:message key="boton_enviar" /></button>
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
                    <a href="https://x.com/Dcdevelopment_" target="_blank"><img class="X" src="../Img/Xb.png" alt="X"></a>
                </div>
                <div class="footer-text">
                    <a href="contacto.html"><p><fmt:message key="footer_contacto" /></p></a>
                    <p class="copyright"><fmt:message key="footer_derechos" /></p>
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
        });
    </script>
</body>
</html>

