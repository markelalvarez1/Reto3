<!-- Header Section -->
<header id="main-header">
	<div class="container">
		<a href="inicio" class="logo"><fmt:message key="logo_bilbao_skp" /></a>

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
					<li><a href="jugar"><fmt:message key="menu_jugar" /></a></li>
					<c:if test="${not empty sessionScope.usuario}">
						<li><a href="gestion.jsp"><fmt:message key="menu_gestion" /></a></li>
						<li><a href="ranking"><fmt:message key="menu_ranking" /></a></li>
					</c:if>
					<li><a href="inicio#opinions"><fmt:message
								key="menu_opiniones" /></a></li>
					<li><a href="contacto"><fmt:message
								key="menu_contacto" /></a></li>

				</ul>
			</nav>

			<!-- Header Buttons -->
			<div class="header-buttons">
				<c:choose>
					<c:when test="${not empty sessionScope.usuario}">
						<button class="btn-primary">
							<a href="cerrarSesion"><fmt:message key="boton_cerrar" /></a>
						</button>
					</c:when>
					<c:otherwise>
						<button class="btn-primary">
							<a href="inicioSesion"><fmt:message key="boton_iniciar" /></a>
						</button>
						<button class="btn-secondary">
							<a href="registroEleccion"><fmt:message
									key="boton_registrar" /></a>
						</button>
					</c:otherwise>
				</c:choose>
				<button class="btn-tertiary">
					<a href="?lang=${sessionScope.lang eq 'en' ? 'es' : 'en'}"> <fmt:message
							key="boton_idioma" />
					</a>
				</button>
			</div>
		</div>
	</div>
</header>