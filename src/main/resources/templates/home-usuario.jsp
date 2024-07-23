<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Inicio Usuario</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							th:href="@{/reservas}">Mis Reservas</a></li>
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
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
