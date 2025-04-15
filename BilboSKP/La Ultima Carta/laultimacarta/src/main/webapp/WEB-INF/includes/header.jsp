<!-- Header Section -->
<header id="main-header">
	<div class="container">
		<a href="Index.jsp" class="logo"><fmt:message key="logo_bilbao_skp" /></a>

		<!-- Hamburger Menu for Mobile -->
		<div class="hamburger-menu">
			<div class="hamburger-icon">
				<span></span> <span></span> <span></span>
			</div>
		</div>

		<div class="nav-container">
			<!-- Navigation Menu -->
			<nav>
				<ul>
					<li><a href="jugar.jsp"><fmt:message key="menu_jugar" /></a></li>
					<li><a href="gestion.jsp"><fmt:message key="menu_gestion" /></a></li>
					<li><a href="Index.jsp#opinions"><fmt:message key="menu_opiniones" /></a></li>
					<li><a href="contacto.jsp"><fmt:message
								key="menu_contacto" /></a></li>
					<li><a href="ranking.jsp"><fmt:message key="menu_ranking" /></a></li>
				</ul>
			</nav>

			<!-- Header Buttons -->
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