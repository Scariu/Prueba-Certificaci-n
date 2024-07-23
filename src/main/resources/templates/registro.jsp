<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Registro</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>

	<div class="container mt-5">
		<h1>Registro</h1>
		<form action="/usuarios/registro" method="POST">
			<div class="mb-3">
				<label for="username" class="form-label">Usuario (Correo electrónico)</label>
				<input type="text" id="username" name="correo" class="form-control" required />
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Contraseña</label>
				<input type="password" id="password" name="contrasena" class="form-control" required />
			</div>
			<div class="mb-3">
				<label for="passwordConfirmation" class="form-label">Confirme Contraseña</label>
				<input type="password" id="passwordConfirmation" name="passwordConfirmation" class="form-control" required />
			</div>
			<div class="mb-3">
				<label for="nombre" class="form-label">Nombre</label>
				<input type="text" id="nombre" name="nombre" class="form-control" required />
			</div>
			<div class="mb-3">
				<label for="apellido" class="form-label">Apellido</label>
				<input type="text" id="apellido" name="apellido" class="form-control" required />
			</div>
			<div class="mb-3">
				<label for="dni" class="form-label">DNI</label>
				<input type="text" id="dni" name="dni" class="form-control" required />
			</div>
			<div class="mb-3">
				<label for="direccion" class="form-label">Dirección</label>
				<input type="text" id="direccion" name="direccion" class="form-control" required />
			</div>
			<div class="mb-3">
				<label for="telefono" class="form-label">Teléfono</label>
				<input type="text" id="telefono" name="telefono" class="form-control" required />
			</div>
			<div class="mb-3">
				<label for="role" class="form-label">Rol</label>
				<select id="role" name="role" class="form-select" required>
					<option value="" disabled selected>Seleccione el rol</option>
					<option value="USER">Usuario</option>
					<option value="ADMIN">Administrador</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Register</button>
			<a class="btn btn-secondary" th:href="@{/usuarios/login}" role="button">Login</a>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>
