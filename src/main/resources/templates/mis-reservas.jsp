<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Lista de Reservas</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container mt-5">
		<h1>Lista de Reservas</h1>
		<section class="mb-3">
			<a href="/reservas/nueva" class="btn btn-primary">Nueva Reserva</a>
		</section>
		<section>
			<div th:if="${#lists.isEmpty(reservas)}">
				<p>No hay reservas registradas.</p>
			</div>
			<div th:unless="${#lists.isEmpty(reservas)}">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Hora Ingreso</th>
							<th scope="col">Hora Salida</th>
							<th scope="col">Estado</th>
							<th scope="col">Matrícula Vehículo</th>
							<th scope="col">Estacionamiento</th>
							<th scope="col">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<tr th:each="reserva : ${reservas}">
							<td th:text="${reserva.id}">ID</td>
							<td th:text="${reserva.fechaInicio}">Hora Ingreso</td>
							<td th:text="${reserva.fechaFin}">Hora Salida</td>
							<td th:text="${reserva.estado}">Estado</td>
							<td
								th:text="${reserva.vehiculo != null ? reserva.vehiculo.matricula : 'N/A'}">Matrícula
								Vehículo</td>
							<td
								th:text="${reserva.estacionamiento != null ? reserva.estacionamiento.nombre : 'N/A'}">Estacionamiento</td>
							<td>
								<form th:action="@{/reservas/editar/{id}(id=${reserva.id})}"
									method="get">
									<button type="submit" class="btn btn-warning btn-sm">Editar</button>
								</form>
								<form th:action="@{/reservas/eliminar/{id}(id=${reserva.id})}"
									method="post">
									<button type="submit" class="btn btn-danger btn-sm"
										onclick="return confirm('¿Estás seguro de que quieres eliminar esta reserva?');">Eliminar</button>
								</form>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<a href="/home" class="btn btn-secondary mt-3">Regresar a Home</a>
		</section>
	</div>
</body>
</html>
