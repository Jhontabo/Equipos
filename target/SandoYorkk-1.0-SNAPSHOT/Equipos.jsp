<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mycompany.sandoyorkk.Equipo" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Equipos - Champions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        h1 {
            text-align: center;
            color: #0d47a1;
            margin-top: 20px;
        }

        form {
            margin: 20px auto;
            max-width: 600px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        button {
            background-color: #28a745;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border: none;
        }

        button:hover {
            background-color: #218838;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: separate;
            border-spacing: 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table thead {
            background-color: #0d47a1;
            color: white;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        table tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        table tr:hover {
            background-color: #e9ecef;
        }

        .actions button {
            width: auto;
            display: inline-block;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
        }

        .edit-btn {
            background-color: #ffc107;
            color: white;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <h1>Gestión de Equipos - Champions</h1>
    <!-- Formulario para agregar un nuevo equipo -->
    <form action="EquipoServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="agregar">

        <label>Nombre del Equipo:</label>
        <input type="text" name="nombreEquipo" required>

        <label>País:</label>
        <input type="text" name="pais" required>

        <label>Entrenador:</label>
        <input type="text" name="entrenador" required>

        <label>Año de Fundación:</label>
        <input type="number" name="añoFundacion" required>

        <label>Estadio:</label>
        <input type="text" name="estadio" required>

        <label>Presidente:</label>
        <input type="text" name="presidente" required>

        <label>Colores Primarios:</label>
        <input type="text" name="coloresPrimarios" required>

        <label>Colores Secundarios:</label>
        <input type="text" name="coloresSecundarios" required>

        <label>Imagen:</label>
        <input type="file" name="image" accept="image/*" required>

        <button type="submit">Agregar Equipo</button>
    </form>

    <!-- Tabla de equipos -->
    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>País</th>
                <th>Entrenador</th>
                <th>Año de Fundación</th>
                <th>Estadio</th>
                <th>Presidente</th>
                <th>Colores Primarios</th>
                <th>Colores Secundarios</th>
                <th>Imagen</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<Equipo> equipos = (ArrayList<Equipo>) request.getAttribute("equipos");
                if (equipos != null) {
                    for (Equipo equipo : equipos) {
            %>
            <tr>
                <td><%= equipo.getNombreEquipo() %></td>
                <td><%= equipo.getPais() %></td>
                <td><%= equipo.getEntrenador() %></td>
                <td><%= equipo.getAñoFundacion() %></td>
                <td><%= equipo.getEstadio() %></td>
                <td><%= equipo.getPresidente() %></td>
                <td><%= equipo.getColoresPrimarios() %></td>
                <td><%= equipo.getColoresSecundarios() %></td>
                <td>
                    <% if (equipo.getImagen() != null && !equipo.getImagen().isEmpty()) { %>
                        <img src="imagenes/<%= equipo.getImagen() %>" alt="<%= equipo.getNombreEquipo() %>" width="50">
                    <% } else { %>
                        Sin Imagen
                    <% } %>
                </td>
                <td class="actions">
                    <form action="EquipoServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="editar">
                        <input type="hidden" name="id" value="<%= equipo.getId() %>">
                        <button type="submit" class="edit-btn">Editar</button>
                    </form>

                    <form action="EquipoServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="eliminar">
                        <input type="hidden" name="id" value="<%= equipo.getId() %>">
                        <button type="submit" class="delete-btn">Eliminar</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>

</body>
</html>
