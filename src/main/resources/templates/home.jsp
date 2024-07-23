<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Bienvenidos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg bg-body-tertiary primary">
			<div class="container-fluid">
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							th:href="@{reservas}">Mis Reservas</a></li>
						<li class="nav-item"><a class="nav-link"
							th:href="@{/vehiculos}">Vehiculos</a></li>
						<li class="nav-item"><a class="nav-link"
							th:href="@{/reservas/nueva}">Reservas</a></li>
						<li class="nav-item"><a class="nav-link"
							th:href="@{/estacionamientos}">Estacionamientos</a></li>

					</ul>
				</div>
			</div>
		</nav>
	</header>
	<section>
		<h1>Bienvenidos al sistema de reservas de La Ilustre
			Municipalidad de Pelotillehue</h1>
		<p>Acceda a los siguientes enlaces</p>
		<a th:href="@{/usuarios/registro}">Registro</a> <a
			th:href="@{/usuarios/login}">Login</a>
		 <form th:action="@{/logout}" method="post">
            <button type="submit">Logout</button>
        </form>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>