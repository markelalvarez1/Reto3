<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="titulo_bilbao_skp" /></title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">

<!-- AOS Animation Library -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<!-- External CSS -->
<link rel="stylesheet" href="css/stylesindex.css">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/includes/header.jsp"%>

	<!-- Hero Section with Background Video -->
	<section class="hero">
		<video class="hero-video" autoplay loop muted playsinline>
			<source src="Img/Videofondo.mp4" type="video/mp4">
			Tu navegador no soporta videos en HTML5.
		</video>
		<div class="hero-overlay"></div>
		<div class="container">
			<h1>
				<fmt:message key="ultima_carta" />
			</h1>
			<p>
				<fmt:message key="descripcion_ultima_carta" />
			</p>
			<button class="btn-primary">
				<a href="jugar"><fmt:message key="menu_jugar" /></a>
			</button>
		</div>
	</section>

	<!-- User Opinions Section -->
	<section class="opinions" id="opinions">
		<div class="container">
			<h2>
				<fmt:message key="opiniones_usuarios" />
			</h2>
			<div class="opinion-cards" data-aos="fade-up"
				data-aos-anchor-placement="top-bottom" data-aos-delay="125">
				<!-- Opinion Card 1 -->
				<div class="opinion-card">
					<h3>@ProfLaura_92</h3>
					<div class="stars">
						<img class="estrellas" src="Img/estrellas5.png" alt="5 estrellas">
					</div>
					<p>
						<fmt:message key="opinion_proflaura" />
					</p>
				</div>

				<!-- Opinion Card 2 -->
				<div class="opinion-card">
					<h3>@CarlosGamer16</h3>
					<div class="stars">
						<img class="estrellas" src="Img/estrellas4.png" alt="4 estrellas">
					</div>
					<p>
						<fmt:message key="opinion_carlosgamer" />
					</p>
				</div>

				<!-- Opinion Card 3 -->
				<div class="opinion-card">
					<h3>@CulturaJoven_88</h3>
					<div class="stars">
						<img class="estrellas" src="Img/estrellas5.png" alt="5 estrellas">
					</div>
					<p>
						<fmt:message key="opinion_culturajoven" />
					</p>
				</div>
			</div>
		</div>
	</section>


	<%@ include file="/WEB-INF/includes/footer.jsp"%>

	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>

	<!-- Initialize AOS (Animate on Scroll) -->
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
</body>
</html>
