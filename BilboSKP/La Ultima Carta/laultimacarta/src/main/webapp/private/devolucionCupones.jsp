<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><fmt:message key="devoluciones_titulo" /></title>
  <link rel="icon" href="Img/baldosa.png" type="image/x-icon">
  <link rel="stylesheet" href="css/stylegestioncupones.css">
  <link rel="stylesheet" href="css/stylesdevoluciones.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>
  <%@ include file="/WEB-INF/includes/header.jsp"%>
  <main>
    <%@ include file="/WEB-INF/includes/sidebar.jsp"%>
    <div style="width: 100%;display: flex;flex-direction: column; gap: 1em;">
      <div class="dashboard-container">
        <!-- Título de devoluciones -->
        <section class="dashboard-summary">
          <h1><fmt:message key="dashboard_cupones_titulo" /></h1>

          <div class="cupones-grid stats-grid">
            <!-- Cupones disponibles -->
						<div class="cupones-card stat-card">
							<div class="stat-icon active">
								<i class="fas fa-ticket-alt"></i>
							</div>
							<div class="stat-info">
								<h3>
									<fmt:message key="cupones_disponibles" />
								</h3>

								<div class="cupones-list">
									<c:if test="${fn:length(usuario.suscripcion.cupones) != 0}">
										<p>${fn:length(usuario.suscripcion.cupones)}</p>
									</c:if>
									<!-- Mostrar mensaje si no hay cupones disponibles  -->
									<c:if test="${fn:length(usuario.suscripcion.cupones) == 0}">
										<div class="cupon-info">
											<p>
												0
											</p>
										</div>
									</c:if>
								</div>
							</div>
						</div>

						<!-- Comprar cupones -->
						<a href="cupones" class="cupones-card stat-card">
							<div class="stat-icon pending">
								<i class="fas fa-calendar-alt"></i>
							</div>
							<div class="stat-info">
								<h3>
									<fmt:message key="comprar_cupon" />
								</h3>
								<div class="cupon-info">
									<p class="cupon-description"><fmt:message key="comprar_cupon_descripcion" /></p>
								</div>
							</div>
						</a>	

            <!-- Historial de compras -->
            <a href="historialCompra" class="cupones-card stat-card">
              <div class="stat-icon pending">
                <i class="fas fa-calendar-alt"></i>
              </div>
              <div class="stat-info">
                <h3>
                  <fmt:message key="cupones_programados" />
                </h3>
                <div class="cupon-info">
                  <p class="cupon-description"><fmt:message key="historial_cupon_descripcion" /></p>
                </div>
              </div>
            </a>

            <!-- Devolver cupones -->
            <a href="devolucion" class="cupones-card stat-card">
              <div class="stat-icon inactive">
                <i class="fas fa-share-square"></i>
              </div>
              <div class="stat-info">
                <h3>
                  <fmt:message key="devoluciones" />
                </h3>
                <div class="cupon-info">
                  <p class="cupon-description"><fmt:message key="devolver_cupon" /></p>
                </div>
              </div>
            </a>
          </div>
        </section>
      </div>
      <div class="dashboard-container">
        <!-- Contenido principal en dos columnas -->
        <div class="content-container">
          <!-- Columna izquierda: Sección de devoluciones -->
          <div class="left-column">
            <section class="devoluciones-section secstyle">
              <div class="section-header">
                <h2><fmt:message key="mis_cupones" /></h2>
                <div class="section-divider"></div>
              </div>

              <div class="filter-options">
                <div class="filter-group">
                  <label for="filter-status"><fmt:message key="filtrar_por_estado" /></label>
                  <select id="filter-status" class="filter-select">
                    <option value="all"><fmt:message key="todos" /></option>
                    <option value="available"><fmt:message key="disponibles" /></option>
                    <option value="used"><fmt:message key="utilizados" /></option>
                    <option value="expired"><fmt:message key="expirados" /></option>
                  </select>
                </div>
                <div class="filter-group">
                  <label for="sort-by"><fmt:message key="ordenar_por" /></label>
                  <select id="sort-by" class="filter-select">
                    <option value="date-desc"><fmt:message key="fecha_reciente" /></option>
                    <option value="date-asc"><fmt:message key="fecha_antigua" /></option>
                    <option value="price-desc"><fmt:message key="precio_mayor" /></option>
                    <option value="price-asc"><fmt:message key="precio_menor" /></option>
                  </select>
                </div>
              </div>

              <div class="devoluciones-grid" id="cupones-container">
                <!-- Los cupones se cargarán dinámicamente aquí -->
              </div>

              <div class="no-results" id="no-results" style="display: none;">
                <i class="fas fa-search"></i>
                <p><fmt:message key="no_cupones_encontrados" /></p>
              </div>
            </section>
          </div>
          
          <!-- Columna derecha: Vacía o para futuro contenido -->
          <div class="right-column">
            <!-- Esta columna se deja vacía intencionalmente para mantener la estructura -->
          </div>
        </div>
      </div>
    </div>
  </main>

  <!-- Modal de confirmación de devolución -->
  <div id="modal-devolucion" class="modal">
    <div class="modal-content">
      <div class="modal-header">
        <h3><fmt:message key="confirmar_devolucion" /></h3>
        <button class="modal-close" id="modal-close">&times;</button>
      </div>
      <div class="modal-body">
        <p><fmt:message key="confirmar_devolucion_texto" /></p>
        <div class="cupon-details">
          <p><strong><fmt:message key="nombre" />:</strong> <span id="modal-cupon-name"></span></p>
          <p><strong><fmt:message key="precio" />:</strong> <span id="modal-cupon-price"></span></p>
          <p><strong><fmt:message key="fecha_compra" />:</strong> <span id="modal-cupon-date"></span></p>
        </div>
        <div class="devolucion-warning">
          <i class="fas fa-exclamation-triangle"></i>
          <p><fmt:message key="devolucion_aviso" /></p>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-cancel" id="btn-cancelar"><fmt:message key="cancelar" /></button>
        <button class="btn-devolver" id="btn-confirmar-devolucion">
          <i class="fas fa-undo"></i>
          <fmt:message key="confirmar" />
        </button>
      </div>
    </div>
  </div>

  <%@ include file="/WEB-INF/includes/footer.jsp"%>
  <%@ include file="/WEB-INF/includes/headerScripts.jsp"%>

  <script src="js/devoluciones.js"></script>
</body>
</html>