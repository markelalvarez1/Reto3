<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario</title>
    <!-- Se incluye la hoja de estilos ubicada en la carpeta style -->
    <link rel="stylesheet" type="text/css" href="style/indexStyle.css">
</head>
<body>
    <h1>Formulario para Registro de Usuario</h1>
    <!-- Puedes cambiar la acción del formulario al recurso encargado de guardar el usuario -->
    <form action="index" method="post">
    	<input type="hidden" name="rol" value="2">
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" maxlength="100" required>
        </div>
        <div class="form-group">
            <label for="apellidos">Apellidos:</label>
            <input type="text" id="apellidos" name="apellidos" maxlength="200" required>
        </div>
        <div class="form-group">
            <label for="dni">DNI:</label>
            <input type="text" id="dni" name="dni" maxlength="9" required>
        </div>
        <div class="form-group">
            <label for="correo">Correo:</label>
            <input type="email" id="correo" name="correo" maxlength="100" required>
        </div>
        <div class="form-group">
            <label for="contraseña">Contraseña:</label>
            <input type="password" id="contraseña" name="contrasena" maxlength="200" required>
        </div>
        <div class="form-group">
            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="telefono" maxlength="50" required>
        </div>
        <div class="form-group">
            <button type="submit">Registrar Usuario</button>
        </div>
    </form>
</body>
</html>
