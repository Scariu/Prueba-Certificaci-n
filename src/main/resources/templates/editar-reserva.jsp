<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Formulario de Reserva</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<h2>Editar Reserva</h2>
		<form action="#"
			th:action="@{/reservas/editar/{id}(id=${reserva.id})}" method="post">
			<div class="mb-3">
				<label for="fechaInicio" class="form-label">Hora Ingreso</label> <input
					type="datetime-local" class="form-control" id="fechaInicio"
					name="fechaInicio" th:value="${reserva.fechaInicio}" required>
			</div>
			<div class="mb-3">
				<label for="fechaFin" class="form-label">Hora Salida</label> <input
					type="datetime-local" class="form-control" id="fechaFin"
					name="fechaFin" th:value="${reserva.fechaFin}" required>
			</div>
			<div class="mb-3">
				<label for="estado" class="form-label">Estado Reserva</label> <select
					class="form-select" id="estado" name="estado" required>
					<option value="Pendiente"
						th:selected="${reserva.estado == 'Pendiente'}">Pendiente</option>
					<option value="Confirmada"
						th:selected="${reserva.estado == 'Confirmada'}">Confirmada</option>
					<option value="Cancelada"
						th:selected="${reserva.estado == 'Cancelada'}">Cancelada</option>
				</select>
			</div>
			<select class="form-select" id="matricula" name="vehiculo.id">
				<option th:each="vehiculo : ${vehiculos}" th:value="${vehiculo.id}"
					th:text="${vehiculo.matricula}"
					th:selected="${vehiculo.id == reserva.vehiculo.id}"></option>
			</select>

			<div class="mb-3">
				<label for="estacionamiento" class="form-label">Estacionamiento</label>
				<select class="form-select" id="estacionamiento"
					name="estacionamiento">
					<option th:each="estacionamiento : ${estacionamientos}"
						th:value="${estacionamiento.id}"
						th:text="${estacionamiento.nombre}"
						th:selected="${estacionamiento.id == reserva.estacionamiento.id}"></option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Actualizar
				Reserva</button>
		</form>
	</div>
</body>
</html>

