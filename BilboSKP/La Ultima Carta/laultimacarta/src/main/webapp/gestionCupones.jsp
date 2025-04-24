<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="dashboard_cupones_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylegestioncupones.css">
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
		<div class="dashboard-container">
			<!-- Título de gestión de cupones -->
			<section class="dashboard-summary">
				<h1>
					<fmt:message key="dashboard_cupones_titulo" />
				</h1>

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
								<c:forEach var="cupon" items="${cuponesDisponibles}"
									varStatus="status">
									<div class="cupon-item">
										<div class="cupon-info">
											<h4>${cupon.nombre}</h4>
											<p class="cupon-description">${cupon.descripcion}</p>
											<p class="cupon-precio">${cupon.precio}€</p>
										</div>
									</div>
								</c:forEach>
								<!-- Mostrar mensaje si no hay cupones disponibles -->
								<c:if test="${empty cuponesDisponibles}">
									<div class="no-cupones">
										<p>
											<fmt:message key="no_cupones_disponibles" />
										</p>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					<!-- Historial de compras -->
					<div class="cupones-card stat-card">
						<div class="stat-icon pending">
							<i class="fas fa-calendar-alt"></i>
						</div>
						<div class="stat-info">
							<h3>
								<fmt:message key="cupones_programados" />
							</h3>
							<div class="cupon-info">
								<p class="cupon-description">Descripción historial</p>
							</div>
						</div>
					</div>

					<!-- Devolverver cupones -->
					<div class="cupones-card stat-card">
						<div class="stat-icon inactive">
							<i class="fas fa-share-square"></i>
						</div>
						<div class="stat-info">
							<h3>
								<fmt:message key="devoluciones" />
							</h3>
							<div class="cupon-info">
								<p class="cupon-description">Descripción devolver</p>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- Sección para comprar cupones -->
			<section class="compra-cupones-section">
				<div class="compra-container">
					<div class="compra-cupones">
						<h2>
							<fmt:message key="comprar_cupones" />
						</h2>
						<form action="cupones" method="post">
							<!-- Información del cupón fijo -->
							<div class="cupon-fijo-info">
								<h3>
									<fmt:message key="nombre_cupon" />
								</h3>
								<p class="cupon-description">
									<fmt:message key="descripcion_cupon" />
								</p>
								<!-- Precio unitario con € en Unicode -->
								<p class="cupon-precio-fijo" data-price="2.50">
									2,50 &#x20AC; /
									<fmt:message key="unidad" />
									<input type="Hidden" name="precioIndividual" value ="2.50">
								</p>
							</div>

							<div class="form-group">
								<label for="cantidad"><fmt:message key="cantidad" /></label>
								<div class="cantidad-control">
									<!-- Botones con referencias Unicode para “−” y “+” -->
									<button type="button" class="btn-cantidad"
										onclick="decrementarCantidad()">&#x2212;</button>
									<input type="number" id="cantidad" name="cantidad" min="1"
										value="1" required>
									<button type="button" class="btn-cantidad"
										onclick="incrementarCantidad()">&#x002B;</button>
								</div>
							</div>

							<div class="precio-total">
								<p>
									<fmt:message key="precio_total" />
									: <span id="precioTotal">5,00</span> &#x20AC;
								</p>
							</div>

							<div class="form-actions">
								<button type="submit" name ="action" value="compra" class="btn-action">
									<i class="fas fa-shopping-cart"></i>
									<fmt:message key="anadir_al_carrito" />
								</button>
							</div>
						</form>
					</div>

					<!-- Carrito de compra -->
					<div class="carrito-compra">
						<h2>
							<fmt:message key="carrito_compra" />
						</h2>
						<div class="carrito-items">
							<c:if test="${not empty cantidad}">
								<div class="carrito-item">
									<div class="item-info">
										<h3>cupon</h3>
										<p class="item-cantidad">
											<fmt:message key="cantidad" />
											: ${cantidad}
										</p>
										
									</div>
									<div class="item-actions">
										<form action="cupones" method="post"
											class="form-eliminar">
											<input type="hidden" name="itemId" value="${item.id}">
											<button type="submit" name = "action" value = "eliminar" class="btn-eliminar">
												<i class="fas fa-trash"></i>
											</button>
										</form>
									</div>
								</div>
							</c:if>

							<!-- Mostrar mensaje si no hay items en el carrito -->
							<c:if test="${empty cantidad}">
								<div class="carrito-vacio">
									<p>
										<fmt:message key="carrito_vacio" />
									</p>
								</div>
							</c:if>
						</div>

						<div class="carrito-resumen">
							<div class="carrito-total">
								<p>
									<fmt:message key="total" />
									: <span>${cantidad * precio}</span> &#x20AC
								</p>
							</div>
							<form action="procesarCompra" method="post">
								<button type="submit" class="btn-comprar"
									${empty cantidad ? 'disabled' : ''}>
									<i class="fas fa-credit-card"></i>
									<fmt:message key="finalizar_compra" />
								</button>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>

	<script>
		// Leemos el precio unitario del atributo data-price
		const precioUnitario = parseFloat(document
				.querySelector('.cupon-precio-fijo').dataset.price);

		function incrementarCantidad() {
			const input = document.getElementById('cantidad');
			input.value = parseInt(input.value) + 1;
			actualizarPrecioTotal();
		}

		function decrementarCantidad() {
			const input = document.getElementById('cantidad');
			const val = Math.max(1, parseInt(input.value) - 1);
			input.value = val;
			actualizarPrecioTotal();
		}

		function actualizarPrecioTotal() {
			const cantidad = parseInt(document.getElementById('cantidad').value);
			const total = (precioUnitario * cantidad).toFixed(2);
			document.getElementById('precioTotal').textContent = total.replace(
					'.', ',');
		}

		// Inicializar al cargar la página
		window.addEventListener('DOMContentLoaded', actualizarPrecioTotal);
	</script>
</body>
</html>