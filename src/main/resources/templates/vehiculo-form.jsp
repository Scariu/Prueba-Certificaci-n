<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Nuevo Vehiculo</title>
</head>
<body>
      <h1 th:text="${vehiculo.id != null ? 'Editar Vehiculo' : 'Nuevo Vehiculo'}"></h1>
    <form th:action="@{${vehiculo.id != null ? '/vehiculos/editar/' + vehiculo.id : '/vehiculos/nuevo'}}" method="post">
       
        <div>
            <label for="matricula">Matricula:</label>
            <input type="text" id="matricula" name="matricula" th:value="${vehiculo.matricula}"/>
        </div>
        <div>
            <label for="marca">Marca:</label>
            <input type="text" id="marca" name="marca" th:value="${vehiculo.marca}"/>
        </div>
        <div>
            <label for="modelo">Modelo:</label>
            <input type="text" id="modelo" name="modelo" th:value="${vehiculo.modelo}"/>
        </div>
        <div>
            <label for="anio">Año:</label>
            <input type="number" id="anio" name="anio" th:value="${vehiculo.anio}"/>
        </div>
        <div>
            <label for="color">Color:</label>
            <input type="text" id="color" name="color" th:value="${vehiculo.color}"/>
        </div>
        <div>
            <label for="tipo">Tipo:</label>
            <input type="text" id="tipo" name="tipo" th:value="${vehiculo.tipo}"/>
        </div>
        <div>
            <button type="submit" >Guardar</button>
        </div>
    </form>
    <a href="/vehiculos">Regresar a la lista</a>
</body>
</html>