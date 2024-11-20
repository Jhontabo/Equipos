<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.sandoyorkk.Equipo" %>
<%
    Equipo equipoEditado = (Equipo) request.getAttribute("equipo");
    if (equipoEditado == null) {
        throw new IllegalStateException("No se encontró el equipo para editar.");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Equipo</title>
</head>
<body>
    <h1>Editar Equipo</h1>
    <form action="EquipoServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="guardarEdicion">
        <input type="hidden" name="id" value="<%= equipoEditado.getId() %>">

        <label>Nombre del Equipo:</label>
        <input type="text" name="nombreEquipo" value="<%= equipoEditado.getNombreEquipo() %>" required>

        <label>País:</label>
        <input type="text" name="pais" value="<%= equipoEditado.getPais() %>" required>

        <label>Entrenador:</label>
        <input type="text" name="entrenador" value="<%= equipoEditado.getEntrenador() %>" required>

        <label>Año de Fundación:</label>
        <input type="number" name="añoFundacion" value="<%= equipoEditado.getAñoFundacion() %>" required>

        <label>Estadio:</label>
        <input type="text" name="estadio" value="<%= equipoEditado.getEstadio() %>" required>

        <label>Presidente:</label>
        <input type="text" name="presidente" value="<%= equipoEditado.getPresidente() %>" required>

        <label>Colores Primarios:</label>
        <input type="text" name="coloresPrimarios" value="<%= equipoEditado.getColoresPrimarios() %>" required>

        <label>Colores Secundarios:</label>
        <input type="text" name="coloresSecundarios" value="<%= equipoEditado.getColoresSecundarios() %>" required>

        <label>Imagen:</label>
        <input type="file" name="image" accept="image/*">
        <p>Imagen actual: <img src="imagenes/<%= equipoEditado.getImagen() %>" alt="Imagen del equipo" width="100"></p>

        <button type="submit">Guardar Cambios</button>
    </form>
</body>
</html>
