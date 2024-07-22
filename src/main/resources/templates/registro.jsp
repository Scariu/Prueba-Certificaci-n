<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<h1>Register!</h1>
		<form action="/usuarios/registro" method="POST">
			<p>
				<label for="username">Usuario (Correo electronico)</label> <input type="text"
					id="username" name="username" class="form-control" />
			</p>
			<p>
				<label for="password">Contraseña:</label> <input type="password"
					id="password" name="password" class="form-control" />
			</p>
			<p>
				<label for="passwordConfirmation">Confirme Contraseña:</label> <input
					type="password" id="passwordConfirmation"
					name="passwordConfirmation" class="form-control" />
			</p>
			<input type="submit" value="Register" class="btn btn-primary" /> <a
				class="btn btn-primary" th:href="@{/usuarios/login}" role="button">Login</a>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>