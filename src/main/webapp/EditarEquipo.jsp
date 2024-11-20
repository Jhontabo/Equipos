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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-top: 20px;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"], input[type="number"], input[type="file"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        img {
            max-width: 150px;
            height: auto;
            margin-top: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        button {
            width: 100%;
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

        @media (max-width: 768px) {
            form {
                padding: 15px;
            }

            button {
                font-size: 14px;
            }
        }
    </style>
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
        <p>Imagen actual:</p>
        <img src="imagenes/<%= equipoEditado.getImagen() %>" alt="Imagen del equipo">

        <button type="submit">Guardar Cambios</button>
    </form>
</body>
</html>
