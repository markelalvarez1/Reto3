<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Crear Partida</title>
<link rel="icon" href="Img/baldosa.png" type="image/x-icon">
<link rel="stylesheet" href="css/stylescrearpartida.css">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/includes/header.jsp"%>
	<main>
		<%@ include file="/WEB-INF/includes/sidebar.jsp"%>
		<div class="dashboard-container">
			<!-- Sección principal -->
			<section class="dashboard-summary">
				<h1>Crear nueva partida</h1>
				<p class="subtitle">Completa el formulario para organizar tu próxima partida</p>
                
                <!-- Información del escape room seleccionado -->
                <div class="selected-room">
                    <div class="room-info">
                        <h2 id="roomTitle">La Última Carta</h2>
                        <div class="badges">
                            <span class="badge difficulty-medium">Dificultad media</span>
                            <span class="badge players"><i class="fas fa-users"></i> 2-5</span>
                            <span class="badge duration"><i class="far fa-clock"></i> 60 min</span>
                        </div>
                    </div>
                    <a href="organizarpartida.jsp" class="btn-volver">
                        <i class="fas fa-arrow-left"></i>
                        Volver a scaperooms
                    </a>
                </div>
            </section>

            <!-- Formulario para crear partida -->
            <section class="crear-partida-form">
                <div class="section-header">
                    <h2>Detalles de la partida</h2>
                    <div class="section-divider"></div>
                </div>

                <form action="procesarPartida" method="post" id="crearPartidaForm">
                    <input type="hidden" id="scaperoomId" name="scaperoomId" value="ultima-carta">
                    
                    <div class="form-columns">
                        <!-- Columna izquierda -->
                        <div class="form-column">
                            <div class="form-group">
                                <label for="fechaPartida"><i class="fas fa-calendar-alt"></i> Fecha de la partida</label>
                                <input type="date" id="fechaPartida" name="fechaPartida" required min="">
                            </div>
                            
                            <div class="form-group">
                                <label for="horaPartida"><i class="fas fa-clock"></i> Hora de la partida</label>
                                <input type="time" id="horaPartida" name="horaPartida" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="numeroJugadores"><i class="fas fa-users"></i> Número de jugadores</label>
                                <div class="player-counter">
                                    <button type="button" class="btn-minus" onclick="decrementPlayers()"><i class="fas fa-minus"></i></button>
                                    <input type="number" id="numeroJugadores" name="numeroJugadores" min="2" max="5" value="2" readonly>
                                    <button type="button" class="btn-plus" onclick="incrementPlayers()"><i class="fas fa-plus"></i></button>
                                </div>
                                <span class="hint">El número de jugadores debe estar entre 2 y 5</span>
                            </div>
                        </div>
                        
                        <!-- Columna derecha -->
                        <div class="form-column">
                            <div class="form-group">
                                <label for="tipoPartida"><i class="fas fa-tag"></i> Tipo de partida</label>
                                <select id="tipoPartida" name="tipoPartida" required>
                                    <option value="standard">Estándar</option>
                                    <option value="competitive">Competitivo</option>
                                    <option value="team">Equipos</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="nivelDificultad"><i class="fas fa-gauge-high"></i> Nivel de dificultad</label>
                                <select id="nivelDificultad" name="nivelDificultad" required>
                                    <option value="easy">Fácil</option>
                                    <option value="medium" selected>Medio</option>
                                    <option value="hard">Difícil</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <div class="checkbox-group">
                                    <input type="checkbox" id="mostrarPistas" name="mostrarPistas" checked>
                                    <label for="mostrarPistas">Mostrar pistas durante el juego</label>
                                </div>
                                <div class="checkbox-group">
                                    <input type="checkbox" id="guardarPuntuacion" name="guardarPuntuacion" checked>
                                    <label for="guardarPuntuacion">Guardar puntuación en el ranking</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="notasAdicionales"><i class="fas fa-comment-alt"></i> Notas adicionales</label>
                        <textarea id="notasAdicionales" name="notasAdicionales" rows="3" placeholder="Añade cualquier información adicional o requisitos especiales para tu partida"></textarea>
                    </div>
                    
                    <div class="form-info">
                        <div class="info-box">
                            <i class="fas fa-info-circle"></i>
                            <p>Las reservas deben realizarse con al menos 24 horas de antelación. Una vez confirmada la partida, recibirás un correo electrónico con los detalles.</p>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="btn-cancel" onclick="window.location.href='organizarpartida.jsp'">
                            <i class="fas fa-times"></i>
                            Cancelar
                        </button>
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-check"></i>
                            Confirmar partida
                        </button>
                    </div>
                </form>
            </section>
        </div>
	</main>
	<%@ include file="/WEB-INF/includes/footer.jsp"%>
	<%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
    
    <script>
        // Configurar la fecha mínima como hoy
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date();
            const yyyy = today.getFullYear();
            let mm = today.getMonth() + 1;
            let dd = today.getDate();
            
            if (dd < 10) dd = '0' + dd;
            if (mm < 10) mm = '0' + mm;
            
            const formattedToday = yyyy + '-' + mm + '-' + dd;
            document.getElementById('fechaPartida').min = formattedToday;
            document.getElementById('fechaPartida').value = formattedToday;
            
            // Obtener el parámetro de la URL para el escape room seleccionado
            const urlParams = new URLSearchParams(window.location.search);
            const roomParam = urlParams.get('room');
            
            // Actualizar la información del escape room según el parámetro
            if (roomParam) {
                document.getElementById('scaperoomId').value = roomParam;
                let title = "La Última Carta";
                
                switch(roomParam) {
                    case 'misterio-bilbao':
                        title = "El Misterio de Bilbao";
                        document.querySelector('.badges .difficulty-medium').classList.replace('difficulty-medium', 'difficulty-hard');
                        document.querySelector('.badges .difficulty-hard').textContent = "Dificultad alta";
                        document.querySelector('.badges .players').innerHTML = '<i class="fas fa-users"></i> 3-6';
                        document.querySelector('.badges .duration').innerHTML = '<i class="far fa-clock"></i> 75 min';
                        document.getElementById('numeroJugadores').min = 3;
                        document.getElementById('numeroJugadores').max = 6;
                        document.getElementById('numeroJugadores').value = 3;
                        document.querySelector('.hint').textContent = "El número de jugadores debe estar entre 3 y 6";
                        break;
                    case 'secreto-ria':
                        title = "El Secreto de la Ría";
                        document.querySelector('.badges .difficulty-medium').classList.replace('difficulty-medium', 'difficulty-easy');
                        document.querySelector('.badges .difficulty-easy').textContent = "Dificultad baja";
                        document.querySelector('.badges .players').innerHTML = '<i class="fas fa-users"></i> 2-4';
                        document.querySelector('.badges .duration').innerHTML = '<i class="far fa-clock"></i> 45 min';
                        document.getElementById('numeroJugadores').min = 2;
                        document.getElementById('numeroJugadores').max = 4;
                        document.getElementById('numeroJugadores').value = 2;
                        document.querySelector('.hint').textContent = "El número de jugadores debe estar entre 2 y 4";
                        break;
                    case 'catedral-olvidada':
                        title = "La Catedral Olvidada";
                        document.querySelector('.badges .players').innerHTML = '<i class="fas fa-users"></i> 3-8';
                        document.querySelector('.badges .duration').innerHTML = '<i class="far fa-clock"></i> 90 min';
                        document.getElementById('numeroJugadores').min = 3;
                        document.getElementById('numeroJugadores').max = 8;
                        document.getElementById('numeroJugadores').value = 3;
                        document.querySelector('.hint').textContent = "El número de jugadores debe estar entre 3 y 8";
                        break;
                }
                
                document.getElementById('roomTitle').textContent = title;
            }
        });
        
        // Funciones para incrementar/decrementar el número de jugadores
        function incrementPlayers() {
            const input = document.getElementById('numeroJugadores');
            const currentValue = parseInt(input.value);
            const maxValue = parseInt(input.max);
            
            if (currentValue < maxValue) {
                input.value = currentValue + 1;
            }
        }
        
        function decrementPlayers() {
            const input = document.getElementById('numeroJugadores');
            const currentValue = parseInt(input.value);
            const minValue = parseInt(input.min);
            
            if (currentValue > minValue) {
                input.value = currentValue - 1;
            }
        }
    </script>
</body>
</html>