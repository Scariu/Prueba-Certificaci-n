<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Lista de Reservas</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<h1>Lista de Reservas</h1>
		<section class="mb-3">
			<a th:href="@{/reservas/nueva}" class="btn btn-primary">Nueva Reserva</a>
		</section>
		<section>
			<div th:if="${#lists.isEmpty(reservas)}">
				<p>No hay reservas registradas.</p>
			</div>
			<div th:unless="${#lists.isEmpty(reservas)}">
				<table class="table table-striped">
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
							<td th:text="${reserva.id}"></td>
							<td th:text="${reserva.fechaInicio}"></td>
							<td th:text="${reserva.fechaFin}"></td>
							<td th:text="${reserva.estado}"></td>
							<td
								th:text="${reserva.vehiculo != null ? reserva.vehiculo.matricula : 'N/A'}"></td>
							<td
								th:text="${reserva.estacionamiento != null ? reserva.estacionamiento.nombre : 'N/A'}"></td>
							<td>
								<form th:action="@{/reservas/editar/{id}(id=${reserva.id})}"
									method="get" style="display: inline;">
									<button type="submit" class="btn btn-warning btn-sm">Editar</button>
								</form>
								<form th:action="@{/reservas/eliminar/{id}(id=${reserva.id})}"
									method="post" style="display: inline;">
									<button type="submit" class="btn btn-danger btn-sm"
										onclick="return confirm('¿Estás seguro de que quieres eliminar esta reserva?');">Eliminar</button>
								</form>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>
		<a href="/" class="btn btn-secondary">Regresar a Home</a>
	</div>
</body>
</html>