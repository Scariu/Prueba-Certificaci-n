<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Lista de Vehículos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<h1>Lista de Vehículos</h1>
	<section>
		<a href="/vehiculos/nuevo" class="btn btn-primary">Nuevo Vehículo</a>
	</section>
	<section>
		<div th:if="${#lists.isEmpty(vehiculos)}">
			<p>No hay vehículos registrados.</p>
		</div>
		<div th:unless="${#lists.isEmpty(vehiculos)}">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Matricula</th>
						<th scope="col">Marca</th>
						<th scope="col">Modelo</th>
						<th scope="col">Año</th>
						<th scope="col">Color</th>
						<th scope="col">Tipo</th>
						<th scope="col">Acciones</th>
					</tr>
				</thead>
				<tbody>
					<tr th:each="vehiculo : ${vehiculos}">
						<td th:text="${vehiculo.id}"></td>
						<td th:text="${vehiculo.matricula}"></td>
						<td th:text="${vehiculo.marca}"></td>
						<td th:text="${vehiculo.modelo}"></td>
						<td th:text="${vehiculo.anio}"></td>
						<td th:text="${vehiculo.color}"></td>
						<td th:text="${vehiculo.tipo}"></td>
						<td>
						<td>
							<form th:action="@{/vehiculos/editar/{id}(id=${vehiculo.id})}"
								method="get" style="display: inline;">
								<button type="submit">Editar</button>
							</form>
							<form th:action="@{/vehiculos/eliminar/{id}(id=${vehiculo.id})}"
								method="post" style="display: inline;">
								<button type="submit"
									onclick="return confirm('¿Estás seguro de que quieres eliminar este estacionamiento?');">Eliminar</button>
							</form>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	<a href="/home">Regresar a Home</a>
</body>
</html>