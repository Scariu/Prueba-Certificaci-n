<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Lista de Estacionamientos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<h1>Lista de Estacionamientos</h1>
	<section>
		<a href="/estacionamientos/nuevo" class="btn btn-primary">Nuevo
			Estacionamiento</a>
	</section>
	<section>
		<div th:if="${#lists.isEmpty(estacionamientos)}">
			<p>No hay estacionamientos ingresados.</p>
		</div>
		<div th:unless="${#lists.isEmpty(estacionamientos)}">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Nombre</th>
						<th scope="col">Dirección</th>
						<th scope="col">Capacidad</th>
						<th scope="col">Tarifa por Hora</th>
						<th scope="col">Hora de Apertura</th>
						<th scope="col">Hora de Cierre</th>
					</tr>
				</thead>
				<tbody>
					<tr th:each="estacionamiento : ${estacionamientos}">
						<td th:text="${estacionamiento.id}">ID</td>
						<td th:text="${estacionamiento.nombre}">Nombre</td>
						<td th:text="${estacionamiento.direccion}">Dirección</td>
						<td th:text="${estacionamiento.capacidad}">Capacidad</td>
						<td th:text="${estacionamiento.tarifaHora}">Tarifa por Hora</td>
						<td th:text="${estacionamiento.horaApertura}">Hora de
							Apertura</td>
						<td th:text="${estacionamiento.horaCierre}">Hora de Cierre</td>

						<td>
							<form
								th:action="@{/estacionamientos/editar/{id}(id=${estacionamiento.id})}"
								method="get" style="display: inline;">
								<button type="submit">Editar</button>
							</form>
							<form
								th:action="@{/estacionamientos/eliminar/{id}(id=${estacionamiento.id})}"
								method="post" style="display: inline;">
								<button type="submit"
									onclick="return confirm('¿Estás seguro de que quieres eliminar este estacionamiento?');">Eliminar</button>
							</form>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	<a href="/">Regresar a Home</a>
</body>
</html>

