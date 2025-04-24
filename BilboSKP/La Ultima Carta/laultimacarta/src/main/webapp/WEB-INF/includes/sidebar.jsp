<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				<a href="organizarpartida.jsp" class="sidebar-link">
					<i class='bx bx-calendar'></i>
					<span><fmt:message key="menu_organizar_partida" /></span>
				</a>
			</li>
			<li>
				<a href="cupones" class="sidebar-link">
					<i class='bx bx-ticket'></i>
					<span><fmt:message key="menu_obtener_cupones" /></span>
				</a>
			</li>
			<li>
				<a href="gestionUsuarios" class="sidebar-link">
					<i class='bx bx-ticket'></i>
					<span>Gestion Usuario</span>
				</a>
			</li>
			<li>
				<a href="cerrarSesion" class="sidebar-link logout">
					<i class='bx bx-log-out'></i>
					<span><fmt:message key="menu_cerrar_sesion" /></span>
				</a>
			</li>
		</ul>
	</nav>
</div>