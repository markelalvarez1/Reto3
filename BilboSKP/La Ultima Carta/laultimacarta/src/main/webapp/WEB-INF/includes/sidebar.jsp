<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Sidebar -->
<div class="sidebar">
	<nav>
		<ul>
			<li>
				<a href="gestion" class="sidebar-link">
					<i class='bx bx-user'></i>
					<span><fmt:message key="menu_perfil" /></span>
				</a>
			</li>
			<c:if test="${sessionScope.usuario.rol.id != 2}">
				<li>
					<a href="ranking" class="sidebar-link">
						<i class='bx bx-trophy'></i>
						<span><fmt:message key="menu_ranking" /></span>
					</a>
				</li>
			</c:if>
			<li>
				<a href="organizarPartida" class="sidebar-link">
					<i class='bx bx-calendar'></i>
					<span><fmt:message key="menu_organizar_partida" /></span>
				</a>
			</li>
			<li>
				<a href="cupones" class="sidebar-link">
					<i class='bx bx-purchase-tag-alt'></i>
					<span><fmt:message key="menu_obtener_cupones" /></span>
				</a>
			</li>
			<c:if test="${sessionScope.usuario.rol.id == 1}">
				<li>
					<a href="gestionUsuarios" class="sidebar-link">
						<i class='bx bx-user-circle'></i>
						<span><fmt:message key="menu_gestion_usuario" /></span>
					</a>
				</li>
				<li>
					<a href="gestionCentros" class="sidebar-link">
						<i class='bx bx-buildings'></i>
						<span><fmt:message key="gestion_centro" /></span>
				</a>
			</li>
			
			</c:if>
			<li>
				<a href="cerrarSesion" class="sidebar-link logout">
					<i class='bx bx-log-out'></i>
					<span><fmt:message key="menu_cerrar_sesion" /></span>
				</a>
			</li>
		</ul>
	</nav>
</div>