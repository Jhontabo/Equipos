<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

                .container {
                    max-width: 800px;
                    margin: 20px auto;
                    padding: 20px;
                    background-color: white;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    border-radius: 8px;
                }

                h1 {
                    text-align: center;
                    color: #343a40;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin: 20px 0;
                }

                table,
                th,
                td {
                    border: 1px solid #ddd;
                }

                th,
                td {
                    padding: 10px;
                    text-align: center;
                }

                th {
                    background-color: #343a40;
                    color: white;
                }

                .actions button {
                    padding: 8px 12px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    margin: 5px;
                }

                .add-btn {
                    background-color: #28a745;
                    color: white;
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
            <div class="container">
                <h1>Gestión de Equipos - Champions</h1>
                <!-- Formulario para agregar un nuevo equipo -->
                <form action="AgregarEquipo" method="post" enctype="multipart/form-data">
                    <label>ID:</label>
                    <input type="number" name="ID" required><br><br>
                    <label>Nombre del Equipo:</label>
                    <input type="text" name="nombre_equipo" required><br><br>
                    <label>País:</label>
                    <input type="text" name="pais" required><br><br>
                    <label>Entrenador:</label>
                    <input type="text" name="entrenador" required><br><br>
                    <label>Año de Fundación:</label>
                    <input type="number" name="año_de_fundacion" required><br><br>
                    <label>Estadio:</label>
                    <input type="text" name="estadio" required><br><br>
                    <label>Presidente:</label>
                    <input type="text" name="presidente" required><br><br>
                    <label>Colores Primarios:</label>
                    <input type="text" name="colores_primarios" required><br><br>
                    <label>Colores Secundarios:</label>
                    <input type="text" name="colores_secundarios" required><br><br>
                    <label>Imagen:</label>
                    <input type="file" name="image" accept="image/*" required><br><br>
                    <button type="submit" class="add-btn">Agregar Equipo</button>
                </form>

                <!-- Tabla de equipos -->
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>País</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="equipo" items="${equipos}">
                            <tr>
                                <td>${equipo.ID}</td>
                                <td>${equipo.nombre_equipo}</td>
                                <td>${equipo.pais}</td>
                                <td class="actions">
                                    <form action="ActualizarEquipo" method="post" style="display:inline;">
                                        <input type="hidden" name="ID" value="${equipo.ID}">
                                        <button type="submit" class="edit-btn">Editar</button>
                                    </form>
                                    <form action="EliminarEquipo" method="post" style="display:inline;">
                                        <input type="hidden" name="ID" value="${equipo.ID}">
                                        <button type="submit" class="delete-btn">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </body>

        </html>