<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Formulario con Spinners</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container mt-5">
		<h2>Reserva de Estacionamientos</h2>
		<form action="/reservas/nueva" method="post">
			<div class="mb-3">
				<label for="fechaInicio" class="form-label">Hora Ingreso</label> <input
					type="datetime-local" class="form-control" id="fechaInicio"
					name="fechaInicio" required>
			</div>
			<div class="mb-3">
				<label for="fechaFin" class="form-label">Hora Salida</label> <input
					type="datetime-local" class="form-control" id="fechaFin"
					name="fechaFin" required>
			</div>
			<div class="mb-3">
				<label for="estado" class="form-label">Estado Reserva</label> <select
					class="form-select" id="estado" name="estado" required>
					<option value="" disabled selected>Seleccione el estado</option>
					<option value="Confirmada">Confirmada</option>
					<option value="Pendiente">Pendiente</option>
					<option value="Cancelada">Cancelada</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="matricula" class="form-label">Matrícula Vehículo</label>
				<select class="form-select" id="matricula" name="vehiculo" required>
					<option value="" disabled selected>Seleccione la matrícula</option>
					<option th:each="vehiculo : ${vehiculos}" th:value="${vehiculo.id}"
						th:text="${vehiculo.matricula}"></option>
				</select>
			</div>
			<div class="mb-3">
				<label for="estacionamiento" class="form-label">Estacionamiento</label>
				<select class="form-select" id="estacionamiento"
					name="estacionamiento" required>
					<option value="" disabled selected>Seleccione el
						estacionamiento</option>
					<option th:each="estacionamiento : ${estacionamientos}"
						th:value="${estacionamiento.id}"
						th:text="${estacionamiento.nombre}"></option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Reservar</button>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOTb3B9W6p5ft7R2Hf6tz/4gkV9f4txmbrT5D8PqfN/3Fztz3"
		crossorigin="anonymous"></script>
</body>
</html>