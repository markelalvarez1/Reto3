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
		<div style="width: 100%;display: flex;flex-direction: column; gap: 1em;">
			<div class="dashboard-container">
				<!-- Título de edición de usuario -->
				<section class="dashboard-summary">
					<h1>
						<fmt:message key="editar_perfil_titulo" />
					</h1>
                    
                    <div class="profile-form-container">
                        <form action="actualizarUsuario" method="post" class="profile-form">
                            <div class="form-section">
                                <h2><fmt:message key="datos_personales" /></h2>
                                <div class="form-grid">
                                    <!-- DNI -->
                                    <div class="form-group">
                                        <label for="dni"><fmt:message key="dni" /></label>
                                        <input type="text" id="dni" name="dni" value="${usuario.dni}" required>
                                    </div>
                                    
                                    <!-- Nombre -->
                                    <div class="form-group">
                                        <label for="nombre"><fmt:message key="nombre" /></label>
                                        <input type="text" id="nombre" name="nombre" value="${usuario.nombre}" required>
                                    </div>
                                    
                                    <!-- Apellidos -->
                                    <div class="form-group">
                                        <label for="apellidos"><fmt:message key="apellidos" /></label>
                                        <input type="text" id="apellidos" name="apellidos" value="${usuario.apellidos}" required>
                                    </div>
                                    
                                    <!-- Teléfono -->
                                    <div class="form-group">
                                        <label for="telefono"><fmt:message key="telefono" /></label>
                                        <input type="tel" id="telefono" name="telefono" value="${usuario.telefono}">
                                    </div>
                                    
                                    <!-- Correo -->
                                    <div class="form-group">
                                        <label for="correo"><fmt:message key="correo" /></label>
                                        <input type="email" id="correo" name="correo" value="${usuario.correo}" required>
                                    </div>
                                    
                                    <!-- Rol (solo lectura) -->
                                    <div class="form-group">
                                        <label for="rol"><fmt:message key="rol" /></label>
                                        <input type="text" id="rol" value="${usuario.rol.tipo}" readonly>
                                        <input type="hidden" name="rol_id" value="${usuario.rol.id}">
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Sección para datos del centro escolar (solo si es responsable) -->
                            <c:if test="${usuario.rol.tipo == 'RESPONSABLE'}">
                                <div class="form-section">
                                    <h2><fmt:message key="datos_centro" /></h2>
                                    <div class="form-grid">
                                        <!-- CIF -->
                                        <div class="form-group">
                                            <label for="cif"><fmt:message key="cif" /></label>
                                            <input type="text" id="cif" name="cif" value="${centroEscolar.cif}" required>
                                        </div>
                                        
                                        <!-- Nombre del centro -->
                                        <div class="form-group">
                                            <label for="nombreCentro"><fmt:message key="nombre_centro" /></label>
                                            <input type="text" id="nombreCentro" name="nombreCentro" value="${centroEscolar.nombre}" required>
                                        </div>
                                        
                                        <!-- Ciudad -->
                                        <div class="form-group">
                                            <label for="ciudad"><fmt:message key="ciudad" /></label>
                                            <input type="text" id="ciudad" name="ciudad" value="${centroEscolar.ciudad}">
                                        </div>
                                        
                                        <!-- Etapa Educativa -->
                                        <div class="form-group">
                                            <label for="etapaEducativa"><fmt:message key="etapa_educativa" /></label>
                                            <select id="etapaEducativa" name="etapaEducativa">
                                                <option value="INFANTIL" ${centroEscolar.etapaEducativa == 'INFANTIL' ? 'selected' : ''}><fmt:message key="infantil" /></option>
                                                <option value="PRIMARIA" ${centroEscolar.etapaEducativa == 'PRIMARIA' ? 'selected' : ''}><fmt:message key="primaria" /></option>
                                                <option value="SECUNDARIA" ${centroEscolar.etapaEducativa == 'SECUNDARIA' ? 'selected' : ''}><fmt:message key="secundaria" /></option>
                                                <option value="BACHILLERATO" ${centroEscolar.etapaEducativa == 'BACHILLERATO' ? 'selected' : ''}><fmt:message key="bachillerato" /></option>
                                                <option value="FP" ${centroEscolar.etapaEducativa == 'FP' ? 'selected' : ''}><fmt:message key="fp" /></option>
                                            </select>
                                        </div>
                                        
                                        <!-- Número de alumnos -->
                                        <div class="form-group">
                                            <label for="numeroAlumnos"><fmt:message key="numero_alumnos" /></label>
                                            <input type="number" id="numeroAlumnos" name="numeroAlumnos" value="${centroEscolar.numeroAlumnos}" min="0">
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            
                            <!-- Sección para cambiar contraseña -->
                            <div class="form-section">
                                <h2><fmt:message key="cambiar_contrasena" /></h2>
                                <p class="password-hint"><fmt:message key="contrasena_hint" /></p>
                                <div class="form-grid">
                                    <!-- Nueva contraseña -->
                                    <div class="form-group">
                                        <label for="nuevaContrasena"><fmt:message key="nueva_contrasena" /></label>
                                        <input type="password" id="nuevaContrasena" name="nuevaContrasena">
                                    </div>
                                    
                                    <!-- Confirmar contraseña -->
                                    <div class="form-group">
                                        <label for="confirmarContrasena"><fmt:message key="confirmar_contrasena" /></label>
                                        <input type="password" id="confirmarContrasena" name="confirmarContrasena">
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Botones de acción -->
                            <div class="form-actions">
                                <button type="submit" class="btn-action btn-save">
                                    <i class="fas fa-save"></i> <fmt:message key="guardar_cambios" />
                                </button>
                                <a href="perfil" class="btn-action btn-cancel">
                                    <i class="fas fa-times"></i> <fmt:message key="cancelar" />
                                </a>
                            </div>
                        </form>
                    </div>
				</section>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
</body>
</html>