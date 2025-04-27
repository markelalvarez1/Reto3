<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="editar_perfil_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/styleeditarusuario.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/includes/header.jsp"%>
	<main>
		<%@ include file="/WEB-INF/includes/sidebar.jsp"%>
		<div style="width: 100%; display: flex; flex-direction: column;">
			<div class="dashboard-container">
				<!-- Título de edición de usuario -->
				<section class="dashboard-summary">
					<h1>
						<fmt:message key="editar_perfil_titulo" />
					</h1>

					<!-- Tarjetas de resumen/acciones -->
					<div class="stats-grid">

						<!-- Datos del centro (si es responsable) -->
						<c:if test="${usuarioEditar.rol.tipo == 'RESPONSABLE'}">
							<div class="stat-card">
								<div class="stat-icon inactive">
									<i class="fas fa-school"></i>
								</div>
								<div class="stat-info">
									<h3>
										<fmt:message key="datos_centro" />
									</h3>
									<p class="stat-description">${usuarioEditar.centroEscolar.nombre}</p>
								</div>
							</div>
						</c:if>
						<!-- Datos personales -->
						<div class="stat-card">
							<div class="stat-icon active">
								<i class="fas fa-user"></i>
							</div>
							<div class="stat-info">
								<h3>${usuarioEditar.rol.tipo}</h3>
								<p class="stat-description">${usuarioEditar.nombre}
									${usuarioEditar.apellidos}</p>
							</div>
						</div>
						<div class="cupones-card stat-card">
							<div class="stat-icon active">
								<i class="fas fa-ticket-alt"></i>
							</div>
							<div class="stat-info">
								<h3>
									<fmt:message key="cupones_disponibles" />
								</h3>

								<div class="cupones-list">
									<c:if test="${fn:length(usuarioEditar.suscripcion.cupones) != 0}">
										<p>${fn:length(usuarioEditar.suscripcion.cupones)}</p>
									</c:if>
									<!-- Mostrar mensaje si no hay cupones disponibles  -->
									<c:if test="${fn:length(usuarioEditar.suscripcion.cupones) == 0}">
										<div class="cupon-info">
											<p>
												0
											</p>
										</div>
									</c:if>
								</div>
							</div>
						</div>

					</div>
				</section>
			</div>

			<form action="actualizarUsuario" method="post" class="profile-form">
				<!-- Sección para datos del centro escolar (solo si es responsable) -->
				<c:if test="${usuarioEditar.rol.tipo == 'RESPONSABLE'}">
					<div class="dashboard-container">
						<section class="school-section secstyle">
							<div class="section-header">
								<h2>
									<fmt:message key="datos_centro" />
								</h2>
								<div class="section-divider"></div>
							</div>

							<div class="form-section">
								<div class="form-grid">
									<!-- CIF -->
									<div class="form-group">
										<label for="cif"><fmt:message key="cif" /></label> <input
											type="text" id="cif" name="cif"
											value="${usuarioEditar.centroEscolar.CIF}" required>
									</div>

									<!-- Nombre del centro -->
									<div class="form-group">
										<label for="nombreCentro"><fmt:message
												key="nombre_centro" /></label> <input type="text" id="nombreCentro"
											name="nombreCentro"
											value="${usuarioEditar.centroEscolar.nombre}" required>
									</div>

									<!-- Ciudad -->
									<div class="form-group">
										<label for="ciudad"><fmt:message key="ciudad" /></label> <input
											type="text" id="ciudad" name="ciudad"
											value="${usuarioEditar.centroEscolar.ciudad}">
									</div>
									
									<div class="form-group">
										<label for="correo"><fmt:message key="correo" /></label> <input
											type="email" id="correo" name="correo"
											value="${usuarioEditar.centroEscolar.correo}" required>
									</div>

									<!-- Etapa Educativa -->
									<div class="form-group">
										<label for="etapaEducativa"><fmt:message
												key="etapa_educativa" /></label> <input type="text"
											value="${usuarioEditar.centroEscolar.etapaEducativa}">
									</div>

									<!-- Número de alumnos -->
									<div class="form-group">
										<label for="numeroAlumnos"><fmt:message
												key="numero_alumnos" /></label> <input type="number"
											id="numeroAlumnos" name="numeroAlumnos"
											value="${usuarioEditar.centroEscolar.numeroAlumnos}" min="0">
									</div>
								</div>
							</div>
						</section>
					</div>
				</c:if>

				<!-- Datos personales (para todos los usuarios) -->
				<div class="dashboard-container">
					<section class="profile-section secstyle">
						<div class="section-header">
							<h2>
								<fmt:message key="datos_personalesdos" />
							</h2>
							<div class="section-divider"></div>
						</div>

						<div class="profile-form-container">
							<div class="form-section">
								<div class="form-grid">
									<!-- DNI -->
									<div class="form-group">
										<label for="dni"><fmt:message key="dni" /></label> <input
											type="text" id="dni" name="dni" value="${usuarioEditar.dni}"
											required>
									</div>

									<!-- Nombre -->
									<div class="form-group">
										<label for="nombre"><fmt:message key="nombre" /></label> <input
											type="text" id="nombre" name="nombre"
											value="${usuarioEditar.nombre}" required>
									</div>

									<!-- Apellidos -->
									<div class="form-group">
										<label for="apellidos"><fmt:message key="apellidos" /></label>
										<input type="text" id="apellidos" name="apellidos"
											value="${usuarioEditar.apellidos}" required>
									</div>

									<!-- Teléfono -->
									<div class="form-group">
										<label for="telefono"><fmt:message key="telefono" /></label>
										<input type="tel" id="telefono" name="telefono"
											value="${usuarioEditar.telefono}">
									</div>

									<!-- Correo -->
									<div class="form-group">
										<label for="correo"><fmt:message key="correo" /></label> <input
											type="email" id="correo" name="correo"
											value="${usuarioEditar.correo}" required>
									</div>

									<!-- Rol (solo lectura) -->
									<div class="form-group">
										<label for="rol"><fmt:message key="rol" /></label> <input
											type="text" id="rol" value="${usuarioEditar.rol.tipo}"
											readonly> <input type="hidden" name="rol_id"
											value="${usuarioEditar.rol.id}">
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</form>
			<!-- Datos de suscripción (para todos los usuarios) -->
			<div class="dashboard-container">
				<section class="subscription-section secstyle">
					<div class="section-header">
						<h2>
							<fmt:message key="datos_suscripcion" />
						</h2>
						<div class="section-divider"></div>
					</div>

					<div class="subscription-form-container">
						<div class="form-section">
							<div class="form-grid">
								<!-- Estado de suscripción -->
								<div class="form-group">
									<label for="estadoSuscripcion"><fmt:message
											key="estado_suscripcion" /></label> <input type="text"
										id="estadoSuscripcion" name="estadoSuscripcion"
										value="${usuarioEditar.suscripcion.estado}" readonly
										class="subscription-status 
                            ${usuarioEditar.suscripcion.estado == 'ACTIVA' ? 'status-active' : 
                              usuarioEditar.suscripcion.estado == 'PENDIENTE' ? 'status-pending' : 'status-canceled'}">
								</div>

								<!-- Fecha de inicio -->
								<div class="form-group">
									<label for="fechaInicio"><fmt:message
											key="fecha_inicio" /></label> <input type="date" id="fechaInicio"
										name="fechaInicio"
										value="${usuarioEditar.suscripcion.fechaInicio}" readonly>
								</div>
							</div>

							<!-- Botones de suscripción -->
							<form action="edicionUsuario" method="post">
								<div class="subscription-actions">

									<input type="hidden" name="idSuscripcion"
										value="${usuarioEditar.suscripcion.id}"> <input
										type="hidden" name="idUsuario" value="${usuarioEditar.id}">
									<c:choose>
										<c:when
											test="${usuarioEditar.suscripcion.estado == 'PENDIENTE'}">
											<button type="submit" class="btn-subscription btn-activate"
												id="activarSuscripcion">
												<i class="fas fa-check-circle"></i>
												<fmt:message key="activar_suscripcion" />
											</button>
											<button type="button" class="btn-subscription btn-cancel-sub"
												id="cancelarSuscripcion">
												<i class="fas fa-times-circle"></i>
												<fmt:message key="cancelar_suscripcion" />
											</button>
										</c:when>
										<c:when test="${usuarioEditar.suscripcion.estado == 'ACTIVA'}">
											<button type="button" class="btn-subscription btn-cancel-sub"
												id="cancelarSuscripcion">
												<i class="fas fa-times-circle"></i>
												<fmt:message key="cancelar_suscripcion" />
											</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn-subscription btn-new"
												id="nuevaSuscripcion">
												<i class="fas fa-plus-circle"></i>
												<fmt:message key="nueva_suscripcion" />
											</button>
										</c:otherwise>
									</c:choose>

								</div>
							</form>
						</div>
					</div>
				</section>
			</div>

			<!-- Botones de acción -->
			<div class="dashboard-container">
				<section class="actions-section secstyle">
					<div class="form-actions">
						<button type="submit" class="btn-action btn-save">
							<i class="fas fa-save"></i>
							<fmt:message key="guardar_cambios" />
						</button>
						<a href="gestionCentros" class="btn-action btn-cancel"> <i
							class="fas fa-times"></i> <fmt:message key="cancelar" />
						</a>
					</div>
				</section>
			</div>

		</div>
	</main>
	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
</body>
</html>