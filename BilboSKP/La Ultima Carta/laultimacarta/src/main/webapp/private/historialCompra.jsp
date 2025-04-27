<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><fmt:message key="dashboard_historial_titulo" /></title>
  <link rel="icon" href="Img/baldosa.png" type="image/x-icon">
  <link rel="stylesheet" href="css/stylehistorialcompra.css">
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
        <!-- Título de historial de compras -->
        <section class="dashboard-summary">
          <h1><fmt:message key="dashboard_cupones_titulo" /></h1>

          <!-- Estructura de tres tarjetas como en el primer archivo -->
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
                <h3><fmt:message key="cupones_programados" /></h3>
                <div class="cupon-info">
                  <p class="cupon-description">Descripción historial</p>
                </div>
              </div>
            </a>

            <!-- Devolver cupones -->
            <a href="devolucion" class="cupones-card stat-card">
              <div class="stat-icon inactive">
                <i class="fas fa-share-square"></i>
              </div>
              <div class="stat-info">
                <h3><fmt:message key="devoluciones" /></h3>
                <div class="cupon-info">
                  <p class="cupon-description">Descripción devolver</p>
                </div>
              </div>
            </a>
          </div>
        </section>
      </div>
      <div class="dashboard-container">
        <!-- Nueva estructura de contenido en dos columnas -->
        <div class="content-container">
          <!-- Columna izquierda: Historial de compras -->
          <div class="left-column">
            <section class="historial-compras-section secstyle">
              <div class="section-header">
                <h2><fmt:message key="compras_realizadas" /></h2>
                <div class="section-divider"></div>
              </div>
              
              <div class="table-responsive">
                <table class="historial-tabla">
                  <thead>
                    <tr>
                      <th><fmt:message key="fecha_compra" /></th>
                      <th><fmt:message key="producto" /></th>
                      <th><fmt:message key="cantidad" /></th>
                      <th><fmt:message key="coste_total" /></th>
                      <th><fmt:message key="Factura" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- Datos ficticios para la tabla -->
                    <tr>
                      <td>24/04/2025</td>
                      <td>Cupón</td>
                      <td>3</td>
                      <td>7,50 €</td>
                      <td>
                        <button class="btn-action-small btn-download">
                          <i class="fas fa-download"></i>
                        </button>
                      </td>
                    </tr>
                    <tr>
                      <td>20/04/2025</td>
                      <td>Cupón</td>
                      <td>1</td>
                      <td>2,50 €</td>
                      <td>
                        <button class="btn-action-small btn-download">
                          <i class="fas fa-download"></i>
                        </button>
                      </td>
                    </tr>
                    <tr>
                      <td>15/04/2025</td>
                      <td>Cupón</td>
                      <td>5</td>
                      <td>12,50 €</td>
                      <td>
                        <button class="btn-action-small btn-download">
                          <i class="fas fa-download"></i>
                        </button>
                      </td>
                    </tr>
                    <tr>
                      <td>08/04/2025</td>
                      <td>Cupón</td>
                      <td>2</td>
                      <td>5,00 €</td>
                      <td>
                        <button class="btn-action-small btn-download">
                          <i class="fas fa-download"></i>
                        </button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
              <!-- Paginación -->
              <div class="paginacion">
                <button class="btn-paginacion disabled">
                  <i class="fas fa-chevron-left"></i>
                </button>
                <span class="pagina-actual">1</span>
                <span class="separador">/</span>
                <span class="total-paginas">1</span>
                <button class="btn-paginacion disabled">
                  <i class="fas fa-chevron-right"></i>
                </button>
              </div>
            </section>
          </div>
         
        </div>
      </div>
    </div>
  </main>
  <%@ include file="/WEB-INF/includes/footer.jsp"%>
  <%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
</body>
</html>