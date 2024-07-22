<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Nuevo estacionamiento</title>
</head>
<body>
      <h1 th:text="${estacionamiento.id != null ? 'Editar Estacionamiento' : 'Nuevo Estacionamiento'}"></h1>
    <form th:action="@{${estacionamiento.id != null ? '/estacionamientos/editar/' + estacionamiento.id : '/estacionamientos/nuevo'}}" method="post">
       
        <div>
            <label for="nombre">Nombre del estacionamiento:</label>
            <input type="text" id="nombre" name="nombre" th:value="${estacionamiento.nombre}"/>
        </div>
        <div>
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" th:value="${estacionamiento.direccion}"/>
        </div>
        <div>
            <label for="capacidad">Capacidad:</label>
            <input type="text" id="capacidad" name="capacidad" th:value="${estacionamiento.capacidad}"/>
        </div>
        <div>
            <label for="tarifaHora">Tarifa por Hora (CLP):</label>
            <input type="number" id="tarifaHora" name="tarifaHora" th:value="${estacionamiento.tarifaHora}"/>
        </div>
        <div>
            <label for="horaApertura">Hora Apertura:</label>
            <input type="text" id="horaApertura" name="horaApertura" th:value="${estacionamiento.horaApertura}"/>
        </div>
        <div>
            <label for="horaCierre">Hora Cierre:</label>
            <input type="text" id="horaCierre" name="horaCierre" th:value="${estacionamiento.horaCierre}"/>
        </div>
        <div>
            <button type="submit" >Guardar</button>
        </div>
    </form>
    <a href="/estacionamientos">Regresar a la lista</a>
</body>
</html>