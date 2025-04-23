<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="dashboard_usuarios_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/stylegestionusuarios.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/includes/header.jsp"%>
	<main>
		<%@ include file="/WEB-INF/includes/sidebar.jsp"%>
		<div class="dashboard-container">
			<!-- Resumen General -->
			<section class="dashboard-summary">
				<h1>
					<fmt:message key="dashboard_usuarios_titulo" />
				</h1>

				<div class="stats-grid">
					<div class="stat-card">
						<div class="stat-icon">
							<i class="fas fa-users"></i>
						</div>
						<div class="stat-info">
							<h3>
								<fmt:message key="usuarios_totales" />
							</h3>
							<p class="stat-number">${usuariosTotal }</p>
						</div>
					</div>

					<div class="stat-card">
						<div class="stat-icon active">
							<i class="fas fa-user-check"></i>
						</div>
						<div class="stat-info">
							<h3>
								<fmt:message key="usuarios_activos" />
							</h3>
							<p class="stat-number">${usuariosActivos }</p>
						</div>
					</div>

					<div class="stat-card">
						<div class="stat-icon pending">
							<i class="fas fa-hourglass-half"></i>
						</div>
						<div class="stat-info">
							<h3>
								<fmt:message key="pendientes_suscripcion" />
							</h3>
							<p class="stat-number">${usuariosPendientes }</p>
						</div>
					</div>

					<div class="stat-card">
						<div class="stat-icon inactive">
							<i class="fas fa-user-times"></i>
						</div>
						<div class="stat-info">
							<h3>
								<fmt:message key="usuarios_inactivos" />
							</h3>
							<p class="stat-number">${usuariosCancelados }</p>
						</div>
					</div>
				</div>
			</section>

			<!-- Accesos Rápidos -->
			<section class="quick-actions">
				<button class="btn-action"
					onclick="window.location.href='crear-usuario.jsp'">
					<i class="fas fa-user-plus"></i>
					<fmt:message key="crear_usuario" />
				</button>

			</section>

			<!-- Filtros y Búsqueda -->
			<section class="filters-section">
				<div class="search-box">
					<input type="text" id="buscarUsuario"
						placeholder="<fmt:message key="buscar_usuario" />">
					<button>
						<i class="fas fa-search"></i>
					</button>
				</div>

				<div class="filters">


					<div class="filter-group">
						<label for="filtroEstado"><fmt:message
								key="filtrar_estado" /></label> <select id="filtroEstado">
							<option value=""><fmt:message key="todos" /></option>
							<option value="activo"><fmt:message key="activo" /></option>
							<option value="pendiente"><fmt:message key="pendiente" /></option>
							<option value="inactivo"><fmt:message key="inactivo" /></option>
						</select>
					</div>

					<button class="btn-filter">
						<fmt:message key="aplicar_filtros" />
					</button>
				</div>
			</section>

			<!-- Lista de Usuarios -->
			<section class="users-list-section">
				<div class="tabla-scroll">
					<table class="custom-table" id="tablaUsuarios">
						<thead>
							<tr>
								<th>#</th>
								<th><fmt:message key="nombre" /></th>
								<th><fmt:message key="apellidos" /></th>
								<th><fmt:message key="email" /></th>
								<th><fmt:message key="rol" /></th>
								<th><fmt:message key="estado" /></th>
								<th><fmt:message key="fecha_registro" /></th>
								<th><fmt:message key="acciones" /></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="usuario" items="${listaUsuarios}" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td>${usuario.nombre}</td>
									<td>${usuario.apellidos}</td>
									<td>${usuario.correo}</td>
									<td>${usuario.rol.tipo}</td>
									<td><span id="estado-${usuario.id}">${usuario.suscripcion.estado}</span></td>
									<td>${usuario.suscripcion.fechaInicio}</td>
									<td>
										<div class="botones-accion">
											<button class="btn-editar"
												onclick="redirigirEditarUsuario(1)">
												<i class="fas fa-edit"></i>
											</button>
											<button class="btn-ver" onclick="verDetalles(1)">
												<i class="fas fa-eye"></i>
											</button>
											<button class="btn-eliminar" onclick="confirmarEliminar(1)">
												<i class="fas fa-trash"></i>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- Paginación -->
				<div class="paginacion">
					<button class="pagina-btn prev">
						<i class="fas fa-chevron-left"></i>
					</button>
					<button class="pagina-btn activa">1</button>
					<button class="pagina-btn">2</button>
					<button class="pagina-btn">3</button>
					<button class="pagina-btn next">
						<i class="fas fa-chevron-right"></i>
					</button>
				</div>
			</section>
		</div>

		<!-- Modal Confirmar Eliminación - Se mantiene porque es para confirmar acción -->
		<div id="confirmarEliminarModal" class="modal">
			<div class="modal-content modal-small">
				<div class="modal-header">
					<h2>
						<fmt:message key="confirmar_eliminacion" />
					</h2>
					<span class="close-modal"
						onclick="cerrarModal('confirmarEliminarModal')">&times;</span>
				</div>
				<div class="modal-body">
					<p>
						<fmt:message key="mensaje_confirmacion_eliminar" />
					</p>
					<input type="hidden" id="deleteUserId">
					<div class="form-actions">
						<button type="button" class="btn-secondary"
							onclick="cerrarModal('confirmarEliminarModal')">
							<fmt:message key="cancelar" />
						</button>
						<button type="button" class="btn-danger"
							onclick="eliminarUsuario()">
							<fmt:message key="eliminar" />
						</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>

	<script>
		document.querySelectorAll('[id^="estado-"]').forEach(function(estado) {
			const valor = estado.textContent.trim(); // Obtener el contenido dinámico del span

			// Cambiar la clase según el valor
			if (valor === "ACTIVA") {
				estado.className = "estado-activo";
			} else if (valor === "PENDIENTE") {
				estado.className = "estado-pendiente";
			} else if (valor === "CANCELADA") {
				estado.className = "estado-inactivo";
			}
		});
	</script>



	<script>
		// Función para redirigir a la página de edición de usuario
		function redirigirEditarUsuario(userId) {
			window.location.href = 'editar-usuario.jsp?id=' + userId;
		}

		// Funciones para ver detalles y confirmar eliminación
		function verDetalles(userId) {
			// Redirigir a página de detalles
			window.location.href = 'detalles-usuario.jsp?id=' + userId;
		}

		function confirmarEliminar(userId) {
			document.getElementById('deleteUserId').value = userId;
			abrirModal('confirmarEliminarModal');
		}
	</script>
</body>
</html>