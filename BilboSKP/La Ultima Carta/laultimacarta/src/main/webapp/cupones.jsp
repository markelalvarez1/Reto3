<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="cupones_titulo" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylescupones.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
</head>
<body>

	<%@ include file="/WEB-INF/includes/header.jsp"%>
	<!-- Contenido Principal -->
	<main>
		<div class="container coupons-container">
			<%@ include file="/WEB-INF/includes/sidebar.jsp"%>

			<!-- Contenido de Cupones -->
			<div class="coupons-content">
				<div class="page-header">
					<h1>
						<fmt:message key="cupones_titulo" />
					</h1>
					<p>
						<fmt:message key="cupones_subtitulo" />
					</p>
				</div>

				<!-- Resumen de puntos y cupones -->
				<div class="coupons-summary">
					<div class="summary-card">
						<div class="summary-icon">
							<i class='bx bx-coin-stack'></i>
						</div>
						<div class="summary-info">
							<h3>
								<fmt:message key="cupones_puntos" />
							</h3>
							<p class="summary-value">1,250</p>
						</div>
					</div>

					<div class="summary-card">
						<div class="summary-icon">
							<i class='bx bx-ticket'></i>
						</div>
						<div class="summary-info">
							<h3>
								<fmt:message key="cupones_activos" />
							</h3>
							<p class="summary-value">2</p>
						</div>
					</div>

					<div class="summary-card">
						<div class="summary-icon">
							<i class='bx bx-gift'></i>
						</div>
						<div class="summary-info">
							<h3>
								<fmt:message key="cupones_canjeados" />
							</h3>
							<p class="summary-value">7</p>
						</div>
					</div>
				</div>

				<!-- Cupones disponibles -->
				<div class="block available-coupons">
					<div class="block-header">
						<h2>
							<fmt:message key="cupones_disponibles" />
						</h2>
						<div class="filter-dropdown">
							<button class="filter-btn">
								<i class='bx bx-filter-alt'></i>
								<fmt:message key="cupones_filtrar" />
							</button>
						</div>
					</div>

					<!-- Tarjetas de cupones -->
					<div class="coupons-grid">
						<!-- Cupón Escape Room -->
						<div class="coupon-card">
							<div class="coupon-tag">
								<fmt:message key="cupon_tag_general" />
							</div>
							<div class="coupon-content">
								<h3 class="coupon-title">
									<fmt:message key="cupon_escape_room_titulo" />
								</h3>
								<div class="coupon-price">
									<fmt:message key="cupon_escape_room_precio" />
								</div>
								<p class="coupon-description">
									<fmt:message key="cupon_escape_room_descripcion" />
								</p>
								<div class="coupon-validity">
									<i class='bx bx-calendar'></i>
									<fmt:message key="cupon_escape_room_validez" />
								</div>
								<div class="coupon-actions">
									<input type="number" min="1" value="1" class="coupon-qty-input"
										data-id="escape-room"
										data-name="<fmt:message key='cupon_escape_room_titulo' />"
										data-price="16.99" title="Cantidad" />

									<button class="coupon-add-btn" data-id="escape-room"
										data-name="<fmt:message key='cupon_escape_room_titulo' />"
										data-price="16.99">
										<i class='bx bx-cart-add'></i>
										<fmt:message key="cupon_anadir" />
									</button>
								</div>

							</div>
						</div>




						<!-- Carrito de compra -->
						<div class="shopping-cart">
							<div class="block-header">
								<h3>
									<i class='bx bx-cart'></i>
									<fmt:message key="carrito_titulo" />
									<span class="cart-count">0</span>
								</h3>
							</div>

							<div class="cart-empty-message">
								<i class='bx bx-cart'></i>
								<p>
									<fmt:message key="carrito_vacio" />
								</p>
							</div>

							<div class="cart-items">
								<!-- Los items del carrito se añadirán dinámicamente con JavaScript -->
							</div>

							<div class="cart-summary">
								<div class="cart-total">
									<span><fmt:message key="carrito_total" /></span> <span
										class="total-amount">0.00€</span>
								</div>
								<button class="checkout-btn">
									<i class='bx bx-check'></i>
									<fmt:message key="carrito_finalizar" />
								</button>
							</div>
						</div>
					</div>

					<!-- Mis Cupones -->
					<div class="block my-coupons">
						<h2>
							<fmt:message key="miscupones_titulo" />
						</h2>

						<div class="tabs-header">
							<button class="tab-btn active" data-tab="active">
								<fmt:message key="miscupones_activos" />
							</button>
							<button class="tab-btn" data-tab="used">
								<fmt:message key="miscupones_usados" />
							</button>
						</div>

						<!-- Cupones activos -->
						<div class="tab-content active" id="active-tab">
							<div class="my-coupons-list">
								<div class="my-coupon-item">
									<div class="coupon-left">
										<div class="coupon-icon">
											<i class='bx bx-ticket'></i>
										</div>
										<div class="coupon-info">
											<h3>
												<fmt:message key="micupon_15_titulo" />
											</h3>
											<div class="coupon-meta">
												<span><i class='bx bx-calendar'></i> <fmt:message
														key="micupon_15_valido_hasta" /></span> <span><i
													class='bx bx-info-circle'></i> <fmt:message
														key="micupon_15_tipo" /></span>
											</div>
										</div>
									</div>
									<div class="coupon-actions">
										<button class="action-btn view-btn">
											<i class='bx bx-show'></i>
											<fmt:message key="micupon_ver" />
										</button>
										<button class="action-btn use-btn">
											<i class='bx bx-check'></i>
											<fmt:message key="micupon_usar" />
										</button>
									</div>
								</div>

								<div class="my-coupon-item">
									<div class="coupon-left">
										<div class="coupon-icon">
											<i class='bx bx-package'></i>
										</div>
										<div class="coupon-info">
											<h3>
												<fmt:message key="micupon_10_titulo" />
											</h3>
											<div class="coupon-meta">
												<span><i class='bx bx-calendar'></i> <fmt:message
														key="micupon_10_valido_hasta" /></span> <span><i
													class='bx bx-info-circle'></i> <fmt:message
														key="micupon_10_restantes" /></span>
											</div>
										</div>
									</div>
									<div class="coupon-actions">
										<button class="action-btn view-btn">
											<i class='bx bx-show'></i>
											<fmt:message key="micupon_ver" />
										</button>
										<button class="action-btn use-btn">
											<i class='bx bx-check'></i>
											<fmt:message key="micupon_usar" />
										</button>
									</div>
								</div>
							</div>
						</div>

						<!-- Cupones utilizados -->
						<div class="tab-content" id="used-tab">
							<div class="my-coupons-list">
								<div class="my-coupon-item used">
									<div class="coupon-left">
										<div class="coupon-icon">
											<i class='bx bx-package'></i>
										</div>
										<div class="coupon-info">
											<h3>
												<fmt:message key="micupon_10_titulo" />
											</h3>
											<div class="coupon-meta">
												<span><i class='bx bx-calendar'></i> <fmt:message
														key="micupon_10_usado" /></span> <span><i
													class='bx bx-info-circle'></i> <fmt:message
														key="micupon_10_canjeado" /></span>
											</div>
										</div>
									</div>
									<div class="coupon-status">
										<span class="status-badge used"><fmt:message
												key="micupon_estado_usado" /></span>
									</div>
								</div>

								<div class="my-coupon-item used">
									<div class="coupon-left">
										<div class="coupon-icon">
											<i class='bx bx-ticket'></i>
										</div>
										<div class="coupon-info">
											<h3>
												<fmt:message key="micupon_15_titulo" />
											</h3>
											<div class="coupon-meta">
												<span><i class='bx bx-calendar'></i> <fmt:message
														key="micupon_15_usado" /></span>
											</div>
										</div>
									</div>
									<div class="coupon-status">
										<span class="status-badge used"><fmt:message
												key="micupon_estado_usado" /></span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Información sobre cupones -->
					<div class="block coupons-info">
						<h2>
							<fmt:message key="info_titulo" />
						</h2>

						<div class="info-notes">
							<div class="info-note">
								<i class='bx bx-info-circle'></i>
								<p>
									<fmt:message key="info_nota1" />
								</p>
							</div>
							<div class="info-note">
								<i class='bx bx-info-circle'></i>
								<p>
									<fmt:message key="info_nota2" />
								</p>
							</div>
							<div class="info-note">
								<i class='bx bx-info-circle'></i>
								<p>
									<fmt:message key="info_nota3" />
								</p>
							</div>
							<div class="info-note">
								<i class='bx bx-info-circle'></i>
								<p>
									<fmt:message key="info_nota4" />
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
	</main>

	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>

	<script>
        // Tabs
        const tabBtns = document.querySelectorAll('.tab-btn');
        tabBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                tabBtns.forEach(b => b.classList.remove('active'));
                document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));

                this.classList.add('active');
                const tabId = this.getAttribute('data-tab');
                document.getElementById(`${tabId}-tab`).classList.add('active');
            });
        });

        // Carrito
        const cartItems = [];
        const cartItemsContainer = document.querySelector('.cart-items');
        const cartEmptyMessage = document.querySelector('.cart-empty-message');
        const cartSummary = document.querySelector('.cart-summary');
        const cartCount = document.querySelector('.cart-count');
        const totalAmount = document.querySelector('.total-amount');

        function updateCart() {
            cartCount.textContent = cartItems.length;

            if (cartItems.length === 0) {
                cartEmptyMessage.style.display = 'flex';
                cartItemsContainer.style.display = 'none';
                cartSummary.style.display = 'none';
            } else {
                cartEmptyMessage.style.display = 'none';
                cartItemsContainer.style.display = 'flex';
                cartSummary.style.display = 'flex';

                cartItemsContainer.innerHTML = '';
                let total = 0;

                cartItems.forEach((item, index) => {
                    const itemTotal = (item.price * item.quantity);
                    total += itemTotal;

                    const cartItem = document.createElement('div');
                    cartItem.className = 'cart-item';

                    // Aquí usamos innerHTML sin backticks para evitar conflicto con JSP
                    cartItem.innerHTML =
                        '<div class="cart-item-details">' +
                            '<div class="cart-item-title">' + item.title + ' x' + item.quantity + '</div>' +
                            '<div class="cart-item-price">' + itemTotal.toFixed(2) + '€</div>' +
                        '</div>' +
                        '<button class="cart-item-remove" data-index="' + index + '">' +
                            "<i class='bx bx-trash'></i>" +
                        '</button>';

                    cartItemsContainer.appendChild(cartItem);
                });

                totalAmount.textContent = total.toFixed(2) + '€';

                document.querySelectorAll('.cart-item-remove').forEach(btn => {
                    btn.addEventListener('click', function() {
                        const index = parseInt(this.getAttribute('data-index'));
                        cartItems.splice(index, 1);
                        updateCart();
                    });
                });
            }
        }

        function addToCart(id, title, price, quantity) {
            for (let i = 0; i < quantity; i++) {
                cartItems.push({ id, title, price, quantity: 1 });
            }
            updateCart();
        }

        // Botón de añadir al carrito (con cantidad)
        document.querySelectorAll('.coupon-add-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                const id = this.getAttribute('data-id');
                const title = this.getAttribute('data-name');
                const price = parseFloat(this.getAttribute('data-price'));

                const input = this.parentElement.querySelector('.coupon-qty-input');
                const quantity = input ? Math.max(1, parseInt(input.value) || 1) : 1;

                addToCart(id, title, price, quantity);
                if (input) input.value = 1;
            });
        });

        // Checkout
        document.querySelector('.checkout-btn').addEventListener('click', function() {
            if (cartItems.length > 0) {
                sessionStorage.setItem('cartItems', JSON.stringify(cartItems));
                window.location.href = 'Pago.jsp';
            }
        });

        updateCart();
    });
</script>


</body>
</html>
